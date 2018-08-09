<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class lead_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array(), $limit = array(), $order = array(), $with_num_rows = false) {
        $this->db->select("led.*,prtl.name as portal_name,services.name as service_name,cities.name as city_name");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        if (!empty($limit)) {
            $this->db->limit($limit['limit'], $limit['start']);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        } else {
            $this->db->order_by('led.created', 'DESC');
        }
        $this->db->join('services', 'services.id=led.services_id', 'LEFT');
        $this->db->join('cities', 'cities.id=led.cities_id', 'LEFT');
        $data = $this->db->join('portals as prtl', 'prtl.id=led.portals_id', 'LEFT')->get("leads as led");
        if ($with_num_rows == true) {
            $num_rows = $this->db->select('led.id')->where(!empty($condition) ? $condition : 1, TRUE)->join('portals as prtl', 'prtl.id=led.portals_id', 'LEFT')->count_all_results("leads as led");
            return (object) array("data" => $data, "num_rows" => $num_rows);
        }
        return $data;
    }

    public function get_leads_sent_history($condition = array(), $limit = array(), $order = array(), $with_num_rows = false) {
        $this->db->select("companies.name as company_name,leads.name as lead_name,leads.phone_number,leads.message,lsh.created,lsh.status as lead_sent_status,lsh.leads_id,lsh.id as leads_sent_history_id");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        if (!empty($limit)) {
            $this->db->limit($limit['limit'], $limit['start']);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        } else {
            $this->db->order_by('lsh.created', 'DESC');
        }
        $data = $this->db->join('leads', 'leads.id=lsh.leads_id', 'LEFT')->join('companies', 'companies.id=lsh.companies_id', 'LEFT')->get("leads_sent_history as lsh");
        if ($with_num_rows == true) {
            $num_rows = $this->db->select('led.id')->where(!empty($condition) ? $condition : 1, TRUE)->join('leads', 'leads.id=lsh.leads_id', 'LEFT')->join('companies', 'companies.id=lsh.companies_id', 'LEFT')->count_all_results("leads_sent_history as lsh");
            return (object) array("data" => $data, "num_rows" => $num_rows);
        }
        return $data;
    }

    public function get_leads_return_history($condition = array(), $limit = array(), $order = array(), $with_num_rows = false) {
        $this->db->select("companies.name as company_name,leads.name as lead_name,leads.phone_number,lrh.created,lrh.reason,lrh.approve_status,lrh.approve_by,lrh.approve_date,lrh.leads_id,lrh.id as lead_reaturn_history_id");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        if (!empty($limit)) {
            $this->db->limit($limit['limit'], $limit['start']);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        } else {
            $this->db->order_by('lrh.created', 'DESC');
        }
        $data = $this->db->join('leads', 'leads.id=lrh.leads_id', 'LEFT')->join('companies', 'companies.id=lrh.companies_id', 'LEFT')->get("leads_return_history as lrh");
        if ($with_num_rows == true) {
            $num_rows = $this->db->select('led.id')->where(!empty($condition) ? $condition : 1, TRUE)->join('leads', 'leads.id=lrh.leads_id', 'LEFT')->join('companies', 'companies.id=lrh.companies_id', 'LEFT')->count_all_results("leads_return_history as lrh");
            return (object) array("data" => $data, "num_rows" => $num_rows);
        }
        return $data;
    }

    public function getById($id, $join = false) {
        if (is_numeric($id) && $id > 0) {
            if ($join == false) {
                $result = $this->db->select("leads.*")
                        ->get_where("leads", array("id" => $id, 'is_delete' => '0'));
            } else {
                $this->db->select("led.*,prtl.name as portal_name,services.name as service_name,cities.name as city_name");
                $this->db->where(array("led.id" => $id, 'led.is_delete' => '0'));
                $this->db->join('services', 'services.id=led.services_id', 'LEFT');
                $this->db->join('cities', 'cities.id=led.cities_id', 'LEFT');
                $result = $this->db->join('portals as prtl', 'prtl.id=led.portals_id', 'LEFT')->get("leads as led");
            }
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function portals_options() {
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where(array("is_active" => 1))->get('portals');
        if ($sql->num_rows() > 0) {
            $array = array('' => 'Select Portal');
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            }
            return $array;
        } else {
            return false;
        }
    }

    public function get_lead_percent($lead_id) {
        if (is_numeric($lead_id) && $lead_id > 0) {
            $sql = $this->db->select('count(id) as total_sent', false)->where(['leads_id' => $lead_id])->get('leads_sent_history');
            if ($sql->num_rows() > 0) {
                $total_sent = $sql->row()->total_sent;
                if ($total_sent > 0 && MAX_LEAD_SENT_TO_COMPANY > 0) {
                    $percent = ($total_sent / MAX_LEAD_SENT_TO_COMPANY) * 100;
                    return $percent;
                }
            }
        }
        return 0;
    }

    public function lead_approve($lead_reaturn_history_id = "") {
        if (empty($lead_reaturn_history_id))
            return false;
        $lead_reaturn_history_sql = $this->db->select('id,leads_sent_history_id')->get_where('leads_return_history', array('id' => $lead_reaturn_history_id, 'approve_status' => 0));
        if ($lead_reaturn_history_sql->num_rows() > 0) {
            if ($this->db->update("leads_return_history", array('approve_status' => 1, 'approve_by' => $this->ion_auth->get_user_id(), 'approve_date' => date('Y-m-d H:i:s')), array("id" => $lead_reaturn_history_id))) {
                $lead_reaturn_history_row = $lead_reaturn_history_sql->row();
                /* decrement package lead counter */
                $companies_package_id = $this->db->select('companies_package_id')->where(array('id' => $lead_reaturn_history_row->leads_sent_history_id))->get('leads_sent_history')->row()->companies_package_id;
                $this->db->where(array("id" => $companies_package_id))->set('total_leads', 'total_leads+1', FALSE)->set('used_leads', 'used_leads-1', FALSE)->update("companies_package");
                return true;
            }
        }
    }

}
