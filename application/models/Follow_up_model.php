<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Follow_up_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array(), $order = array()) {
        $this->db->select("follow_up.*,CONCAT_WS(' ',users.first_name,users.last_name) as username,companies.name as company_name");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $this->db->join('companies', 'companies.id=follow_up.companies_id', 'LEFT');
        $data = $this->db->join('users', 'users.id=follow_up.users_id', 'LEFT')->get("follow_up");
        return $data;
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("follow_up.*")
                    ->get_where("follow_up", array("id" => $id));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

}
