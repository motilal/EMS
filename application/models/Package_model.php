<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Package_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array(), $order = array()) {
        $this->db->select("packages.*,servicetypes.name as servicetype_name,ptype.name as package_type_name");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $this->db->join('package_types ptype', 'ptype.id=packages.package_types_id', 'LEFT');
        $data = $this->db->join('servicetypes', 'servicetypes.id=packages.servicetypes_id', 'LEFT')->get("packages");
        return $data;
    }

    public function getById($id, $join = false) {
        if (is_numeric($id) && $id > 0) {
            if ($join == true) {
                $result = $this->db->select("packages.*,servicetypes.name as servicetype_name,ptype.name as package_type_name")
                        ->join('package_types ptype', 'ptype.id=packages.package_types_id', 'LEFT')
                        ->join('servicetypes', 'servicetypes.id=packages.servicetypes_id', 'LEFT')
                        ->get_where("packages", array("packages.id" => $id, 'packages.is_delete' => '0'));
            } else {
                $result = $this->db->select("packages.*")->get_where("packages", array("packages.id" => $id, 'packages.is_delete' => '0'));
            }
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function get_package_services($package_id) {
        if (is_numeric($package_id) && $package_id > 0) {
            $result = $this->db->select("services.name")
                    ->where(array('ps.is_delete' => 0, 'ps.packages_id' => $package_id))
                    ->join('services', 'services.id=ps.services_id', 'LEFT')
                    ->get("packages_service as ps");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_package_services_ids($package_id) {
        if (is_numeric($package_id) && $package_id > 0) {
            $result = $this->db->select("ps.services_id")
                    ->where(array('ps.is_delete' => 0, 'ps.packages_id' => $package_id))
                    ->get("packages_service as ps");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->services_id;
                }
            }
            return $array;
        }
    }

    public function packages_options() {
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where(array("is_active" => 1))->get('packages');
        if ($sql->num_rows() > 0) {
            $array = array('' => 'Select Package');
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            }
            return $array;
        } else {
            return false;
        }
    }

}
