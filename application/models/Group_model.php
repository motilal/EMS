<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Group_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array(), $order = array()) {
        $this->db->select("company_groups.*");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $data = $this->db->get("company_groups");
        return $data;
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("company_groups.*")
                    ->get_where("company_groups", array("id" => $id));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function getBySlag($type = "") {
        if ($type != "") {
            $result = $this->db->select("company_groups.*")
                    ->get_where("company_groups", array("slug" => $type, "status" => 1));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function get_company_groups($condition) {
        $result = $this->db->select("company_groups.*")
                ->join('subject_subcourses', 'company_groups.id=subject_subcourses.subject_id', 'INNER')
                ->where(!empty($condition) ? $condition : 1, TRUE)
                ->get("company_groups");
        return $result->num_rows() > 0 ? $result->result() : null;
    }

}
