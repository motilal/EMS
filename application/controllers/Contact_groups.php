<?php

/** 
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Contact_groups extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->load->model(array('contact_group_model' => 'contact_group'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Contact Group Manager';
    }

    public function index() {
        $this->acl->has_permission('contact_group-index');
        $condition = array('is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->contact_group->get_list($condition);
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('name' => 'Name', 'status' => 'Status', 'created' => 'Created');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = array('name' => $row->name, 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "Contact_groups_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Contact Group Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Contact Group Listing';
        $this->viewData['breadcrumb'] = array('Contact Group Manager' => 'contact_groups', $this->viewData['title'] => '');
        $this->layout->view("contact_group/index", $this->viewData);
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
                $has_permission = $this->acl->has_permission('contact_group-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("contact_groups", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('ContactGroupUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('contact_group-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("contact_groups", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('ContactGroupAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->contact_group->getById($resource_id);
                $detail->created = date(DATE_FORMATE, strtotime($detail->created));
                $detail->statusButtons = $this->layout->element('element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "contact_groups/changestatus", 'permissionKey' => "contact_group-status"), true);
                $detail->actionButtons = $this->layout->element('element/_module_action', array('id' => $detail->id, 'editUrl' => 'contact_groups/manage', 'deleteUrl' => 'contact_groups/delete', 'editPermissionKey' => 'contact_group-edit', 'deletePermissionKey' => 'contact_group-delete'), true);
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
            $has_permission = $this->acl->has_permission('contact_group-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("contact_groups", array('is_delete' => '1'))) {
                    $response['success'] = __('ContactGroupDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('contact_group-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("contact_groups", array("is_active" => 0));
                    $response['success'] = __('ContactGroupInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("contact_groups", array("is_active" => 1));
                    $response['success'] = __('ContactGroupActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    function _is_unique_contact_group_name($str) {
        $condition = array('is_delete' => '0', 'name' => $str);
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('contact_groups', $condition)) {
            $this->form_validation->set_message('_is_unique_contact_group_name', 'The Group name already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

}
