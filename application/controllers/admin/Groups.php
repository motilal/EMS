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
        $this->load->model(array('group_model' => 'group'));
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
        $this->load->model(array('company_model' => 'company'));
        $this->load->library('form_validation');
        $this->form_validation->set_rules('manage');
        $response = array();
        if ($this->form_validation->run() === TRUE) {
            pr($this->input->post());
            die;
            $data = array(
                "name" => $this->input->post('name'),
                'cities_id'=>$this->input->post('city')
            );
            $sub_courses = "";
            if (is_array($this->input->post('sub_course')) && $this->input->post('sub_course') != "") {
                $sub_courses = $this->input->post('sub_course');
            }
            if ($this->input->post('id') > 0) {
                $data['slug'] = create_unique_slug($this->input->post('name'), 'company_groups', 'slug', 'id', $this->input->post('id'));
            } else {
                $data['slug'] = create_unique_slug($this->input->post('name'), 'company_groups', 'slug');
            }
            if ($this->input->post('id') > 0) {
                $has_permission = $this->acl->has_permission('group-edit', FALSE);
                if ($has_permission === TRUE) {
                    $data['updated'] = date("Y-m-d H:i:s");
                    $this->db->update("groups", $data, array("id" => $this->input->post('id')));
                    if ($sub_courses != "") {
                        $this->db->where('group_id', $this->input->post('id'))->where_not_in('sub_course_id', $sub_courses)->delete('group_subcourses');
                        $exist_sub_courses_groups = $this->db->select('sub_course_id')->where('group_id', $this->input->post('id'))->where_in('sub_course_id', $sub_courses)->get('group_subcourses')->result_array();
                        $exist_sub_courses = array();
                        if (!empty($exist_sub_courses_groups)) {
                            foreach ($exist_sub_courses_groups as $value) {
                                $exist_sub_courses[] = $value['sub_course_id'];
                            }
                            $sub_courses = array_diff($sub_courses, $exist_sub_courses);
                        }
                        foreach ($sub_courses as $value) {
                            $cs_data[] = array(
                                'group_id' => $this->input->post('id'),
                                'sub_course_id' => $value
                            );
                        }
                        if (!empty($cs_data)) {
                            $this->db->insert_batch('group_subcourses', $cs_data);
                        }
                    }
                    $resource_id = $this->input->post('id');
                    $response['msg'] = __('GroupUpdateSuccess');
                    $response['mode'] = 'edit';
                }
            } else {
                $has_permission = $this->acl->has_permission('group-add', FALSE);
                if ($has_permission === TRUE) {
                    $data['status'] = 1;
                    $data['created'] = date("Y-m-d H:i:s");
                    $this->db->insert("groups", $data);
                    $resource_id = $this->db->insert_id();
                    if ($sub_courses != "") {
                        foreach ($sub_courses as $value) {
                            $cs_data[] = array(
                                'group_id' => $resource_id,
                                'sub_course_id' => $value
                            );
                        }
                        if (!empty($cs_data)) {
                            $this->db->insert_batch('group_subcourses', $cs_data);
                        }
                    }
                    $response['msg'] = __('GroupAddSuccess');
                    $response['mode'] = 'add';
                }
            }
            if ($has_permission === TRUE) {
                $detail = $this->group->getById($resource_id);
                $detail->created = date(DATE_FORMATE, strtotime($detail->created));
                $detail->image = img($img_path, FALSE, array('width' => 100));
                $detail->statusButtons = $this->layout->element('admin/element/_module_status', array('status' => $detail->status, 'id' => $detail->id, 'url' => "admin/groups/changestatus", 'permissionKey' => "group-status"), true);
                $detail->actionButtons = $this->layout->element('admin/element/_module_action', array('id' => $detail->id, 'editUrl' => 'admin/groups/manage', 'deleteUrl' => 'admin/groups/delete', 'editPermissionKey' => 'group-edit', 'deletePermissionKey' => 'group-delete'), true);

                $sub_courses = $this->sub_course->get_group_subcourses(array('group_id' => $detail->id));
                $sub_courses_ids = filterAssocArray($sub_courses, 'id');
                $sub_courses = filterAssocArray($sub_courses, 'name');
                $sub_coursesString = empty($sub_courses) ? '' : implode(',', $sub_courses);
                $sub_courses_idsString = empty($sub_courses_ids) ? '' : json_encode($sub_courses_ids);

                $detail->sub_courses = $sub_coursesString . '<div class="sub_courses" style="display:none;">' . $sub_courses_idsString . '</div>';
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
                if ($id > 0 && $this->db->where("id", $id)->delete("groups")) {
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
                    $this->db->where("id", $id)->update("groups", array("status" => 0));
                    $response['success'] = __('GroupInactiveSuccess');
                } else if ($status == "0") {
                    $this->db->where("id", $id)->update("groups", array("status" => 1));
                    $response['success'] = __('GroupActiveSuccess');
                }
            } else {
                $response['error'] = $has_permission;
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

}
