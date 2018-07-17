<?php

/**
 * Description of Services
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Services extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->load->model(array('service_model' => 'service', 'servicetype_model' => 'servicetype'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Sub Service Manager';
    }

    public function index() {
        $this->acl->has_permission('service-index');
        $condition = array('services.is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->service->get_list($condition);
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('name' => 'Name', 'code' => 'Code', 'service' => 'Service', 'status' => 'Status', 'created' => 'Created');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = array('name' => $row->name, 'code' => $row->code, 'service' => $row->service_name, 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "Subservices_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Sub Service Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Sub Service Listing';
        $this->viewData['breadcrumb'] = array('Sub Service Manager' => 'services', $this->viewData['title'] => '');
        $this->viewData['servicetypes_options'] = $this->servicetype->servicetypes_options();
        $this->layout->view("service/index", $this->viewData);
    }

    public function manage() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "name" => $this->input->post('name'),
                "code" => $this->input->post('code'),
                "servicetypes_id" => $this->input->post('servicetype')
            );
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('service-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("services", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('ServiceUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('service-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("services", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('ServiceAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->service->getById($resource_id);
                $servicetypedetail = $this->servicetype->getById($detail->servicetypes_id);
                $detail->servicetype_name = isset($servicetypedetail->name) ? $servicetypedetail->name : '';
                $detail->statusButtons = $this->layout->element('element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "services/changestatus", 'permissionKey' => "service-status"), true);
                $detail->actionButtons = $this->layout->element('element/_module_action', array('id' => $detail->id, 'editUrl' => 'services/manage', 'deleteUrl' => 'services/delete', 'editPermissionKey' => 'service-edit', 'deletePermissionKey' => 'service-delete'), true);
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
                $response['result'] = $this->service->getById($this->input->post('id'), $isJoin = false);
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
            $has_permission = $this->acl->has_permission('service-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("services", array('is_delete' => '1'))) {
                    $response['success'] = __('ServiceDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('service-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("services", array("is_active" => 0));
                    $response['success'] = __('ServiceInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("services", array("is_active" => 1));
                    $response['success'] = __('ServiceActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

}
