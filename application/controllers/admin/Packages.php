<?php

/**
 * Description of Packages
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Packages extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->redirect = "admin";
        $this->site_santry->allow(array());
        $this->load->model(array('package_model' => 'package'));
        $this->layout->set_layout("admin/layout/layout_admin");
        $this->viewData['pageModule'] = 'Package Manager';
    }

    public function index() {
        $this->acl->has_permission('package-index');
        $condition = array('packages.is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->package->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Package Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Package Listing';
        $this->viewData['breadcrumb'] = array('Package Manager' => 'admin/packages', $this->viewData['title'] => '');
        $this->layout->view("admin/package/index", $this->viewData);
    }

    public function manage($id = null) {
        $this->load->library('form_validation');
        $this->load->model(array('service_model' => 'service', 'servicetype_model' => 'servicetype'));
        $this->form_validation->set_rules('manage');
        $this->viewData['title'] = "Add Package";
        if ($id > 0) {
            $this->acl->has_permission('package-edit');
            $this->viewData['data'] = $detail = $this->package->getById($id);
            if (empty($detail)) {
                $this->session->set_flashdata("error", __('LinkExpired'));
                redirect('admin/packages');
            }
            $this->viewData['package_services'] = $this->package->get_package_services_ids($id);
            $this->viewData['title'] = "Edit Package";
        } else {
            $this->acl->has_permission('package-add');
        }

        if ($this->form_validation->run() === TRUE) {
            $saveData = array(
                "name" => $this->input->post('name'),
                "package_type" => $this->input->post('package_type'),
                "duration" => $this->input->post('duration'),
                "amount" => $this->input->post('amount'),
                "no_of_leads" => $this->input->post('no_of_leads'),
                "servicetypes_id" => $this->input->post('servicetypes_id') > 0 ? $this->input->post('servicetypes_id') : NULL,
                "description" => $this->input->post('description')
            );
            if ($this->input->post('id') > 0) {
                $saveData['updated'] = date("Y-m-d H:i:s");
                $this->db->update("packages", $saveData, array("id" => $this->input->post('id')));
                $package_id = $this->input->post('id');

                /* update services data */
                $services_array = $this->input->post('services');
                if (!empty($services_array)) {
                    $this->db->where('packages_id', $package_id)->where_not_in('services_id', $services_array)->delete('packages_service');
                    $exist_services = $this->db->select('services_id')->where('packages_id', $package_id)->where_in('services_id', $services_array)->get('packages_service')->result_array();
                    $exist_records = array();
                    if (!empty($exist_services)) {
                        foreach ($exist_services as $value) {
                            $exist_records[] = $value['services_id'];
                        }
                        $services_array = array_diff($services_array, $exist_records);
                    }
                    $PackageServiceData = array();
                    foreach ($services_array as $value) {
                        $PackageServiceData[] = array(
                            'services_id' => $value,
                            'packages_id' => $package_id
                        );
                    }
                    if (!empty($PackageServiceData)) {
                        $this->db->insert_batch('packages_service', $PackageServiceData);
                    }
                } else {
                    $this->db->where('packages_id', $package_id)->delete('packages_service');
                }
                /* end */
                $this->session->set_flashdata("success", __('ComapanyUpdateSuccess'));
            } else {
                $saveData['created'] = date("Y-m-d H:i:s");
                $this->db->insert("packages", $saveData);
                $package_id = $this->db->insert_id();
                if ($this->input->post('services') != "") {
                    $sub_services = $this->input->post('services');
                    $subServicesData = array();
                    foreach ($this->input->post('services') as $val) {
                        $subServicesData[] = array('services_id' => $val, 'packages_id' => $package_id);
                    }
                    $this->db->insert_batch('packages_service', $subServicesData);
                }
                $this->session->set_flashdata("success", __('PackageAddSuccess'));
            }
            redirect("admin/packages");
        }
        $this->viewData['servicetypes_options'] = $this->servicetype->servicetypes_options();
        if ($id > 0 && !empty($detail->servicetypes_id)) {
            $this->viewData['services_options'] = $this->service->services_options($detail->servicetypes_id);
        }
        $this->viewData['pageModule'] = 'Add New Package';
        $this->viewData['breadcrumb'] = array('Package Manager' => 'admin/packages', $this->viewData['title'] => '');
        $this->layout->view("admin/package/manage", $this->viewData);
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('package-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("packages", array('is_delete' => '1'))) {
                    $response['success'] = __('PackageDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('package-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("packages", array("is_active" => 0));
                    $response['success'] = __('PackageInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("packages", array("is_active" => 1));
                    $response['success'] = __('PackageActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function view($id = null) {
        $this->viewData['data'] = $data = $this->package->getById($id);
        if (empty($data)) {
            show_404();
        }
        $this->load->model('servicetype_model', 'servicetype');
        $serviceDetail = $this->servicetype->getById($data->servicetypes_id);
        $data->service_name = isset($serviceDetail->name) ? $serviceDetail->name : '';
        $this->viewData['package_services'] = $this->package->get_package_services($id);
        $this->viewData['title'] = "Package Detail";
        $this->viewData['pageModule'] = 'Package Detail';
        $this->viewData['breadcrumb'] = array('Package Manager' => 'admin/packages', 'View Detail' => '');
        $this->layout->view("admin/package/view", $this->viewData);
    }

}
