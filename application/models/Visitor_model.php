<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Visitor_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array(), $limit = array(), $order = array(), $with_num_rows = false) {
        $this->db->select("visitors.*,TIMESTAMPDIFF(MINUTE,come_in,last_activity) as time_spend");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        if (!empty($limit)) {
            $this->db->limit($limit['limit'], $limit['start']);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        } else {
            $this->db->order_by('come_in', 'DESC');
        }
        $data = $this->db->get("visitors");
        if ($with_num_rows == true) {
            $num_rows = $this->db->select('id')->where(!empty($condition) ? $condition : 1, TRUE)->count_all_results("visitors");
            return (object) array("data" => $data, "num_rows" => $num_rows);
        }
        return $data;
    }

    function count_by_date($date = '') {
        if ($date != "") {
            $sql = $this->db->select('count(distinct ip_address) as total')
                    ->where(array('DATE(come_in)' => $date))
                    ->get('visitors');
            if ($sql->num_rows() > 0) {
                return $sql->row()->total;
            } else {
                return 0;
            }
        }
    }

}
