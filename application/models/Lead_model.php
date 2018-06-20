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
        $this->db->select("led.*,prtl.name as portal_name");
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
        $data = $this->db->join('portals as prtl', 'prtl.id=led.portals_id', 'LEFT')->get("leads as led");
        if ($with_num_rows == true) {
            $num_rows = $this->db->select('led.id')->where(!empty($condition) ? $condition : 1, TRUE)->join('portals as prtl', 'prtl.id=led.portals_id', 'LEFT')->count_all_results("leads as led");
            return (object) array("data" => $data, "num_rows" => $num_rows);
        }
        return $data;
    }

    public function get_leads_sent_history($condition = array(), $limit = array(), $order = array(), $with_num_rows = false) {
        $this->db->select("companies.name as company_name,leads.name as lead_name,leads.phone_number,leads.message,leads.created,lsh.status as lead_sent_status,lsh.leads_id");
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
        $this->db->select("companies.name as company_name,leads.name as lead_name,leads.phone_number,leads.created,lrh.reason,lrh.approve_status,lrh.approve_by,lrh.approve_date,lrh.leads_id,lrh.id as lead_reaturn_history_id");
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

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("leads.*")
                    ->get_where("leads", array("id" => $id));
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

}
