<?php

/**
 * Description of Sms
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Bulk_sms extends CI_Controller {

    var $viewData = array();
    var $per_page = DEFAULT_PAGING;

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Bulk SMS Manager';
    }

    public function index() {
        $this->acl->has_permission('city-index');
        $condition = array();
        $start = (int) $this->input->get('start');
        $result = $this->db->select("sms_send_history.*,contact_groups.name as group_name");
        if (!empty($condition)) {
            $this->db->where($condition);
        }
        if (!empty($order)) {
            $this->db->order_by($order[0], $order[1]);
        }
        $this->db->join('contact_groups', 'contact_groups.id=sms_send_history.contact_groups_id', 'LEFT');
        $result = $this->db->get("sms_send_history");
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('group' => 'Name', 'message' => 'Message', 'batch_id' => 'Batch Id', 'created' => 'SentOn');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = array('group' => $row->group_name, 'message' => $row->message, 'batch_id' => $row->batch_id, 'created' => date(DATETIME_FORMATE, strtotime($row->created)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "Send_sms_hostory_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Send SMS History";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Bulk SMS History';
        $this->viewData['breadcrumb'] = array('Bulk SMS Manager' => 'bulk_sms', $this->viewData['title'] => '');
        $this->layout->view("bulk_sms/index", $this->viewData);
    }

    public function send_sms_to_group() {
        $this->load->library('form_validation');
        $this->load->model(array('contact_group_model' => 'contact_group'));
        $this->form_validation->set_rules('manage');
        $this->viewData['title'] = "Send Bulk SMS to group";
        $this->acl->has_permission('send-sms-to-group');
        if ($this->form_validation->run() === TRUE) {

            $group_id = $this->input->post('contact_group');
            $contacts = $this->contact_group->get_group_contacts($group_id);
            if ($contacts->num_rows() > 0) {
                $contacts_result = $contacts->result();
                $contactArray = filterAssocArray($contacts_result, 'contact');
                foreach ($contactArray as $k => $number) {
                    $contactArray[$k] = '91' . $number;
                }
                $this->load->helper('email_helper');
                $response = sendbulksms($contactArray, $this->input->post('message'));
                if (isset($response->status) && $response->status == 'failure' && isset($response->errors[0]->message)) {
                    $this->session->set_flashdata("error", $response->errors[0]->message);
                } else if (isset($response->status) && isset($response->batch_id) && $response->status == 'success') {
                    $data = array(
                        'contact_groups_id' => $group_id,
                        'batch_id' => $response->batch_id,
                        'message' => nl2br($response->message->content),
                        'created' => date("Y-m-d H:i:s")
                    );
                    $this->db->insert('sms_send_history', $data);
                    $this->session->set_flashdata("success", 'Message successfully send to groups');
                    redirect("bulk_sms");
                }
            } else {
                $this->session->set_flashdata("error", 'Sorry no contacts available in the group.');
            }
            redirect("bulk_sms/send_sms_to_group");
        }
        $this->viewData['contact_group_options'] = $this->contact_group->contact_groups_options(true);
        $template_option = array('' => 'Select SMS Template');
        $template_data = array('' => 'Select SMS Template');
        $templateData = $this->get_sms_templates();
        if (!empty($templateData)) {
            foreach ($templateData as $row) {
                $template_option[$row->id] = $row->title;
                $template_data[$row->id] = str_replace('%n', '%n', $row->body);
            }
        }
        $this->viewData['templates_options'] = $template_option;
        $this->viewData['template_data'] = $template_data;
        $this->viewData['pageModule'] = 'Send Bulk SMS to group';
        $this->viewData['breadcrumb'] = array('Bulk SMS Manager' => 'sms', $this->viewData['title'] => '');
        $this->layout->view("bulk_sms/send_sms_to_group", $this->viewData);
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('bulk-sms-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->delete("sms_send_history")) {
                    $response['success'] = __('BulkSmsHistoryDeleteSuccess');
                } else {
                    $response['error'] = __('InvalidRequest');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    private function get_sms_templates() {
        $apiKey = urlencode(TEXT_LOCAL_APIKEY);
        $data = array('apikey' => $apiKey);
        // Send the POST request with cURL
        $ch = curl_init('https://api.textlocal.in/get_templates/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);
        // Process your response here
        if (!empty($response)) {
            $response = json_decode($response);
            if ($response->status == 'success') {
                return $response->templates;
            }
        }
    }

}
