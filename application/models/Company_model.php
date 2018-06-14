<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Company_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array()) {
        $this->db->select("companies.*");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        $data = $this->db->get("companies");
        return $data;
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("companies.*")
                    ->get_where("companies", array("id" => $id));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function getBySlag($type = "") {
        if ($type != "") {
            $result = $this->db->select("companies.*")
                    ->get_where("companies", array("slug" => $type, "is_active" => 1));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function get_company_services($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("services.name")
                    ->where(array('cs.is_delete' => 0, 'cs.companies_id' => $companies_id))
                    ->join('services', 'services.id=cs.services_id', 'LEFT')
                    ->get("companies_service as cs");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_company_services_ids($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("services_id")
                    ->where(array('is_delete' => 0, 'companies_id' => $companies_id))
                    ->get("companies_service");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->services_id;
                }
            }
            return $array;
        }
    }

    public function get_company_cities($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("cities.name")
                    ->where(array('cc.is_delete' => 0, 'cc.companies_id' => $companies_id))
                    ->join('cities', 'cities.id=cc.cities_id', 'LEFT')
                    ->get("companies_city as cc");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_company_cities_ids($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("cities_id")
                    ->where(array('is_delete' => 0, 'companies_id' => $companies_id))
                    ->get("companies_city");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->cities_id;
                }
            }
            return $array;
        }
    }

}
