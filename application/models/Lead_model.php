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
