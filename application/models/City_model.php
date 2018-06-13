<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class City_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_city_list($condition = array(), $order = array()) {
        $this->db->select("*");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $data = $this->db->get("cities");
        return $data;
    }

    public function cities_options() {
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where(array("status" => 1, 'is_delete' => '0'))->get('cities');
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

    public function getServiceById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("*")
                    ->get_where("cities", array("id" => $id, 'is_delete' => '0'));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

}

?>
