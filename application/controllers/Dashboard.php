<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Dashboard extends CI_Controller {

    public $viewData;

    function __construct() {
        parent::__construct();
        $this->site_santry->allow();
        $this->layout->set_layout("layout/layout_admin");
    }

    public function index($flag = "") {
        $this->viewData['title'] = "Dashboard";
        $this->viewData['total_companies'] = $this->db->select('id')->where(array('is_delete' => 0))->get('companies')->num_rows();
        $this->viewData['total_cities'] = $this->db->select('id')->where(array('is_delete' => 0))->get('cities')->num_rows();
        $this->viewData['total_services'] = $this->db->select('id')->where(array('is_delete' => 0))->get('services')->num_rows();
        $this->viewData['total_portals'] = $this->db->select('id')->where(array('is_delete' => 0))->get('portals')->num_rows();
        $this->layout->view('dashboard/index', $this->viewData);
    }

}
