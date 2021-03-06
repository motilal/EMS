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
        $this->site_santry->allow(array());
        $this->layout->set_layout("layout/layout_admin");
        $this->load->model(array("lead_model" => 'lead', 'portal_model' => 'portal'));
    }

    public function index($type = 'inbox', $portal_id = '') {
        $this->acl->has_permission('lead-index');
        $condition = array('led.is_delete' => '0');
        if ($portal_id != "") {
            $condition['led.portals_id'] = $portal_id;
            $portalDetail = $this->portal->getById($portal_id);
        }
        if ($type == 'pending') {
            $condition['led.status'] = 0;
        } else if ($type == 'sent') {
            $condition['led.status'] = 1;
        }
        if ($this->input->get('download') == 'report') {
            $this->generateLeadReport($condition, $type);
        }

        $this->viewData['type'] = $type;
        $this->viewData['portal_id'] = isset($portal_id) ? $portal_id : '';
        if ($this->input->is_ajax_request()) {
            $orderColomn = array(1 => 'led.name', 2 => 'led.phone_number', 3 => 'services.name', 4 => 'cities.name', 5 => 'led.date', 6 => 'led.status', 7 => 'led.is_active');
            $params = dataTableGetRequest($this->input->get(), $orderColomn);
            if (!empty($params->search)) {
                $keyword = $this->db->escape_str($params->search);
                $condition["(prtl.name like '{$keyword}' OR led.record_id like '{$keyword}' OR led.email like '%{$keyword}%' OR led.phone_number like '%{$keyword}%' OR led.name like '%{$keyword}%' OR led.source_location like '%{$keyword}%' OR led.message like '%{$keyword}%')"] = null;
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
        if (isset($portalDetail->name)) {
            $this->viewData['pageModule'] = 'Leads Manager (' . $portalDetail->name . ')';
        } else {
            $this->viewData['pageModule'] = 'Leads Manager';
        }
        $this->viewData['pageHeading'] = 'Leads';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'portals', 'Lead ' . ucfirst($type) => '');
        $this->viewData['datatable_asset'] = true;
        $this->viewData['daterangepicker_asset'] = true;
        $this->load->model('company_model', 'company');
        $this->layout->view("lead/index", $this->viewData);
    }

    private function showTableData($data) {
        $resultData = array();
        if ($data != "") {
            foreach ($data as $key => $row) {
                $rowData = array();
                $rowData[0] = getPageSerial($this->input->get('length'), $this->input->get('start'), $key);
                $rowData[1] = $row->name;
                $rowData[2] = $row->phone_number;
                $rowData[3] = $row->service_name;
                $rowData[4] = $row->city_name;
                $rowData[5] = date(DATETIME_FORMATE, strtotime($row->created));
                $leadPercent = $this->lead->get_lead_percent($row->id);
                if ($row->status == 0) {
                    $leadStatus = '<span class="text-red">Pending<span>';
                } else if ($row->status == 1) {
                    $leadStatus = '<span class="text-green">Sent (' . $leadPercent . '%)</span>';
                } else if ($row->status == 3) {
                    $leadStatus = '<span class="text-warning">Duplicate</span>';
                }
                $rowData[6] = $leadStatus;
                $rowData[7] = $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "leads/changestatus", 'permissionKey' => "lead-status"), true);
                $editUrl = 'leads/manage/' . $row->id;
                $viewUrl = 'leads/view/' . $row->id;
                $deleteUrl = 'leads/delete';
                $sendLeadUrl = ($row->status == 0 || $leadPercent < 100) ? 'leads/send_lead/' . $row->id : '';
                $rowData[8] = $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => $editUrl, 'sendLeadUrl' => $sendLeadUrl, 'deleteUrl' => $deleteUrl, 'viewUrl' => $viewUrl, 'editPermissionKey' => 'lead-edit', 'deletePermissionKey' => 'lead-delete'), true);
                $resultData[] = $rowData;
            }
        }
        return $resultData;
    }

    public function manage($id = null) {
        $this->load->model(array('service_model' => 'service'));
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $this->viewData['title'] = "Add Leads";
        if ($id > 0) {
            $this->acl->has_permission('lead-edit');
            $this->viewData['data'] = $detail = $this->lead->getById($id);
            if (empty($detail)) {
                $this->session->set_flashdata("error", __('LinkExpired'));
                redirect('leads');
            }
            $this->viewData['title'] = "Edit Leads";
        } else {
            $this->acl->has_permission('lead-add');
        }

        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "portals_id" => $this->input->post('portals_id'),
                "services_id" => $this->input->post('services_id') != "" ? $this->input->post('services_id') : NULL,
                "name" => $this->input->post('name'),
                "email" => $this->input->post('email'),
                "source_location" => $this->input->post('source_location'),
                "destination_location" => $this->input->post('destination_location') != "" ? $this->input->post('destination_location') : NULL,
                "phone_number" => $this->input->post("phone_number"),
                "date" => $this->input->post("date") != "" ? date('Y-m-d', strtotime($this->input->post("date"))) : NULL,
                'message' => $this->input->post("message")
            );
            $this->load->library('send_lead');
            $cities_id = $this->send_lead->getCityByAddress($this->input->post('source_location'));
            $sub_cities_id = $this->send_lead->getZipByAddress($this->input->post('source_location'));
            if ($this->input->post('destination_location') != "") {
                $destination_cities_id = $this->send_lead->getCityByAddress($this->input->post('destination_location'));
                $destination_sub_cities_id = $this->send_lead->getZipByAddress($this->input->post('destination_location'));
            }
            $data['cities_id'] = $cities_id;
            $data['sub_cities_id'] = !empty($sub_cities_id) ? $sub_cities_id : NULL;
            $data['destination_cities_id'] = !empty($destination_cities_id) ? $destination_cities_id : NULL;
            $data['destination_sub_cities_id'] = !empty($destination_sub_cities_id) ? $destination_sub_cities_id : NULL;

            if ($this->input->post('id') > 0) {
                $data['updated'] = date("Y-m-d H:i:s");
                $this->db->update("leads", $data, array("id" => $this->input->post('id')));
                $this->session->set_flashdata("success", __('LeadUpdateSuccess'));
            } else {
                $data['created'] = date("Y-m-d H:i:s");
                $this->db->insert("leads", $data);
                $this->session->set_flashdata("success", __('LeadAddSuccess'));
            }
            redirect("leads/index/inbox/" . $this->input->post('portals_id'));
        }

        $this->viewData['ckeditor_asset'] = true;
        $this->viewData['pageModule'] = 'Add Leads';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'leads', $this->viewData['title'] => '');
        $this->viewData['datetimepicker_asset'] = true;
        $this->viewData['portals_options'] = $this->lead->portals_options();
        $this->viewData['services_options'] = $this->service->services_options('', TRUE);
        $this->load->model(array('city_model' => 'city'));
        $this->viewData['city_options'] = $this->city->cities_options(true
        );
        $this->layout->view("lead/manage", $this->viewData);
    }

    public function view($id = null) {
        $this->viewData['data'] = $data = $this->lead->getById($id, true);
        if (empty($data)) {
            show_404();
        }
        $this->viewData['title'] = "Lead Detail";
        $this->viewData['pageModule'] = 'Lead Detail';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'leads', 'View Detail' =>
            '');
        $this->layout->view("lead/view", $this->viewData);
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

    public function leads_sent_history($portal_id = NULL) {
        $this->acl->has_permission('lead-sent-history');
        $condition = array('leads.is_delete' => '0');
        if ($portal_id != "") {
            $condition['leads.portals_id'] = $portal_id;
            $portalDetail = $this->portal->getById($portal_id);
        }
        if ($this->input->get('download') == 'report') {
            $this->generateLeadSentReport($condition);
        }
        $this->viewData['portal_id'] = isset($portal_id) ? $portal_id : '';
        if ($this->input->is_ajax_request()) {
            $orderColomn = array(1 => 'companies.name', 2 => 'leads.name', 3 => 'leads.phone_number', 4 => 'leads.message', 5 => 'lsh.created');
            $params = dataTableGetRequest($this->input->get(), $orderColomn);
            if (!empty($params->search)) {
                $keyword = $this->db->escape_str($params->search);
                $condition["(companies.name like '{$keyword}' OR leads.record_id like '{$keyword}' OR leads.email like '%{$keyword}%' OR leads.phone_number like '%{$keyword}%' OR leads.name like '%{$keyword}%' OR leads.location like '%{$keyword}%' OR leads.message like '%{$keyword}%')"] = null;
            } 
            $result = $this->lead->get_leads_sent_history($condition, $params->limit, $params->order, TRUE);
            if ($result->data->num_rows() > 0) {
                $response['data'] = $this->showLeadSentTableData($result->data->result());
            } else {
                $response['data'] = array();
            }
            $response['recordsFiltered'] = $response['recordsTotal'] = $result->num_rows;
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }

        $result = $this->lead->get_leads_sent_history($condition, array('start' => 0, 'limit' => $this->per_page), '', TRUE);
        if ($result->data->num_rows() > 0) {
            $this->viewData['result'] = $this->showLeadSentTableData($result->data->result());
        }
        $this->viewData['title'] = "Leads Sent History";
        if (isset($portalDetail->name)) {
            $this->viewData['pageModule'] = 'Leads Manager (' . $portalDetail->name . ')';
        } else {
            $this->viewData['pageModule'] = 'Leads Manager';
        }
        $this->viewData['pageHeading'] = 'Leads Sent History';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'portals', 'Lead Sent History' => '');
        $this->viewData['datatable_asset'] = true;
        $this->load->model('reason_model', 'reason');
        $this->viewData['reason_options'] = $this->reason->reasons_options(true);
        $this->viewData['daterangepicker_asset'] = true;
        $this->layout->view("lead/leads_sent_history", $this->viewData);
    }

    public function leads_return_history($portal_id = NULL) {
        $this->acl->has_permission('lead-return-history');
        $condition = array('leads.is_delete' => '0');
        if ($portal_id != "") {
            $condition['leads.portals_id'] = $portal_id;
            $portalDetail = $this->portal->getById($portal_id);
        }
        if ($this->input->get('download') == 'report') {
            $this->generateLeadReturnReport($condition);
        }
        $this->viewData['portal_id'] = isset($portal_id) ? $portal_id : '';
        if ($this->input->is_ajax_request()) {
            $orderColomn = array(1 => 'companies.name', 2 => 'leads.name', 3 => 'leads.phone_number', 4 => 'leads.message', 5 => 'approve_date', 6 => 'approve_by', 7 => 'approve_status');
            $params = dataTableGetRequest($this->input->get(), $orderColomn);
            if (!empty($params->search)) {
                $keyword = $this->db->escape_str($params->search);
                $condition["(companies.name like '{$keyword}' OR leads.record_id like '{$keyword}' OR leads.email like '%{$keyword}%' OR leads.phone_number like '%{$keyword}%' OR leads.name like '%{$keyword}%' OR leads.location like '%{$keyword}%' OR lrh.reason like '%{$keyword}%' OR leads.message like '%{$keyword}%')"] = null;
            }
            $result = $this->lead->get_leads_return_history($condition, $params->limit, $params->order, TRUE);
            if ($result->data->num_rows() > 0) {
                $response['data'] = $this->showLeadReturnTableData($result->data->result());
            } else {
                $response['data'] = array();
            }
            $response['recordsFiltered'] = $response['recordsTotal'] = $result->num_rows;
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }

        $result = $this->lead->get_leads_return_history($condition, array('start' => 0, 'limit' => $this->per_page), '', TRUE);
        if ($result->data->num_rows() > 0) {
            $this->viewData['result'] = $this->showLeadReturnTableData($result->data->result());
        }
        $this->viewData['title'] = "Leads Return History";
        if (isset($portalDetail->name)) {
            $this->viewData['pageModule'] = 'Leads Manager (' . $portalDetail->name . ')';
        } else {
            $this->viewData['pageModule'] = 'Leads Manager';
        }
        $this->viewData['pageHeading'] = 'Leads Sent History';
        $this->viewData['breadcrumb'] = array('Leads Manager' => 'portals', 'Lead Return History' => '');
        $this->viewData['datatable_asset'] = true;
        $this->layout->view("lead/leads_return_history", $this->viewData);
    }

    public function add_lead_return_request() {
        $has_permission = $this->acl->has_permission('add-lead-return-request', FALSE);
        $response = array();
        if ($has_permission === TRUE) {
            if ($this->input->post()) {
                $this->load->library('form_validation');
                if ($this->form_validation->run('add_lead_return_request') === TRUE) {
                    $lead_sent_history_sql = $this->db->select('id,leads_id,companies_id')->get_where('leads_sent_history', array('id' => (int) $this->input->post('id'), 'status' => 1));
                    if ($lead_sent_history_sql->num_rows() > 0) {
                        $lead_sent_history_row = $lead_sent_history_sql->row();
                        $data = array(
                            'companies_id' => $lead_sent_history_row->companies_id,
                            'leads_id' => $lead_sent_history_row->leads_id,
                            'leads_sent_history_id' => $lead_sent_history_row->id,
                            'reason' => $this->input->post('reason'),
                            'reasons_id' => $this->input->post('reason_id'),
                            'approve_status' => 0,
                            'created' => date("Y-m-d H:i:s")
                        );
                        $this->db->insert("leads_return_history", $data);
                        if ($this->db->update("leads_sent_history", array('status' => 2), array("id" => $lead_sent_history_row->id))) {
                            $response['success'] = true;
                            $response['msg'] = __('LeadReturnRequestAddSuccess');
                        }
                    } else {
                        $response['error'] = 'Something error.';
                    }
                } else {
                    $response['validation_error'] = $this->form_validation->error_array();
                }
            }
        } else {
            $response['error'] = $has_permission;
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
        exit();
    }

    function resend_lead($leads_sent_history_id = "") {
        if (is_numeric($leads_sent_history_id) && $leads_sent_history_id > 0) {
            $this->load->library('send_lead');
            $resendLead = $this->send_lead->resend_lead($leads_sent_history_id);
            if ($resendLead === TRUE) {
                $this->session->set_flashdata("success", __('LeadResendSuccess'));
            }
            redirect('leads/leads_sent_history');
        }
    }

    function send_lead($leads_id = "") {
        $has_permission = $this->acl->has_permission('send-lead', FALSE);
        $response = [];
        if ($has_permission === TRUE) {
            if (is_numeric($leads_id) && $leads_id > 0) {
                $this->load->model('company_model', 'company');
                if ($this->input->post()) {
                    $this->load->library('form_validation');
                    if ($this->form_validation->run('send_lead') === TRUE) {
                        $company_ids = $this->input->post('companies_id');
                        $this->load->library('send_lead');
                        $sendLead = $this->send_lead->send_manual($leads_id, $company_ids);
                        if (isset($sendLead['status']) && $sendLead['status'] == 'success') {
                            $response['success'] = true;
                            $this->session->set_flashdata('success', $sendLead['message']);
                            $response['msg'] = $sendLead['message'];
                        } else {
                            $response['error'] = isset($sendLead['message']) ? $sendLead['message'] : 'Something error';
                        }
                    } else {
                        $response['validation_error'] = $this->form_validation->error_array();
                    }
                }
            }
        } else {
            $response['error'] = $has_permission;
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
        exit();
    }

    function approve_return_lead($lead_reaturn_history_id = "") {
        if (is_numeric($lead_reaturn_history_id) && $lead_reaturn_history_id > 0) {
            $has_permission = $this->acl->has_permission('approve-return-lead', FALSE);
            if ($has_permission === TRUE) {
                if ($this->lead->lead_approve($lead_reaturn_history_id)) {
                    $this->session->set_flashdata("success", __('LeadReturnApproveSuccess'));
                } else {
                    $this->session->set_flashdata("error", __('LinkExpired'));
                }
            } else {
                $this->session->set_flashdata("error", $has_permission);
            }
            redirect('leads/leads_return_history');
        }
    }

    public function actions() {
        $this->load->library('form_validation');
        if ($this->form_validation->run('multi_action') === TRUE) {
            if ($this->input->post("actions") == "return_approve") {
                $has_permission = $this->acl->has_permission('approve-return-lead', FALSE);
                if ($has_permission === TRUE) {
                    $ids = $this->input->post('ids');
                    if (!empty($ids)) {
                        foreach ($ids as $lead_reaturn_history_id) {
                            $this->lead->lead_approve($lead_reaturn_history_id);
                        }
                    }
                    $this->session->set_flashdata("success", __('LeadReturnApproveSuccess'));
                } else {
                    $this->session->set_flashdata("error", $has_permission);
                }
            }
        }
        $current_url = $this->input->post("current_url") != "" ? $this->input->post("current_url") : '/';
        redirect($current_url);
    }

    private function showLeadSentTableData($data) {
        $resultData = array();
        if ($data != "") {
            $add_lead_return_has_permission = $this->acl->has_permission('add-lead-return-request', FALSE);
            $resend_lead_has_permission = $this->acl->has_permission('resend-lead', FALSE);
            foreach ($data as $key => $row) {
                $rowData = array();
                $rowData[0] = getPageSerial($this->input->get('length'), $this->input->get('start'), $key);
                $rowData[1] = $row->company_name;
                $rowData[2] = $row->lead_name;
                $rowData[3] = $row->phone_number;
                $rowData[4] = $row->message;
                $rowData[5] = date(DATETIME_FORMATE, strtotime($row->created));
                $rowData[6] = '';
                if ($row->lead_sent_status == 1) {
                    $rowData[6] = '<span class="text-green">Sent<span>';
                    $return_lead_btn = '';
                    if ($add_lead_return_has_permission === true) {
                        $return_lead_btn = '<a class="label label-danger return-lead" href="#" data-id="' . $row->leads_sent_history_id . '" data-toggle="modal" data-target="#modal-return-lead">Return</a>';
                    }
                    $resend_lead_btn = '';
                    $diff = abs(strtotime(date('Y-m-d')) - strtotime(date('Y-m-d', strtotime($row->created))));
                    $years = floor($diff / (365 * 60 * 60 * 24));
                    $months = floor(($diff - $years * 365 * 60 * 60 * 24) / (30 * 60 * 60 * 24));
                    $daysDiff = floor(($diff - $years * 365 * 60 * 60 * 24 - $months * 30 * 60 * 60 * 24) / (60 * 60 * 24));
                    if ($resend_lead_has_permission === true && $daysDiff <= 7) {
                        $resend_lead_btn = '<a class="label label-success resend-lead" href="' . site_url("leads/resend_lead/{$row->leads_sent_history_id}") . '">Resend</a>&nbsp';
                    }
                    $rowData[7] = $resend_lead_btn . $return_lead_btn;
                } else if ($row->lead_sent_status == 2) {
                    $rowData[6] = '<span class="text-red">Return<span>';
                    $rowData[7] = '-';
                }
                $resultData[] = $rowData;
            }
        }
        return $resultData;
    }

    private function showLeadReturnTableData($data) {
        $resultData = array();
        if ($data != "") {
            $has_permission = $this->acl->has_permission('approve-return-lead', FALSE);
            foreach ($data as $key => $row) {
                $rowData = array();
                $rowData[0] = form_checkbox("ids[]", $row->lead_reaturn_history_id, in_array($row->lead_reaturn_history_id, (array) set_value("ids")) ? true : false, "id=\"ids_{$row->lead_reaturn_history_id}\"");
                $rowData[1] = $row->company_name;
                $rowData[2] = $row->lead_name;
                $rowData[3] = $row->phone_number;
                $rowData[4] = $row->reason;
                $rowData[5] = $row->approve_date != "" ? date(DATETIME_FORMATE, strtotime($row->approve_date)) : '-';
                $approve_by = $this->common->getUserName($row->approve_by);
                $rowData[6] = $approve_by != "" ? $approve_by : '-';
                $rowData[7] = '';
                if ($row->approve_status == 1) {
                    $rowData[7] = '<span class="text-green">Approved<span>';
                } else {
                    if ($has_permission === true) {
                        $rowData[7] = '<div class="text-yellow text-sm">Pending</div><a class="label label-danger approve-return-lead" href="' . site_url("leads/approve_return_lead/{$row->lead_reaturn_history_id}") . '">Approve</a>';
                    } else {
                        $rowData[7] = '<div class="text-yellow text-sm">Pending</div>';
                    }
                }
                $resultData[] = $rowData;
            }
        }
        return $resultData;
    }

    private function generateLeadReport($condition, $type) {
        if ($this->input->get('datefrom') != "" && $this->input->get('dateto') != "") {
            $dateFrom = date('Y-m-d', strtotime($this->input->get('datefrom')));
            $dateTo = date('Y-m-d', strtotime($this->input->get('dateto')));
        } else {
            $dateFrom = date('Y-01-01');
            $dateTo = date('Y-m-d');
        }
        $condition["DATE(led.created) BETWEEN '$dateFrom' AND '$dateTo'"] = NULL;
        $csv_array[] = [ 'portal_name' => 'Portal Name', 'source' => 'Source', 'record_id' => 'Reference Id', 'location' => 'Location From', 'destination_location' => 'Service To', 'service_name' => 'Service', 'name' => 'Name', 'email' => 'Email', 'city_name' => 'City', 'phone_number' => 'Phone Number', 'date' => 'Service Date', 'message' => 'Message', 'sent_status' => 'Sent Status', 'sent_percent' => 'Sent Percentage', 'created' => 'Received', 'updated' => 'Modified'];
        $result = $this->lead->get_list($condition);
        if ($result->num_rows() > 0) {
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = ['portal_name' => $row->portal_name, 'source' => $row->source, 'record_id' => $row->record_id, 'location' => $row->location, 'destination_location' => $row->destination_location, 'service_name' => $row->service_name, 'name' => $row->name, 'email' => $row->email, 'city_name' => $row->city_name, 'phone_number' => $row->phone_number, 'date' => $row->date != "" ? $row->date : '', 'message' => $row->message, 'sent_status' => $row->status == 0 ? 'Pending' : 'Sent', 'sent_percent' => $this->lead->get_lead_percent($row->id), 'created' => date(DATETIME_FORMATE, strtotime($row->created)), 'updated' => $row->updated != "" ? date(DATETIME_FORMATE, strtotime($row->updated)) : ''];
            }
        } else {
            $this->session->set_flashdata("error", __('No records found'));
            redirect('follow_up');
        }
        $Today = date('dmY');
        array_to_csv($csv_array, "lead_{$type}_report_{$dateFrom}_to_{$dateTo}.csv");
        exit();
    }

    private function generateLeadSentReport($condition) {
        if ($this->input->get('datefrom') != "" && $this->input->get('dateto') != "") {
            $dateFrom = date('Y-m-d', strtotime($this->input->get('datefrom')));
            $dateTo = date('Y-m-d', strtotime($this->input->get('dateto')));
        } else {
            $dateFrom = date('Y-01-01');
            $dateTo = date('Y-m-d');
        }
        $condition["DATE(lsh.created) BETWEEN '$dateFrom' AND '$dateTo'"] = NULL;
        $csv_array[] = ['company_name' => 'Company Name', 'lead_name' => 'Customer Name', 'phone_number' => 'Customer Phone', 'message' => 'Customer Message', 'created' => 'Sent On', 'lead_sent_status' => 'Status'];
        $result = $this->lead->get_leads_sent_history($condition);
        if ($result->num_rows() > 0) {
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = ['company_name' => $row->company_name, 'lead_name' => $row->lead_name, 'phone_number' => $row->phone_number, 'message' => $row->message, 'created' => date(DATETIME_FORMATE, strtotime($row->created)), 'lead_sent_status' => $row->lead_sent_status == 1 ? 'Sent' : 'Return'];
            }
        } else {
            $this->session->set_flashdata("error", __('No records found'));
            redirect('follow_up');
        }
        $Today = date('dmY');
        array_to_csv($csv_array, "lead_sent_report_{$dateFrom}_to_{$dateTo}.csv");
        exit();
    }

    private function generateLeadReturnReport($condition) {
        if ($this->input->get('datefrom') != "" && $this->input->get('dateto') != "") {
            $dateFrom = date('Y-m-d', strtotime($this->input->get('datefrom')));
            $dateTo = date('Y-m-d', strtotime($this->input->get('dateto')));
        } else {
            $dateFrom = date('Y-01-01');
            $dateTo = date('Y-m-d');
        }
        $condition["DATE(lrh.created) BETWEEN '$dateFrom' AND '$dateTo'"] = NULL;
        $csv_array[] = ['company_name' => 'Company Name', 'lead_name' => 'Customer Name', 'phone_number' => 'Customer Phone', 'reason' => 'Reason for return', 'approve_date' => 'Approve On', 'approve_by' => 'Approve By', 'created' => 'Create On'];
        $result = $this->lead->get_leads_return_history($condition);
        if ($result->num_rows() > 0) {
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = ['company_name' => $row->company_name, 'lead_name' => $row->lead_name, 'phone_number' => $row->phone_number, 'reason' => $row->reason, 'approve_date' => $row->approve_date != "" ? date(DATETIME_FORMATE, strtotime($row->approve_date)) : '', 'approve_by' => $this->common->getUserName($row->approve_by), 'created' => date(DATETIME_FORMATE, strtotime($row->created))];
            }
        } else {
            $this->session->set_flashdata("error", __('No records found'));
            redirect('follow_up');
        }
        $Today = date('dmY');
        array_to_csv($csv_array, "lead_return_report_{$dateFrom}_to_{$dateTo}.csv");
        exit();
    }

}
