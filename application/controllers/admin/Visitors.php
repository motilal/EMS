<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Visitors extends CI_Controller {

    var $viewData = array();
    var $per_page = DEFAULT_PAGING;

    public function __construct() {
        parent::__construct();
        $this->site_santry->redirect = "admin";
        $this->site_santry->allow(array());
        is_allow_admin();
        $this->layout->set_layout("admin/layout/layout_admin");
        $this->load->model(array("visitor_model" => 'visitor'));
    }

    public function index() {
        $condition = array();
        if ($this->input->is_ajax_request()) {
            $orderColomn = array(1 => 'ip_address', 2 => 'come_in', 3 => 'last_activity', 4 => 'time_spend');
            $params = dataTableGetRequest($this->input->get(), $orderColomn);
            if (!empty($params->search)) {
                $keyword = $this->db->escape_str($params->search);
                $condition["(ip_address = '{$keyword}' OR date(come_in)='{$keyword}')"] = null;
            }
            $result = $this->visitor->get_list($condition, $params->limit, $params->order, TRUE);
            if ($result->data->num_rows() > 0) {
                $response['data'] = $this->showTableData($result->data->result());
            } else {
                $response['data'] = array();
            }
            $response['recordsFiltered'] = $response['recordsTotal'] = $result->num_rows;
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }

        $result = $this->visitor->get_list($condition, array('start' => 0, 'limit' => $this->per_page), '', TRUE);
        if ($result->data->num_rows() > 0) {
            $this->viewData['result'] = $this->showTableData($result->data->result());
        }
        $this->viewData['title'] = "Manage Visitors";
        $this->viewData['pageModule'] = 'Visitor Manager';
        $this->viewData['pageHeading'] = 'Visitors';
        $this->viewData['breadcrumb'] = array('Visitor Manager' => '');
        $this->viewData['datatable_asset'] = true;
        $this->layout->view("admin/visitor/index", $this->viewData);
    }

    private function showTableData($data) {
        $resultData = array();
        if ($data != "") {
            foreach ($data as $key => $row) {
                $rowData = array();
                $rowData[0] = getPageSerial($this->input->get('length'), $this->input->get('start'), $key);
                $rowData[1] = $row->ip_address;
                $rowData[2] = date(DATETIME_FORMATE, strtotime($row->come_in));
                $rowData[3] = $row->last_activity != "" ? date(DATETIME_FORMATE, strtotime($row->last_activity)) : '';
                $rowData[4] = $row->time_spend;
                $resultData[] = $rowData;
            }
        }
        return $resultData;
    }

}
