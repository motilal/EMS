<?php

/**
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Contacts extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->load->model(array('contact_model' => 'contact'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Bulk SMS Manager';
    }

    public function index() {
        $this->acl->has_permission('contact-index');
        $condition = [];
        $order = [];
        if ($this->input->get('group') != "" && $this->input->get('group') > 0) {
            $this->load->model(['contact_group_model' => 'contact_group']);
            $contact_group_detail = $this->contact_group->getById($this->input->get('group'));
            if (empty($contact_group_detail)) {
                redirect('contacts');
            }
            $group_contacts = $this->contact_group->group_contacts_ids($this->input->get('group'));
            if (!empty($group_contacts)) {
                $order = array('FIELD(id,' . implode(',', $group_contacts) . ') DESC,id', NULL);
            }
            $this->viewData['group_id'] = $this->input->get('group');
            $this->viewData['group_detail'] = $contact_group_detail;
            $this->viewData['group_contacts'] = $group_contacts;
        }

        $start = (int) $this->input->get('start');
        $result = $this->contact->get_list($condition, $order);
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('name' => 'Name', 'contact' => 'Contact Number', 'status' => 'Status', 'created' => 'Created');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = array('name' => $row->name, 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "Contacts_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Contact Listing";
        $this->viewData['datatable_asset'] = true;
        if (!empty($contact_group_detail)) {
            $this->viewData['pageHeading'] = 'Add contacts in <strong>' . $contact_group_detail->name . '</strong>';
        } else {
            $this->viewData['pageHeading'] = 'Contact Listing';
        }
        $this->viewData['breadcrumb'] = array('Bulk SMS Manager' => 'contacts', $this->viewData['title'] => '');
        $this->layout->view("contact/index", $this->viewData);
    }

    public function update_group_contacts($group_id) {
        if (!empty($group_id)) {
            $contact_ids = array_filter(explode(',', $this->input->post('contact_ids')));
            if (!empty($contact_ids)) {
                $this->db->where('contact_groups_id', $group_id)->where_not_in('contacts_id', $contact_ids)->delete('contacts_group');
                $exist_cont_groups = $this->db->select('contacts_id')->where('contact_groups_id', $group_id)->where_in('contacts_id', $contact_ids)->get('contacts_group')->result_array();
                $exist_cont = array();
                if (!empty($exist_cont_groups)) {
                    foreach ($exist_cont_groups as $value) {
                        $exist_cont[] = $value['contacts_id'];
                    }
                    $contact_ids = array_diff($contact_ids, $exist_cont);
                }
                foreach ($contact_ids as $value) {
                    $cs_data[] = array(
                        'contact_groups_id' => $group_id,
                        'contacts_id' => $value
                    );
                }
                if (!empty($cs_data)) {
                    $this->db->insert_batch('contacts_group', $cs_data);
                }
            } else {
                $this->db->where('contact_groups_id', $group_id)->delete('contacts_group');
            }
            $this->session->set_flashdata("success", __('GroupContactUpdateSuccess'));
            redirect('contacts?group=' . $group_id);
        }
    }

    public function manage() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "name" => $this->input->post('name'),
                "contact" => $this->input->post('contact')
            );
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('contact-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("contacts", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('ContactUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('contact-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("contacts", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('ContactAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->contact->getById($resource_id);
                $detail->created = date(DATE_FORMATE, strtotime($detail->created));
                $detail->checkbox = form_checkbox("ids[]", $detail->id, '', "id=\"ids_{$detail->id}\"");
                $detail->statusButtons = $this->layout->element('element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "contacts/changestatus", 'permissionKey' => "contact-status"), true);
                $detail->actionButtons = $this->layout->element('element/_module_action', array('id' => $detail->id, 'editUrl' => 'contacts/manage', 'deleteUrl' => 'contacts/delete', 'editPermissionKey' => 'contact-edit', 'deletePermissionKey' => 'contact-delete'), true);
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
            $has_permission = $this->acl->has_permission('contact-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->delete("contacts")) {
                    $response['success'] = __('ContactDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('contact-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("contacts", array("is_active" => 0));
                    $response['success'] = __('ContactInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("contacts", array("is_active" => 1));
                    $response['success'] = __('ContactActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    function _is_unique_contact_number($str) {
        $condition = array('contact' => $str);
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('contacts', $condition)) {
            $this->form_validation->set_message('_is_unique_contact_number', 'The Contact number already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

}
