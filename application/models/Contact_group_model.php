<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Contact_group_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array(), $order = array()) {
        $this->db->select("*");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $data = $this->db->get("contact_groups");
        return $data;
    }

    public function contact_groups_options($empty_element = false) {
        $sql = $this->db->select('name,id')->order_by('name', 'ASC')->where(array("is_active" => 1))->get('contact_groups');
        if ($sql->num_rows() > 0) {
            $array = array();
            if ($empty_element) {
                $array[''] = 'Select Contact Group';
            }
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            }
            return $array;
        } else {
            return false;
        }
    }

    public function group_contacts_ids($group_id) {
        $sql = $this->db->select('contacts_id')->where(array('contact_groups_id' => $group_id))->get('contacts_group');
        if ($sql->num_rows() > 0) {
            $array = array();
            foreach ($sql->result() as $row) {
                $array[] = $row->contacts_id;
            }
            return $array;
        } else {
            return false;
        }
    }

    public function get_group_contacts($group_id) {
        $sql = $this->db->select('contacts.name,contacts.contact')
                ->where(array('contact_groups_id' => $group_id))
                ->join('contacts', 'contacts.id=contacts_group.contacts_id AND contacts.is_active = 1', 'LEFT')
                ->get('contacts_group');
        return $sql;
    }

    public function group_contacts_count($group_id) {
        $sql = $this->db->select('id')->where(array('contact_groups_id' => $group_id))->get('contacts_group');
        return $sql->num_rows();
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("*")
                    ->get_where("contact_groups", array("id" => $id));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

}
