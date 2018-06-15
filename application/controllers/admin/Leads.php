<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Leads extends CI_Controller {

    var $viewData = array();
    var $per_page = DEFAULT_PAGING;

    public function __construct() {
        parent::__construct();
        $this->site_santry->redirect = "admin";
        $this->site_santry->allow(array());
        $this->layout->set_layout("admin/layout/layout_admin");
        $this->load->model(array("lead_model" => 'lead'));
    }

    public function index() {
        $this->acl->has_permission('lead-index');
        $condition = array('led.is_delete' => '0');
        if ($this->input->is_ajax_request()) {
            $orderColomn = array(1 => 'portal_name', 2 => 'record_id', 3 => 'led.name', 4 => 'led.email', 5 => 'led.phone_number', 6 => 'led.is_active');
            $params = dataTableGetRequest($this->input->get(), $orderColomn);
            if (!empty($params->search)) {
                $keyword = $this->db->escape_str($params->search);
                $condition["(prtl.name like '{$keyword}' OR led.record_id like '{$keyword}' OR led.email like '%{$keyword}%' OR led.phone_number like '%{$keyword}%' OR led.name like '%{$keyword}%' OR led.location like '%{$keyword}%' OR led.message like '%{$keyword}%')"] = null;
            }
            $result = $this->lead->get_list($condition, $params->limit, $params->order, TRUE);
            if ($result->data->num_rows() > 0) {
                $response['data'] = $this->showTableData($result->data->result());
            } else {
                $response['data'] = array();
            }
            $response['recordsFiltered'] = $response['recordsTotal'] = $result->num_rows;
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }

        $result = $this->lead->get_list($condition, array('start' => 0, 'limit' => $this->per_page), '', TRUE);
        if ($result->data->num_rows() > 0) {
            $this->viewData['result'] = $this->showTableData($result->data->result());
        }
        $this->viewData['title'] = "Manage Leads";
        $this->viewData['pageModule'] = 'Leads Manager';
        $this->viewData['pageHeading'] = 'Leads';
        $this->viewData['breadcrumb'] = array('Leads Manager' => '');
        $this->viewData['datatable_asset'] = true;
        $this->layout->view("admin/lead/index", $this->viewData);
    }

    public function manage($id = null) {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $this->viewData['title'] = "Add Leads";
        if ($id > 0) {
            $this->acl->has_permission('lead-edit');
            $this->viewData['data'] = $detail = $this->lead->getById($id);
            if (empty($detail)) {
                $this->session->set_flashdata("error", __('LinkExpired'));
                redirect('admin/leads');
            }
            $this->viewData['title'] = "Edit Leads";
        } else {
            $this->acl->has_permission('lead-add');
        }

        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "title" => $this->input->post('title'),
                "category" => $this->input->post('category'),
                "short_description" => $this->input->post('short_description'),
                "description" => $this->input->post('description', false),
                "meta_keywords" => $this->input->post("meta_keywords"),
                "meta_description" => $this->input->post("meta_description")
            );
            if (isset($_FILES['image']['name']) && $_FILES['image']['name'] != "") {
                $fileUpload = $this->do_upload();
                if (isset($fileUpload['error']) && $fileUpload['error'] != "") {
                    $this->session->set_flashdata("error", $fileUpload['error']);
                    redirect("admin/leads/manage/$id");
                } else {
                    @unlink(FORM_ALERT_IMG_PATH . $detail->image);
                    $data['image'] = $fileUpload['upload_data']['file_name'];
                }
            }
            if ($id > 0) {
                $data['slug'] = create_unique_slug($this->input->post('title'), 'leads', 'slug', 'id', $id);
            } else {
                $data['slug'] = create_unique_slug($this->input->post('title'), 'leads', 'slug');
            }
            if ($this->input->post('id') > 0) {
                $data['updated'] = date("Y-m-d H:i:s");
                $this->db->update("leads", $data, array("id" => $this->input->post('id')));
                $this->session->set_flashdata("success", __('LeadUpdateSuccess'));
            } else {
                $data['created'] = date("Y-m-d H:i:s");
                $data['user_id'] = $this->ion_auth->get_user_id();
                $this->db->insert("leads", $data);
                $this->session->set_flashdata("success", __('LeadAddSuccess'));
            }
            redirect("admin/leads");
        }

        $this->viewData['ckeditor_asset'] = true;
        $this->viewData['pageModule'] = 'Add Leads';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'admin/leads', $this->viewData['title'] => '');
        $this->viewData['datetimepicker_asset'] = true;
        $this->viewData['portals_options'] = $this->lead->portals_options();
        $this->layout->view("admin/lead/manage", $this->viewData);
    }

    public function view($id = null) {
        $this->viewData['data'] = $data = $this->lead->getById($id);
        if (empty($data)) {
            show_404();
        }
        $data->portal_name = '';
        if ($data->portals_id > 0) {
            $portal_sql = $this->db->select('name')->get_where('portals', array('id' => $data->portals_id));
            if ($portal_sql->num_rows() > 0) {
                $data->portal_name = $portal_sql->row()->name;
            }
        }
        $this->viewData['title'] = "Lead Detail";
        $this->viewData['pageModule'] = 'Lead Detail';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'admin/leads', 'View Detail' => '');
        $this->layout->view("admin/lead/view", $this->viewData);
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('lead-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("leads", array('is_delete' => '1'))) {
                    $response['success'] = __('LeadDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('lead-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("leads", array("is_active" => 0));
                    $response['success'] = __('LeadInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("leads", array("is_active" => 1));
                    $response['success'] = __('LeadActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    private function showTableData($data) {
        $resultData = array();
        if ($data != "") {
            foreach ($data as $key => $row) {
                $rowData = array();
                $rowData[0] = getPageSerial($this->input->get('length'), $this->input->get('start'), $key);
                $rowData[1] = $row->portal_name;
                $rowData[2] = $row->record_id;
                $rowData[3] = $row->name;
                $rowData[4] = $row->email;
                $rowData[5] = $row->phone_number;
                $rowData[6] = $this->layout->element('admin/element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "admin/leads/changestatus", 'permissionKey' => "lead-status"), true);
                $editUrl = 'admin/leads/manage/' . $row->id;
                $deleteUrl = 'admin/leads/delete';
                $rowData[7] = $this->layout->element('admin/element/_module_action', array('id' => $row->id, 'editUrl' => $editUrl, 'deleteUrl' => $deleteUrl, 'editPermissionKey' => 'lead-edit', 'deletePermissionKey' => 'lead-delete'), true);
                $resultData[] = $rowData;
            }
        }
        return $resultData;
    }

}
