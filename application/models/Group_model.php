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
        $this->db->select("company_groups.*,cities.name as city_name");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $data = $this->db->join('cities', 'cities.id=company_groups.cities_id', 'LEFT')->get("company_groups");
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
                    ->get_where("company_groups", array("slug" => $type, "is_active" => 1));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function get_group_companies($company_groups_id) {
        if (is_numeric($company_groups_id) && $company_groups_id > 0) {
            $result = $this->db->select("companies.name,companies.id")
                    ->where(array('cg.is_delete' => 0, 'cg.company_groups_id' => $company_groups_id))
                    ->join('companies', 'companies.id=cg.companies_id', 'INNER')
                    ->get("companies_group as cg");
            $array = array();
            if ($result->num_rows()) {
                return $result->result();
            }
            return $array;
        }
    }

}
