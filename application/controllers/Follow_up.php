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
        $this->site_santry->allow(array());
        $this->load->model(array('follow_up_model' => 'follow_up'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Follow Up Manager';
    }

    public function index() {
        $this->acl->has_permission('follow_up-index');
        $condition = array('follow_up.is_delete' => '0');
        if ($this->ion_auth->is_subadmin() === TRUE) {
            $condition['follow_up.users_id'] = $this->ion_auth->get_user_id();
        }
        $start = (int) $this->input->get('start');
        if ($this->input->get('download') == 'report') {
            if ($this->input->get('datefrom') != "" && $this->input->get('dateto') != "") {
                $dateFrom = date('Y-m-d', strtotime($this->input->get('datefrom')));
                $dateTo = date('Y-m-d', strtotime($this->input->get('dateto')));
            } else {
                $dateFrom = date('Y-01-01');
                $dateTo = date('Y-m-d');
            }
            $condition["DATE(follow_up.follow_up_date) BETWEEN '$dateFrom' AND '$dateTo'"] = NULL;
            $csv_array[] = array('name' => 'Member Name', 'company_name' => 'Client Name', 'client_phone' => 'Client Phone', 'client_email' => 'Client Email', 'follow_date' => 'Follow Date', 'follow_status' => 'Follow Status', 'status' => 'Status', 'created' => 'Created', 'updated' => 'Last Modify');
            $result = $this->follow_up->get_list($condition);
            if ($result->num_rows() > 0) {
                foreach ($result->result() as $row) {
                    $this->load->helper('csv');
                    $follow_status = $this->config->item('follow_status');
                    $csv_array[] = array('name' => $row->username, 'company_name' => $row->company_name, 'client_phone' => $row->phone_number, 'client_email' => $row->email, 'follow_date' => $row->follow_up_date, 'follow_status' => isset($follow_status[$row->status_id]) ? $follow_status[$row->status_id] : '', 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)), 'updated' => $row->updated != "" ? date(DATETIME_FORMATE, strtotime($row->updated)) : '');
                }
            } else {
                $this->session->set_flashdata("error", __('No records found'));
                redirect('follow_up');
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "FollowUp_report_{$dateFrom}_to_{$dateTo}.csv");
            exit();
        }
        $result = $this->follow_up->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Follow Up Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['daterangepicker_asset'] = true;
        $this->viewData['pageHeading'] = 'Follow Up Listing';
        $this->viewData['breadcrumb'] = array('Follow Up Manager' => 'follow_up', $this->viewData['title'] => '');
        $this->layout->view("follow_up/index", $this->viewData);
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
                redirect('follow_up');
            }
            if ($this->ion_auth->is_subadmin() === TRUE && $this->ion_auth->get_user_id() != $detail->users_id) {
                $this->session->set_flashdata("error", 'You don\'t have permission to edit this record');
                redirect('follow_up');
            }
            $this->viewData['title'] = "Edit Follow Up";
        } else {
            $this->acl->has_permission('follow_up-add');
        }

        if ($this->form_validation->run() === TRUE) {
            $saveData = array(
                "follow_up_date" => $this->input->post('follow_up_date') != "" ? date('Y-m-d', strtotime($this->input->post('follow_up_date'))) : NULL,
                "status_id" => $this->input->post('follow_status'),
                "companies_id" => $this->input->post('company'),
                "phone_number" => $this->input->post('phone_number'),
                "email" => $this->input->post('email')
            );
            if ($this->ion_auth->is_admin() === TRUE) {
                $saveData['users_id'] = $this->input->post('users_id');
            } else if ($this->ion_auth->is_subadmin() === TRUE) {
                $saveData['users_id'] = $this->ion_auth->get_user_id();
            }
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
            redirect("follow_up");
        }
        $this->viewData['pageModule'] = 'Add New Follow Up';
        $this->viewData['datetimepicker_asset'] = true;
        if ($this->ion_auth->is_admin() === TRUE) {
            $this->load->model(['user_model' => 'user']);
            $this->viewData['users_options'] = $this->user->subadmin_options(TRUE);
        }
        $this->viewData['breadcrumb'] = array('Follow Up Manager' => 'follow_up', $this->viewData['title'] => '');
        $this->load->model(array("company_model" => 'company'));
        $this->viewData['company_options'] = $this->company->company_options(true);
        $this->layout->view("follow_up/manage", $this->viewData);
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('follow_up-delete', FALSE);
            if ($has_permission === TRUE) {
                $condition = array("id" => $id);
                if ($this->ion_auth->is_subadmin() === TRUE) {
                    $condition['users_id'] = $this->ion_auth->get_user_id();
                }
                if ($id > 0 && $this->db->where($condition)->update("follow_up", array('is_delete' => '1'))) {
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
                $condition = array("id" => $id);
                if ($this->ion_auth->is_subadmin() === TRUE) {
                    $condition['users_id'] = $this->ion_auth->get_user_id();
                }
                $status = $this->input->post('status');
                if ($status == "1") {
                    if ($this->db->where($condition)->update("follow_up", array("is_active" => 0))) {
                        $response['success'] = __('FollowUpInactiveSuccess');
                    }
                } else if ($status == "0") {
                    if ($this->db->where($condition)->update("follow_up", array("is_active" => 1))) {
                        $response['success'] = __('FollowUpActiveSuccess');
                    }
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
        if ($this->ion_auth->is_subadmin() === TRUE && $this->ion_auth->get_user_id() != $data->users_id) {
            $this->session->set_flashdata("error", 'You don\'t have permission to edit this record');
            redirect('follow_up');
        }
        $this->viewData['title'] = "Follow Up Detail";
        $this->viewData['pageModule'] = 'Follow Up Detail';
        $this->viewData['breadcrumb'] = array('Follow Up Manager' => 'follow_up', 'View Detail' => '');
        $this->layout->view("follow_up/view", $this->viewData);
    }

}
