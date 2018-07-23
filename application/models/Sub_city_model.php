<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Sub_city_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array()) {
        $this->db->select("sub_cities.*,cities.name as city_name");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        $data = $this->db->join('cities', 'cities.id=sub_cities.cities_id', 'LEFT')->get("sub_cities");
        return $data;
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("*")
                    ->get_where("sub_cities", array("id" => $id, 'is_delete' => '0'));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function sub_cities_options($city_id = '') {
        $condition = array("is_active" => 1, 'is_delete' => '0');
        if (is_numeric($city_id) && $city_id > 0) {
            $condition['cities_id'] = $city_id;
        }
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where($condition)->get('sub_cities');
        if ($sql->num_rows() > 0) {
            $array = array(); 
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            }
            return $array;
        } else {
            return false;
        }
    }

}
