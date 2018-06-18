<?php

/**
 * Description of Servicetypes
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Servicetypes extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->redirect = "admin";
        $this->site_santry->allow(array());
        $this->load->model(array('servicetype_model' => 'servicetype', 'portal_model' => 'portal'));
        $this->layout->set_layout("admin/layout/layout_admin");
        $this->viewData['pageModule'] = 'Service Manager';
    }

    public function index() {
        $this->acl->has_permission('servicetype-index');
        $condition = array('servicetypes.is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->servicetype->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Service Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Service Listing';
        $this->viewData['breadcrumb'] = array('Service Manager' => 'admin/servicetypes', $this->viewData['title'] => '');
        $this->viewData['portal_options'] = $this->portal->portal_options();
        $this->layout->view("admin/servicetype/index", $this->viewData);
    }

    public function manage() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "name" => $this->input->post('name'),
                "code" => $this->input->post('code'),
                "portals_id" => $this->input->post('portal')
            );
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('servicetype-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("servicetypes", $data, array("id" => $this->input->post('id')));
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('ServicetypeUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('servicetype-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("servicetypes", $data);
                    $resource_id = $this->db->insert_id();
                    $response['msg'] = __('ServicetypeAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->servicetype->getById($resource_id);
                $portaldetail = $this->portal->getById($detail->portals_id);
                $detail->portal_name = isset($portaldetail->name) ? $portaldetail->name : '';
                $detail->statusButtons = $this->layout->element('admin/element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "admin/servicetypes/changestatus", 'permissionKey' => "servicetype-status"), true);
                $detail->actionButtons = $this->layout->element('admin/element/_module_action', array('id' => $detail->id, 'editUrl' => 'admin/servicetypes/manage', 'deleteUrl' => 'admin/servicetypes/delete', 'editPermissionKey' => 'servicetype-edit', 'deletePermissionKey' => 'servicetype-delete'), true);
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
            $has_permission = $this->acl->has_permission('servicetype-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("servicetypes", array('is_delete' => '1'))) {
                    $response['success'] = __('ServicetypeDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('servicetype-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("servicetypes", array("is_active" => 0));
                    $response['success'] = __('ServicetypeInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("servicetypes", array("is_active" => 1));
                    $response['success'] = __('ServicetypeActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

}
