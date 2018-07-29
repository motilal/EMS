<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Sub_cities extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->load->model(array('sub_city_model' => 'sub_city', 'city_model' => 'city'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Sub City Manager';
    }

    public function index() {
        $this->acl->has_permission('sub_city-index');
        $condition = array('sub_cities.is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->sub_city->get_list($condition);
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('name' => 'Name', 'City' => 'City Name', 'status' => 'Status', 'created' => 'Created', 'updated' => 'Updated');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = array('name' => $row->name, 'sub_city' => $row->city_name, 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)), 'updated' => date(DATETIME_FORMATE, strtotime($row->created)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "Sub_Cities_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Sub City Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Sub City Listing';
        $this->viewData['breadcrumb'] = array('Sub City Manager' => 'sub_cities', $this->viewData['title'] => '');
        $this->viewData['cities_options'] = $this->city->cities_options(TRUE);
        $this->layout->view("sub_city/index", $this->viewData);
    }

    public function manage() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "name" => $this->input->post('name'),
                "cities_id" => $this->input->post('city'),
                'pin_code' => $this->input->post('pin_code')
            );
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('sub_city-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("sub_cities", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('SubCityUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('sub_city-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("sub_cities", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('SubCityAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->sub_city->getById($resource_id);
                $citydetail = $this->city->getById($detail->cities_id);
                $detail->city_name = isset($citydetail->name) ? $citydetail->name : '';
                $detail->statusButtons = $this->layout->element('element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "sub_cities/changestatus", 'permissionKey' => "sub_city-status"), true);
                $detail->actionButtons = $this->layout->element('element/_module_action', array('id' => $detail->id, 'editUrl' => 'sub_cities/manage', 'deleteUrl' => 'sub_cities/delete', 'editPermissionKey' => 'sub_city-edit', 'deletePermissionKey' => 'sub_city-delete'), true);
                $response['data'] = $detail;
                $response['success'] = true;
            } else {
                $response['error'] = $has_permission;
            }
        } else {
            $response['validation_error'] = $this->form_validation->error_array();
        }
        $this->output->set_content_type('application/json')
                ->set_output(json_encode($response))->_display();
        exit();
    }

    public function getDetailAjax() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            if ($this->input->post('id') > 0) {
                $response['result'] = $this->sub_city->getById($this->input->post('id'), $isJoin = false);
            }
            $this->output->set_content_type('application/json')
                    ->set_output(json_encode($response))->_display();
            exit();
        }
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('sub_city-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("sub_cities", array('is_delete' => '1'))) {
                    $response['success'] = __('SubCityDeleteSuccess');
                } else {
                    $response['error'] = __('InvalidRequest');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function changestatus() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $has_permission = $this->acl->has_permission('sub_city-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("sub_cities", array("is_active" => 0));
                    $response['success'] = __('SubCityInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("sub_cities", array("is_active" => 1));
                    $response['success'] = __('SubCityActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    function _is_unique_sub_city_name($str) {
        $condition = array('is_delete' => '0', 'name' => $str, 'cities_id' => $this->input->post('city'));
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('sub_cities', $condition)) {
            $this->form_validation->set_message('_is_unique_sub_city_name', 'The Sub City name already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function _is_unique_pin_code($str) {
        $condition = array('is_delete' => '0', 'pin_code' => $str);
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('sub_cities', $condition)) {
            $this->form_validation->set_message('_is_unique_pin_code', 'The Pin code already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

}
