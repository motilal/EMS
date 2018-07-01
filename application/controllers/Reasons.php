<?php

/**
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Reasons extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->load->model(array('reason_model' => 'reason'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Reason Manager';
    }

    public function index() {
        $this->acl->has_permission('reason-index');
        $condition = array('is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->reason->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Reason Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Reason Listing';
        $this->viewData['breadcrumb'] = array('Reason Manager' => 'reasons', $this->viewData['title'] => '');
        $this->layout->view("reason/index", $this->viewData);
    }

    public function manage() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "name" => $this->input->post('name')
            );
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('reason-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("reasons", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('ReasonUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('reason-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("reasons", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('ReasonAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->reason->getById($resource_id);
                $detail->created = date(DATE_FORMATE, strtotime($detail->created));
                $detail->statusButtons = $this->layout->element('element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "reasons/changestatus", 'permissionKey' => "reason-status"), true);
                $detail->actionButtons = $this->layout->element('element/_module_action', array('id' => $detail->id, 'editUrl' => 'reasons/manage', 'deleteUrl' => 'reasons/delete', 'editPermissionKey' => 'reason-edit', 'deletePermissionKey' => 'reason-delete'), true);
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

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('reason-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("reasons", array('is_delete' => '1'))) {
                    $response['success'] = __('ReasonDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('reason-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("reasons", array("is_active" => 0));
                    $response['success'] = __('ReasonInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("reasons", array("is_active" => 1));
                    $response['success'] = __('ReasonActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    function _is_unique_reason_name($str) {
        $condition = array('is_delete' => '0', 'name' => $str);
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('reasons', $condition)) {
            $this->form_validation->set_message('_is_unique_reason_name', 'The Reason name already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

}
