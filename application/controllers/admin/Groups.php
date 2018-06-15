<?php

/**
 * Description of Groups
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Groups extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct();
        $this->site_santry->redirect = "admin";
        $this->site_santry->allow(array());
        $this->load->model(array('group_model' => 'group', 'company_model' => 'company'));
        $this->layout->set_layout("admin/layout/layout_admin");
        $this->viewData['pageModule'] = 'Group Manager';
    }

    public function index() {
        $this->acl->has_permission('group-index');
        $condition = array('is_delete' => '0');
        $start = (int) $this->input->get('start');
        $result = $this->group->get_list($condition);
        $this->viewData['result'] = $result;
        $this->viewData['title'] = "Group Listing";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'Group Listing';
        $this->load->model(array('company_model' => 'company', 'city_model' => 'city'));
        $this->viewData['company_options'] = $this->company->company_options();
        $this->viewData['city_options'] = $this->city->cities_options();
        $this->viewData['breadcrumb'] = array('Group Manager' => 'admin/groups', $this->viewData['title'] => '');
        $this->layout->view("admin/group/index", $this->viewData);
    }

    public function manage() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            $data = array(
                "name" => $this->input->post('name'),
                'cities_id' => $this->input->post('city')
            );
            $company = "";
            if (is_array($this->input->post('company')) && $this->input->post('company') != "") {
                $company = $this->input->post('company');
            }
            if ($this->input->post('id') > 0) {
                $data['slug'] = create_unique_slug($this->input->post('name'), 'company_groups', 'slug', 'id', $this->input->post('id'));
            } else {
                $data['slug'] = create_unique_slug($this->input->post('name'), 'company_groups', 'slug');
            }
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('group-edit', FALSE);
                if ($has_permission === TRUE) {
                    $this->db->update("company_groups", $data, array("id" => $this->input->post('id')));
                    if ($company != "") {
                        $this->db->where('company_groups_id', $this->input->post('id'))->where_not_in('companies_id', $company)->delete('companies_group');
                        $exist_comp_groups = $this->db->select('companies_id')->where('company_groups_id', $this->input->post('id'))->where_in('companies_id', $company)->get('companies_group')->result_array();
                        $exist_comp = array();
                        if (!empty($exist_comp_groups)) {
                            foreach ($exist_comp_groups as $value) {
                                $exist_comp[] = $value['companies_id'];
                            }
                            $company = array_diff($company, $exist_comp);
                        }
                        foreach ($company as $value) {
                            $cs_data[] = array(
                                'company_groups_id' => $this->input->post('id'),
                                'companies_id' => $value
                            );
                        }
                        if (!empty($cs_data)) {
                            $this->db->insert_batch('companies_group', $cs_data);
                        }
                    } else {
                        $this->db->where('company_groups_id', $this->input->post('id'))->delete('companies_group');
                    }
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('GroupUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('group-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['is_active'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("company_groups", $data);
                    $resource_id = $this->db->insert_id();
                    if ($company != "") {
                        foreach ($company as $value) {
                            $cs_data[] = array(
                                'company_groups_id' => $resource_id,
                                'companies_id' => $value
                            );
                        }
                        if (!empty($cs_data)) {
                            $this->db->insert_batch('companies_group', $cs_data);
                        }
                    }
                    $response['msg'] = __('GroupAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->group->getById($resource_id);
                $detail->created = date(DATE_FORMATE, strtotime($detail->created));
                $detail->statusButtons = $this->layout->element('admin/element/_module_status', array('status' => $detail->is_active, 'id' => $detail->id, 'url' => "admin/groups/changestatus", 'permissionKey' => "group-status"), true);
                $detail->actionButtons = $this->layout->element('admin/element/_module_action', array('id' => $detail->id, 'editUrl' => 'admin/groups/manage', 'deleteUrl' => 'admin/groups/delete', 'editPermissionKey' => 'group-edit', 'deletePermissionKey' => 'group-delete'), true);

                $companies = $this->group->get_group_companies($detail->id);
                $companies_ids = filterAssocArray($companies, 'id');
                $companies = filterAssocArray($companies, 'name');
                $companiesString = empty($companies) ? '' : implode(',', $companies);
                $companies_idsString = empty($companies_ids) ? '' : json_encode($companies_ids);

                $detail->companies = $companiesString . '<div class="companies" style="display:none;">' . $companies_idsString . '</div>';
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
            $has_permission = $this->acl->has_permission('group-delete', FALSE);
            if ($has_permission === TRUE) {
                if ($id > 0 && $this->db->where("id", $id)->update("company_groups", array('is_delete' => '1'))) {
                    $response['success'] = __('GroupDeleteSuccess');
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
            $has_permission = $this->acl->has_permission('group-status', FALSE);
            if ($has_permission === TRUE) {
                $id = $this->input->post('id');
                $status = $this->input->post('status');
                if ($status == "1") {
                    $this->db->where("id", $id)->update("company_groups", array("is_active" => 0));
                    $response['success'] = __('GroupInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("company_groups", array("is_active" => 1));
                    $response['success'] = __('GroupActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

}
