<?php

/**
 * Description of Follow_up
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Follow_up extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->redirect = "admin";
        $this->site_santry->allow(array());
        $this->load->model(array('follow_up_model' => 'follow_up'));
        $this->layout->set_layout("admin/layout/layout_admin");
        $this->viewData['pageModule'] = 'Follow Up Manager';
    }

    public function index() {
        $this->acl->has_permission('follow_up-index');
        $condition = array('follow_up.is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->follow_up->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Follow Up Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Follow Up Listing';
        $this->viewData['breadcrumb'] = array('Follow Up Manager' => 'admin/follow_up', $this->viewData['title'] => '');
        $this->layout->view("admin/follow_up/index", $this->viewData);
    }

    public function manage($id = null) {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $this->viewData['title'] = "Add Follow Up";
        if ($id > 0) {
            $this->acl->has_permission('follow_up-edit');
            $this->viewData['data'] = $detail = $this->follow_up->getById($id);
            if (empty($detail)) {
                $this->session->set_flashdata("error", __('LinkExpired'));
                redirect('admin/follow_up');
            }
            $this->viewData['title'] = "Edit Follow Up";
        } else {
            $this->acl->has_permission('follow_up-add');
        }

        if ($this->form_validation->run() === TRUE) {
            $saveData = array(
                "member_name" => $this->input->post('member_name'),
                "follow_up_date" => $this->input->post('follow_up_date') != "" ? date('Y-m-d', strtotime($this->input->post('follow_up_date'))) : NULL,
                "status_id" => $this->input->post('follow_status'),
                "client_name" => $this->input->post('client_name'),
                "phone_number" => $this->input->post('phone_number'),
                "email" => $this->input->post('email')
            );
            if ($this->input->post('id') > 0) {
                $saveData['updated'] = date("Y-m-d H:i:s");
                $this->db->update("follow_up", $saveData, array("id" => $this->input->post('id')));
                $follow_up_id = $this->input->post('id');
                $this->session->set_flashdata("success", __('FollowUpUpdateSuccess'));
            } else {
                $saveData['created'] = date("Y-m-d H:i:s");
                $this->db->insert("follow_up", $saveData);
                $follow_up_id = $this->db->insert_id();
                $this->session->set_flashdata("success", __('FollowUpAddSuccess'));
            }
            redirect("admin/follow_up");
        }
        $this->viewData['pageModule'] = 'Add New Member';
        $this->viewData['datetimepicker_asset'] = true;
        $this->viewData['breadcrumb'] = array('Follow Up Manager' => 'admin/follow_up', $this->viewData['title'] => '');
        $this->layout->view("admin/follow_up/manage", $this->viewData);
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('follow_up-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("follow_up", array('is_delete' => '1'))) {
                    $response['success'] = __('FollowUpDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('follow_up-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("follow_up", array("is_active" => 0));
                    $response['success'] = __('FollowUpInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("follow_up", array("is_active" => 1));
                    $response['success'] = __('FollowUpActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function view($id = null) {
        $this->viewData['data'] = $data = $this->follow_up->getById($id);
        if (empty($data)) {
            show_404();
        }
        $this->viewData['title'] = "Follow Up Detail";
        $this->viewData['pageModule'] = 'Follow Up Detail';
        $this->viewData['breadcrumb'] = array('Follow Up Manager' => 'admin/follow_up', 'View Detail' => '');
        $this->layout->view("admin/follow_up/view", $this->viewData);
    }

}
