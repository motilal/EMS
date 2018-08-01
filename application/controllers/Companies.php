<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Companies extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->layout->set_layout("layout/layout_admin");
        $this->load->model(array("company_model" => 'company'));
    }

    public function index() {
        $this->acl->has_permission('company-index');
        $condition = array('companies.is_delete' => '0');
        $result = $this->company->get_list($condition);
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('name' => 'Company Name', 'company_owner' => 'Company Owner', 'company_address' => 'Company Address', 'email' => 'Email', 'phone1' => 'Phone Number', 'phone2' => 'Alternate Phone', 'lead_limit' => 'Lead Limit', 'gst_no' => 'GST No.', 'aadhar_no' => 'Aadhar No.', 'pencard_no' => 'Pencard No.', 'country' => 'country', 'state' => 'state', 'city' => 'city', 'zip_code' => 'zip_code', 'latitude' => 'latitude', 'logitude' => 'logitude', 'cities' => 'Cities', 'servicetype' => 'Services', 'service' => 'Sub Services', 'status' => 'Status', 'created' => 'Created', 'updated' => 'Last Modify');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $company_cities = $this->company->get_company_cities($row->id);
                $company_services = $this->company->get_company_services($row->id);
                $csv_array[] = array('name' => $row->name, 'company_owner' => $row->company_owner, 'company_address' => $row->company_address, 'email' => $row->email, 'phone1' => $row->phone1, 'phone2' => $row->phone2, 'lead_limit' => $row->lead_limit, 'gst_no' => $row->gst_no, 'aadhar_no' => $row->aadhar_no, 'pencard_no' => $row->pencard_no, 'country' => $row->country, 'state' => $row->state, 'city' => $row->city, 'zip_code' => $row->zip_code, 'latitude' => $row->latitude, 'logitude' => $row->logitude, 'cities' => implode(',', $company_cities), 'servicetype' => $row->service_name, 'service' => implode(',', $company_services), 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)), 'updated' => date(DATETIME_FORMATE, strtotime($row->updated)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "Companies_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Manage Company";
        $this->viewData['pageModule'] = 'Company Manager';
        $this->viewData['pageHeading'] = 'Company';
        $this->viewData['breadcrumb'] = array('Company Manager' => '');
        $this->viewData['datatable_asset'] = true;
        $this->layout->view("company/index", $this->viewData);
    }

    public function view($id = null) {
        $this->viewData['data'] = $data = $this->company->getById($id);
        if (empty($data)) {
            show_404();
        }
        $data->service_name = '';
        if ($data->servicetypes_id > 0) {
            $service_sql = $this->db->select('name')->get_where('servicetypes', array('id' => $data->servicetypes_id));
            if ($service_sql->num_rows() > 0) {
                $data->service_name = $service_sql->row()->name;
            }
        }
        $this->viewData['company_services'] = $this->company->get_company_services($id);
        $this->viewData['company_cities'] = $this->company->get_company_sub_cities_group($id);
        $this->viewData['title'] = "Company Detail";
        $this->viewData['pageModule'] = 'Company Detail';
        $this->viewData['breadcrumb'] = array('Company Manager' => 'companies', 'View Detail' => '');
        $this->layout->view("company/view", $this->viewData);
    }

    public function manage($id = null) {
        $this->load->library('form_validation');
        $this->load->model(array('service_model' => 'service', 'servicetype_model' => 'servicetype', 'city_model' => 'city', 'sub_city_model' => 'sub_city'));
        $this->form_validation->set_rules('manage');
        $this->viewData['title'] = "Add Company";
        if ($id > 0) {
            $this->acl->has_permission('company-edit');
            $this->viewData['data'] = $detail = $this->company->getById($id);
            if (empty($detail)) {
                $this->session->set_flashdata("error", __('LinkExpired'));
                redirect('companies');
            }
            $this->viewData['company_services'] = $this->company->get_company_services_ids($id);
            $this->viewData['company_cities'] = $this->company->get_company_cities_ids($id);
            $this->viewData['title'] = "Edit Company";
        } else {
            $this->acl->has_permission('company-add');
        }

        if ($this->form_validation->run() === TRUE) {
            $saveData = array(
                "name" => $this->input->post('name'),
                "company_owner" => $this->input->post('company_owner'),
                "company_address" => $this->input->post("company_address"),
                "email" => $this->input->post("email"),
                "phone1" => $this->input->post("phone1"),
                "phone2" => $this->input->post("phone2"),
                "servicetypes_id" => $this->input->post("servicetypes_id"),
                "gst_no" => $this->input->post("gst_no"),
                "aadhar_no" => $this->input->post("aadhar_no"),
                "pencard_no" => $this->input->post("pencard_no"),
                "city" => $this->input->post("city"),
                "state" => $this->input->post("state"),
                "country" => $this->input->post("country"),
                "zip_code" => $this->input->post("zip_code"),
                "latitude" => $this->input->post("latitude"),
                "logitude" => $this->input->post("logitude"),
                "lead_limit" => $this->input->post("lead_limit")
            );
            $saveData = filterPostData($saveData);

            if (isset($_FILES['other_documents']['name']) && $_FILES['other_documents']['name'] != "") {
                $other_documents = [];
                if (!empty($detail->other_documents)) {
                    $other_documents = explode(',', $detail->other_documents);
                }
                foreach ($_FILES['other_documents'] as $key => $row) {
                    foreach ($row as $key1 => $row1) {
                        $_FILES['other_documents_' . $key1][$key] = $row1;
                    }
                }
                foreach ($_FILES['other_documents']['name'] as $key => $val) {
                    $fileUpload = $this->do_upload('other_documents_' . $key);
                    if (!isset($fileUpload['error']) && !empty($fileUpload['upload_data']['file_name'])) {
                        $other_documents[] = $fileUpload['upload_data']['file_name'];
                    }
                }
                if (!empty($other_documents)) {
                    $saveData['other_documents'] = implode(',', $other_documents);
                }
            }

            if (isset($_FILES['photo']['name']) && $_FILES['photo']['name'] != "") {
                $fileUpload = $this->do_upload('photo');
                if (isset($fileUpload['error']) && $fileUpload['error'] != "") {
                    $this->session->set_flashdata("error", $fileUpload['error']);
                } else {
                    if (!empty($detail->photo)) {
                        @unlink(COMPANY_DOC_PATH . $detail->photo);
                    }
                    $saveData['photo'] = $fileUpload['upload_data']['file_name'];
                }
            }
            if (isset($_FILES['driving_license']['name']) && $_FILES['driving_license']['name'] != "") {
                $fileUpload = $this->do_upload('driving_license');
                if (isset($fileUpload['error']) && $fileUpload['error'] != "") {
                    $this->session->set_flashdata("error", $fileUpload['error']);
                } else {
                    if (!empty($detail->driving_license)) {
                        @unlink(COMPANY_DOC_PATH . $detail->driving_license);
                    }
                    $saveData['driving_license'] = $fileUpload['upload_data']['file_name'];
                }
            }

            if (isset($_FILES['aadhar_doc']['name']) && $_FILES['aadhar_doc']['name'] != "") {
                $fileUpload = $this->do_upload('aadhar_doc');
                if (isset($fileUpload['error']) && $fileUpload['error'] != "") {
                    $this->session->set_flashdata("error", $fileUpload['error']);
                } else {
                    if (!empty($detail->aadhar_doc)) {
                        @unlink(COMPANY_DOC_PATH . $detail->aadhar_doc);
                    }
                    $saveData['aadhar_doc'] = $fileUpload['upload_data']['file_name'];
                }
            }
            if (isset($_FILES['pencard_doc']['name']) && $_FILES['pencard_doc']['name'] != "") {
                $fileUpload = $this->do_upload('pencard_doc');
                if (isset($fileUpload['error']) && $fileUpload['error'] != "") {
                    $this->session->set_flashdata("error", $fileUpload['error']);
                } else {
                    if (!empty($detail->pencard_doc)) {
                        @unlink(COMPANY_DOC_PATH . $detail->pencard_doc);
                    }
                    $saveData['pencard_doc'] = $fileUpload['upload_data']['file_name'];
                }
            }
            if ($id > 0) {
                $saveData['slug'] = create_unique_slug($this->input->post('title'), 'companies', 'slug', 'id', $id);
            } else {
                $saveData['slug'] = create_unique_slug($this->input->post('title'), 'companies', 'slug');
            }
            if ($this->input->post('id') > 0) {
                $saveData['updated'] = date("Y-m-d H:i:s");
                $this->db->update("companies", $saveData, array("id" => $this->input->post('id')));
                $comp_id = $this->input->post('id');
                /* update cities data */
                $cities_array = $this->input->post('cities_id');
                $cities_array = array_filter($cities_array);
                $cities_array = array_unique($cities_array);
                if (!empty($cities_array)) {
                    $this->db->where('companies_id', $comp_id)->where_not_in('cities_id', $cities_array)->delete('companies_city');
                    $this->db->where(['companies_id' => $comp_id])->where_not_in('cities_id', $cities_array)->delete('companies_sub_city');
                    $exist_cities = $this->db->select('cities_id')->where('companies_id', $comp_id)->where_in('cities_id', $cities_array)->get('companies_city')->result_array();
                    $exist_records = array();
                    $cities_array1 = [];
                    if (!empty($exist_cities)) {
                        foreach ($exist_cities as $value) {
                            $exist_records[] = $value['cities_id'];
                        }
                    }
                    $cities_array1 = array_diff($cities_array, $exist_records);
                    $CompCitydata = array();
                    foreach ($cities_array1 as $value) {
                        $CompCitydata[] = array(
                            'cities_id' => $value,
                            'companies_id' => $comp_id
                        );
                    }
                    if (!empty($CompCitydata)) {
                        $this->db->insert_batch('companies_city', $CompCitydata);
                    }
                } else {
                    $this->db->where('companies_id', $comp_id)->delete('companies_city');
                }

                $sub_cities_array = $this->input->post('sub_cities');
                if (!empty($cities_array)) {
                    foreach ($cities_array as $key => $city_id) {
                        if (!empty($sub_cities_array[$key])) {
                            $this->db->where(['cities_id' => $city_id, 'companies_id' => $comp_id])->where_not_in('sub_cities_id', $sub_cities_array[$key])->delete('companies_sub_city');
                            $exist_sub_cities = $this->db->select('sub_cities_id')->where(['cities_id' => $city_id, 'companies_id' => $comp_id])->where_in('sub_cities_id', $sub_cities_array[$key])->get('companies_sub_city')->result_array();
                            $exist_records = [];
                            if (!empty($exist_sub_cities)) {
                                foreach ($exist_sub_cities as $value) {
                                    $exist_records[] = $value['sub_cities_id'];
                                }
                                $sub_cities_array[$key] = array_diff($sub_cities_array[$key], $exist_records);
                            }
                            $CompSubCitydata = [];
                            foreach ($sub_cities_array[$key] as $value) {
                                $CompSubCitydata[] = [
                                    'cities_id' => $city_id,
                                    'sub_cities_id' => $value,
                                    'companies_id' => $comp_id
                                ];
                            }
                            if (!empty($CompSubCitydata)) {
                                $this->db->insert_batch('companies_sub_city', $CompSubCitydata);
                            }
                        } else {
                            $this->db->where(['cities_id' => $city_id, 'companies_id' => $comp_id])->delete('companies_sub_city');
                        }
                    }
                }

                /* end */

                /* update services data */
                $services_array = $this->input->post('services');
                if (!empty($services_array)) {
                    $this->db->where('companies_id', $comp_id)->where_not_in('services_id', $services_array)->delete('companies_service');
                    $exist_services = $this->db->select('services_id')->where('companies_id', $comp_id)->where_in('services_id', $services_array)->get('companies_service')->result_array();
                    $exist_records = array();
                    if (!empty($exist_services)) {
                        foreach ($exist_services as $value) {
                            $exist_records[] = $value['services_id'];
                        }
                        $services_array = array_diff($services_array, $exist_records);
                    }
                    $CompServicedata = array();
                    foreach ($services_array as $value) {
                        $CompServicedata[] = array(
                            'services_id' => $value,
                            'companies_id' => $comp_id
                        );
                    }
                    if (!empty($CompServicedata)) {
                        $this->db->insert_batch('companies_service', $CompServicedata);
                    }
                } else {
                    $this->db->where('companies_id', $comp_id)->delete('companies_service');
                }
                /* end */
                $this->session->set_flashdata("success", __('CompanyUpdateSuccess'));
            } else {
                $saveData['created'] = date("Y-m-d H:i:s");
                $this->db->insert("companies", $saveData);
                $company_id = $this->db->insert_id();
                if ($this->input->post('cities_id') != "") {
                    $cities = $this->input->post('cities_id');
                    $sub_cities_array = $this->input->post('sub_cities');
                    $citiesData = array();
                    foreach ($this->input->post('cities_id') as $key => $val) {
                        $citiesData[] = array('cities_id' => $val, 'companies_id' => $company_id);
                        if (!empty($sub_cities_array[$key])) {
                            foreach ($sub_cities_array[$key] as $sval) {
                                $subcitiesData[] = array('cities_id' => $val, 'sub_cities_id' => $sval, 'companies_id' => $company_id);
                            }
                            $this->db->insert_batch('companies_sub_city', $subcitiesData);
                        }
                    }
                    $this->db->insert_batch('companies_city', $citiesData);
                }
                if ($this->input->post('services') != "") {
                    $sub_services = $this->input->post('services');
                    $subServicesData = array();
                    foreach ($this->input->post('services') as $val) {
                        $subServicesData[] = array('services_id' => $val, 'companies_id' => $company_id);
                    }
                    $this->db->insert_batch('companies_service', $subServicesData);
                }
                $this->session->set_flashdata("success", __('CompanyAddSuccess'));
            }
            redirect("companies");
        }
        $this->viewData['servicetypes_options'] = $this->servicetype->servicetypes_options();
        if ($id > 0 && !empty($detail->servicetypes_id)) {
            $this->viewData['services_options'] = $this->service->services_options($detail->servicetypes_id);
        }
        $this->viewData['cities_options'] = $this->city->cities_options(TRUE);

        $this->viewData['pageModule'] = 'Add New Company';
        $this->viewData['breadcrumb'] = array('Company Manager' => 'companies', $this->viewData['title'] => '');
        $this->layout->view("company/manage", $this->viewData);
    }

    private function do_upload($input = '') {
        if (!is_dir(COMPANY_DOC_PATH)) {
            mkdir(COMPANY_DOC_PATH, DIR_WRITE_MODE, TRUE);
        }
        $config['upload_path'] = COMPANY_DOC_PATH;
        $config['allowed_types'] = 'gif|jpg|png|jpeg';
        $this->load->library('upload', $config);
        if (!$this->upload->do_upload($input)) {
            $error = array('error' => $this->upload->display_errors('', ''));
            return $error;
        } else {
            $data = array('upload_data' => $this->upload->data());
            return $data;
        }
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('company-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("companies", array('is_delete' => '1'))) {
                    $response['success'] = __('CompanyDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('company-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("companies", array("is_active" => 0));
                    $response['success'] = __('CompanyInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("companies", array("is_active" => 1));
                    $response['success'] = __('CompanyActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function ajax_getsubservices() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            $response['result'] = array();
            $this->load->model(array('service_model' => 'service'));
            if ($this->input->post('servicetypes_id') != "" && is_numeric($this->input->post('servicetypes_id'))) {
                $result = $this->service->get_list(array('services.is_delete' => '0', 'services.is_active' => '1', 'servicetypes_id' => $this->input->post('servicetypes_id')));
                if ($result->num_rows() > 0) {
                    foreach ($result->result_array() as $key => $row) {
                        $response['result'][$key]['id'] = $row['id'];
                        $response['result'][$key]['text'] = $row['name'];
                    }
                }
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            show_404();
        }
    }

    public function ajax_getmatchpackage() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            $response['result'] = array();
            $this->load->model(array('package_model' => 'package'));
            if ($this->input->post('companies_id') != "" && is_numeric($this->input->post('companies_id'))) {
                $company_services_ids = $this->company->get_company_services_ids($this->input->post('companies_id'));
                $total_company_services = count($company_services_ids);
                if ($total_company_services > 0) {
                    $result = $this->db->select('packages.name,packages.id')
                            ->join('packages', 'packages.id=packages_service.packages_id', 'INNER')
                            ->where_in('services_id', $company_services_ids)
                            ->where(array('packages.is_delete' => '0', 'packages.is_active' => '1'))
                            ->group_by('packages_service.packages_id')
                            ->having('COUNT(DISTINCT services_id) = ', $total_company_services)
                            ->get('packages_service');
                    $response['result'][0]['id'] = '';
                    $response['result'][0]['text'] = 'Select package';
                    if ($result->num_rows() > 0) {
                        foreach ($result->result_array() as $key => $row) {
                            $response['result'][$key + 1]['id'] = $row['id'];
                            $response['result'][$key + 1]['text'] = $row['name'];
                        }
                    }
                }
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            show_404();
        }
    }

    public function ajax_getsubcities() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            $response['result'] = array();
            $this->load->model(array('sub_city_model' => 'sub_city'));
            if ($this->input->post('cities_id') != "" && is_numeric($this->input->post('cities_id'))) {
                $result = $this->sub_city->get_list(array('sub_cities.is_delete' => '0', 'sub_cities.is_active' => '1', 'cities_id' => $this->input->post('cities_id')));
                if ($result->num_rows() > 0) {
                    foreach ($result->result_array() as $key => $row) {
                        $response['result'][$key]['id'] = $row['id'];
                        $response['result'][$key]['text'] = $row['name'];
                    }
                }
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            show_404();
        }
    }

    public function ajax_getPackageAmount() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            $response['amount'] = array();
            $this->load->model(array('package_model' => 'package'));
            if ($this->input->post('package_id') != "" && is_numeric($this->input->post('package_id'))) {
                $result = $this->package->getById($this->input->post('package_id'));
                if (!empty($result)) {
                    $response['row'] = $result;
                    $response['success'] = true;
                }
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($response));
        } else {
            show_404();
        }
    }

    public function download_doc($filename = '') {
        if (!empty($filename)) {
            $filepath = COMPANY_DOC_PATH . $filename;
            if (file_exists($filepath)) {
                $this->load->helper('download');
                $data = file_get_contents($filepath);
                force_download($filename, $data);
            }
        }
    }

    public function delete_doc($filename = '') {
        $response = array();
        if ($this->input->is_ajax_request() && $filename != "") {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('company-delete', FALSE);
            if ($has_permission === TRUE) {
                $companyDetail = $this->company->getById($id);
                if (!empty($companyDetail->other_documents)) {
                    $documents = explode(',', $companyDetail->other_documents);
                    if (($key = array_search($filename, $documents)) !== false) {
                        unset($documents[$key]);
                        $filepath = COMPANY_DOC_PATH . $filename;
                        if (file_exists($filepath)) {
                            unlink($filepath);
                        }
                    }
                    if (!empty($documents)) {
                        $documents = implode(',', $documents);
                    } else {
                        $documents = NULL;
                    }
                    if ($this->db->where("id", $id)->set('other_documents', $documents)->update("companies")) {
                        $response['success'] = __('CompanyDeleteSuccess');
                    } else {
                        $response['error'] = __('InvalidRequest');
                    }
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function manage_package($company_id = NULL) {
        $this->load->model('package_model', 'package');
        if ($this->input->is_ajax_request()) {
            $this->load->library('form_validation');
            $response = array();
            if ($this->form_validation->run('manage_package') === TRUE) {
                $packageDetail = $this->package->getById($this->input->post('package'));
                if (!empty($packageDetail)) {
                    $approved = is_allow_admin(FALSE) === TRUE ? '1' : '0';
                    $data = array(
                        "companies_id" => $this->input->post('company'),
                        "packages_id" => $this->input->post('package'),
                        "total_leads" => $approved == 1 ? $this->input->post('lead_balance') : 0,
                        'used_leads' => 0,
                        'package_amount' => $this->input->post('package_amount'),
                        'package_lead' => $this->input->post('total_lead'),
                        'created' => date("Y-m-d H:i:s"),
                        'is_active' => 1
                    );
                    $has_permission = $this->acl->has_permission('company-package-add', FALSE);
                    if ($has_permission === TRUE) {
                        $this->db->insert("companies_package", $data);
                        $companies_package_id = $this->db->insert_id();
                        $this->db->insert('companies_package_payment', ['companies_package_id' => $companies_package_id, 'amount' => $this->input->post('amount_paid'), 'approved' => $approved, 'created' => date('Y-m-d H:i:s')]);
                        $response['success'] = true;
                        $response['msg'] = __('CompanyPackageAddSuccess');
                    } else {
                        $response['error'] = $has_permission;
                    }
                }
            } else {
                $response['validation_error'] = $this->form_validation->error_array();
            }
            $this->output->set_content_type('application/json')
                    ->set_output(json_encode($response))->_display();
            exit();
        }
        $this->acl->has_permission('company-package-manage');
        $condition = array();
        if ($company_id != "") {
            $condition['cp.companies_id'] = $company_id;
            $this->viewData['company_id'] = $company_id;
        }
        $result = $this->company->get_company_packages($condition);
        if ($this->input->get('download') == 'report') {
            $csv_array[] = array('company_name' => 'Company Name', 'package_name' => 'Package Name', 'package_amount' => 'Package Amount', 'package_lead' => 'Package Lead', 'total_lead' => 'Total Leads', 'used_lead' => 'Used Leads', 'amount_paid' => 'Amount Paid', 'status' => 'Status', 'created' => 'Created');
            foreach ($result->result() as $row) {
                $this->load->helper('csv');
                $csv_array[] = array('company_name' => $row->company_name, 'package_name' => $row->package_name, 'package_amount' => $row->package_amount, 'package_lead' => $row->package_lead, 'total_lead' => $row->total_leads, 'used_lead' => $row->used_leads, 'amount_paid' => $row->total_paid_amount, 'status' => $row->is_active == 1 ? 'Active' : 'InActive', 'created' => date(DATETIME_FORMATE, strtotime($row->created)));
            }
            $Today = date('dmY');
            array_to_csv($csv_array, "CompanyPackages_$Today.csv");
            exit();
        }
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Manage Company Package";
        $this->viewData['pageModule'] = 'Company Manager';
        $this->viewData['pageHeading'] = 'Company Package';
        $this->viewData['breadcrumb'] = array('Company Manager' => '');
        $this->viewData['datatable_asset'] = true;
        $this->viewData['packages_options'] = $this->package->packages_options();
        $this->viewData['company_options'] = $this->company->company_options(true);
        $this->layout->view("company/manage_package", $this->viewData);
    }

    function _validate_package($package_id) {
        return TRUE;
        $company_id = $this->input->post('company');
        if (!empty($package_id) && !empty($company_id)) {
            $checkpackage = $this->db->select('id')->where(array('packages_id' => $package_id, 'companies_id' => $company_id, '`total_leads` > `used_leads`' => NULL))->get('companies_package');
            if ($checkpackage->num_rows() > 0) {
                $this->form_validation->set_message('_validate_package', 'Package already added for this company.You can add new package after expiration of all running package.');
                return FALSE;
            } else {
                return TRUE;
            }
        }
    }

    function _validate_amount_paid($package_id) {
        $amount_paid = $this->input->post('amount_paid');
        $package_amount = $this->input->post('package_amount');
        if ($amount_paid > $package_amount) {
            $this->form_validation->set_message('_validate_amount_paid', 'Amount paid will not greater than package amount.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    public function change_comapany_package_status() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $has_permission = $this->acl->has_permission('company-package-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("companies_package", array("is_active" => 0));
                    $response['success'] = __('CompanyPackageInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("companies_package", array("is_active" => 1));
                    $response['success'] = __('CompanyPackageActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    public function delete_company_package() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $has_permission = $this->acl->has_permission('company-package-delete', FALSE);
            if ($has_permission === TRUE) {
                $used_leads = $this->db->select('used_leads')->where("id", $id)->get('companies_package')->row();
                if (isset($used_leads->used_leads) && $used_leads->used_leads == 0) {
                    if ($id > 0 && $this->db->where("id", $id)->delete("companies_package")) {
                        $response['success'] = __('CompanyDeleteSuccess');
                    } else {
                        $response['error'] = __('InvalidRequest');
                    }
                } else {
                    $response['error'] = __('CompanyPackageDeleteRestrict');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    function _is_unique_company_name($str) {
        $condition = array('is_delete' => '0', 'name' => $str);
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('companies', $condition)) {
            $this->form_validation->set_message('_is_unique_company_name', 'The Company name already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function _is_unique_company_phone($str) {
        $condition = array('is_delete' => '0', 'phone1' => $str);
        if ($this->input->post('id') != "") {
            $condition['id !='] = $this->input->post('id');
        }
        if (validate_is_unique('companies', $condition)) {
            $this->form_validation->set_message('_is_unique_company_phone', 'The Phone number already exist.');
            return FALSE;
        } else {
            return TRUE;
        }
    }

    function getPackagePaymentHistory($companies_package_id) {
        if (empty($companies_package_id))
            echo 'no data found';
        $sql = $this->db->where(['companies_package_id' => $companies_package_id])->order_by('created', 'DESC')->get('companies_package_payment');
        $c_package_sql = $this->db->where(['id' => $companies_package_id])->get('companies_package');
        $this->viewData['result'] = $sql->result();
        $this->viewData['company_package'] = $c_package_sql->row();
        echo $this->load->view("company/get_package_payment_history", $this->viewData, true);
    }

    public function pay_package_amount() {
        if ($this->input->is_ajax_request()) {
            $this->load->library('form_validation');
            $response = array();
            if ($this->form_validation->run('pay_package_amount') === TRUE) {
                $amount_paid = $this->input->post('amount');
                $due_amount = $this->input->post('due_amount');
                $package_amount = $this->input->post('package_amount');
                $package_lead = $this->input->post('package_lead');
                $companies_package_id = $this->input->post('companies_package_id');
                if ($amount_paid > $due_amount) {
                    $response['error'] = 'The amount will not greater than due amount.';
                } else {
                    $approved = is_allow_admin(FALSE) === TRUE ? '1' : '0';
                    if ($approved == 1) {
                        $calculate_lead = ($package_lead / $package_amount) * $amount_paid;
                        $calculate_lead = floor($calculate_lead);
                        $this->db->where('id', $companies_package_id)->set('total_leads', "total_leads + $calculate_lead", FALSE)->update('companies_package');
                    }
                    $this->db->insert('companies_package_payment', ['companies_package_id' => $companies_package_id, 'amount' => $amount_paid, 'approved' => $approved, 'created' => date('Y-m-d H:i:s')]);
                    $response['success'] = true;
                    $response['msg'] = 'Package amount recharge successfully.';
                }
            } else {
                $response['validation_error'] = $this->form_validation->error_array();
            }
            $this->output->set_content_type('application/json')
                    ->set_output(json_encode($response))->_display();
            exit();
        }
    }

    public function delete_package_amount() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            if (is_allow_admin(FALSE) === TRUE) {
                $companies_package_payment_id = $this->input->post('id');
                if ($companies_package_payment_id != "") {
                    $sql = $this->db->where('id', $companies_package_payment_id)->get('companies_package_payment');
                    if ($sql->num_rows() > 0) {
                        $row = $sql->row();
                        if ($row->approved == '1') {
                            $company_package_sql = $this->db->where('id', $row->companies_package_id)->get('companies_package');
                            if ($company_package_sql->num_rows() > 0) {
                                $company_package_row = $company_package_sql->row();
                                $calculate_lead = ($company_package_row->package_lead / $company_package_row->package_amount) * $row->amount;
                                $calculate_lead = floor($calculate_lead);
                                $this->db->where('id', $row->companies_package_id)->set('total_leads', "total_leads - $calculate_lead", FALSE)->update('companies_package');
                            }
                        }
                        if ($this->db->where('id', $companies_package_payment_id)->delete('companies_package_payment')) {
                            $response['success'] = __('CompanyPackagePaymenntDeleteSuccess');
                        } else {
                            $response['error'] = __('InvalidRequest');
                        }
                    }
                }
            } else {
                $response['error'] = 'You dont have permission.';
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }
    }

    public function approve_package_amount() {
        if ($this->input->is_ajax_request()) {
            $response = array();
            if (is_allow_admin(FALSE) === TRUE) {
                $companies_package_payment_id = $this->input->post('id');
                if ($companies_package_payment_id != "") {
                    $sql = $this->db->where('id', $companies_package_payment_id)->get('companies_package_payment');
                    if ($sql->num_rows() > 0) {
                        $row = $sql->row();
                        if ($row->approved == '0') {
                            $company_package_sql = $this->db->where('id', $row->companies_package_id)->get('companies_package');
                            if ($company_package_sql->num_rows() > 0) {
                                $company_package_row = $company_package_sql->row();
                                $calculate_lead = ($company_package_row->package_lead / $company_package_row->package_amount) * $row->amount;
                                $calculate_lead = floor($calculate_lead);
                                $this->db->where('id', $row->companies_package_id)->set('total_leads', "total_leads + $calculate_lead", FALSE)->update('companies_package');
                            }
                        }
                        if ($this->db->where('id', $companies_package_payment_id)->set('approved', '1')->update('companies_package_payment')) {
                            $response['success'] = __('CompanyPackagePaymenntUpdateSuccess');
                        } else {
                            $response['error'] = __('InvalidRequest');
                        }
                    }
                }
            } else {
                $response['error'] = 'You dont have permission.';
            }
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }
    }

}
