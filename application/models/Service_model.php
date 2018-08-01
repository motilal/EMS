<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Service_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array()) {
        $this->db->select("services.*,servicetypes.name as servicetype_name");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        $data = $this->db->join('servicetypes', 'servicetypes.id=services.servicetypes_id', 'LEFT')->get("services");
        return $data;
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("*")
                    ->get_where("services", array("id" => $id, 'is_delete' => '0'));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function services_options($servicetype_id = '', $empty_element = false) {
        $condition = array("is_active" => 1, 'is_delete' => '0');
        if (is_numeric($servicetype_id) && $servicetype_id > 0) {
            $condition['servicetypes_id'] = $servicetype_id;
        }
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where($condition)->get('services');
        if ($sql->num_rows() > 0) {
            $array = array();
            if ($empty_element) {
                $array[''] = 'Select Service';
            }
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            } 
            return $array;
        } else {
            return false;
        }
    }

}
