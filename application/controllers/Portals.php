<?php

/**
 * Description of Portals
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Portals extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct(); 
        $this->site_santry->allow(array());
        $this->load->model(array('portal_model' => 'portal'));
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'Portal Manager';
    }

    public function index() {
        $this->acl->has_permission('portal-index');
        $condition = array();
        $start = (int) $this->input->get('start');
        $result = $this->portal->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Portal Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Portal Listing';
        $this->viewData['breadcrumb'] = array('Portal Manager' => 'portals', $this->viewData['title'] => '');
        $this->layout->view("portal/index", $this->viewData);
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
                $has_permission = $this->acl->has_permission('portal-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("portals", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('PortalUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('portal-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("portals", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('PortalAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->portal->getById($resource_id);
                $detail->created = date(DATE_FORMATE, strtotime($detail->created));
                $detail->statusButtons = $this->layout->element('element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "portals/changestatus", 'permissionKey' => "portal-status"), true);
                $detail->actionButtons = $this->layout->element('element/_module_action', array('id' => $detail->id, 'editUrl' => 'portals/manage', 'deleteUrl' => 'portals/delete', 'editPermissionKey' => 'portal-edit', 'deletePermissionKey' => 'portal-delete'), true);
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
            $has_permission = $this->acl->has_permission('portal-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("portals", array('is_delete' => '1'))) {
                    $response['success'] = __('PortalDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('portal-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("portals", array("is_active" => 0));
                    $response['success'] = __('PortalInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("portals", array("is_active" => 1));
                    $response['success'] = __('PortalActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

}
