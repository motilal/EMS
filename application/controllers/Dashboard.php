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
        $this->layout->view('dashboard/index', $this->viewData);
    }

}
