<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Servicetype_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_service_list($condition = array(), $order = array()) {
        $this->db->select("*");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $data = $this->db->get("servicetypes");
        return $data;
    }

    public function servicetypes_options() {
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where(array("is_active" => 1, 'is_delete' => '0'))->get('servicetypes');
        if ($sql->num_rows() > 0) {
            $array = array('' => 'Select Service');
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            }
            return $array;
        } else {
            return false;
        }
    }

    public function getServicetypeById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("*")
                    ->get_where("servicetypes", array("id" => $id, 'is_delete' => '0'));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

}
