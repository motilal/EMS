<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Common_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($table = '', $select = '*', $condition = array(), $limit = array(), $order = array(), $with_num_rows = false) {
        if ($select == "") {
            return;
        }
        $this->db->select($select);
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        if (!empty($limit)) {
            $this->db->limit($limit['limit'], $limit['start']);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $data = $this->db->get($table);
        if ($with_num_rows == true) {
            $num_rows = $this->db->select('id')->where(!empty($condition) ? $condition : 1, TRUE)->count_all_results($table);
            return (object) array("data" => $data, "num_rows" => $num_rows);
        }
        return $data;
    }

    public function get_row($table, $select = '*', $condition = array()) {
        $this->db->select($select);
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        $this->db->limit(1);
        $result = $this->db->get($table);
        return $result->num_rows() > 0 ? $result->row() : null;
    }

    public function updateVisitorCounter($table, $content_id = "") {
        if (!empty($table) && $content_id > 0) {
            $ip = $this->input->ip_address();
            $is_exist = $this->db->select('id')->where(array('ip_address' => $ip, 'DATE(created)' => date('Y-m-d'), 'content_type' => $table, 'content_id' => $content_id))->get('content_readers');
            if ($is_exist->num_rows() <= 0) {
                $insert_data = array('ip_address' => $ip, 'created' => date('Y-m-d H:i:s'), 'content_type' => $table, 'content_id' => $content_id);
                $this->db->insert('content_readers', $insert_data);
                $this->db->where(array('id' => $content_id))->set('total_views', 'total_views+1', false)->update($table);
            }
        }
    }

    public function getUserName($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("CONCAT_WS(' ',first_name,last_name) as fullname", false)
                    ->get_where("users", array("id" => $id));
            return $result->num_rows() > 0 ? $result->row()->fullname : null;
        }
        return false;
    }

}
