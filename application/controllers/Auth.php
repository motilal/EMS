<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Auth extends CI_Controller {

    public $viewData;

    function __construct() {
        parent::__construct(); 
        $this->site_santry->allow(array("login", "logout", "forgot_password", "reset_password", "two_step_auth_login"));
        $this->load->library(array('ion_auth', 'form_validation'));
        $this->load->helper(array('language'));
        $this->layout->set_layout("layout/layout_login");
    }

    public function login() {
        if ($this->ion_auth->is_admin() || $this->ion_auth->is_subadmin()) {
            redirect('dashboard');
        }
        if ($this->input->post()) {
            $this->form_validation->set_rules('identity', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
            $this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');

            if ($this->form_validation->run() == TRUE) {
                if ($this->ion_auth->login($this->input->post('identity'), $this->input->post('password'))) {
                    updateSubadminPermission();
                    redirect($this->input->post('request') ? $this->input->post('request') : "/dashboard/?auth=verify");
                } else {
                    $this->session->set_flashdata('error', $this->ion_auth->errors());
                    redirect('/');
                }
            }
        }
        $this->viewData['request'] = $this->input->get("request") ? base64_decode($this->input->get('request')) : "";
        $this->viewData['title'] = "Admin Login";
        $this->layout->view("auth/login", $this->viewData);
    }

    public function two_step_auth_login($enc_email = "") {
        if (empty($enc_email)) {
            show_404();
        }
        $email = base64_decode($enc_email);
        $user = $this->db->where(array('email' => $email, 'authentication_code IS NOT NULL' => NULL))->get('users');
        if ($user->num_rows() > 0) {
            $this->form_validation->set_rules('code', 'Code', "required|callback__isValidateAuthCode[$email]");
            if ($this->form_validation->run() == false) {
                $this->viewData['title'] = "Login Authentication";
                $this->layout->view("auth/two_step_auth_login", $this->viewData);
            } else {
                if ($this->ion_auth->login($email, $this->session->userdata('_auth_password'), FALSE, FALSE)) {
                    $this->db->where('email', $email)->update('users', array('authentication_code' => NULL));
                    updateSubadminPermission();
                    redirect("/dashboard/?auth=verify");
                } else {
                    $this->session->set_flashdata('error', $this->ion_auth->errors());
                    redirect('/');
                }
            }
        } else {
            redirect("/");
        }
    }

    function _isValidateAuthCode($str, $email) {
        $user = $this->db->select('id')->where(array('email' => $email, 'authentication_code' => $str))->get('users');
        if ($user->num_rows() >= 1) {
            return TRUE;
        } else {
            $this->form_validation->set_message('_isValidateAuthCode', 'You have enter invalid code.');
            return FALSE;
        }
    }

    public function forgot_password() {
        if ($this->ion_auth->is_admin()) {
            redirect('dashboard');
        }
        $this->form_validation->set_rules('email', 'Email Address', 'required');
        if ($this->form_validation->run() == false) {
            $this->data['email'] = array(
                'name' => 'email',
                'id' => 'email'
            );
            $this->viewData['validation_message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');
            $this->viewData['title'] = "Admin Forgot Password";
            $this->layout->view("auth/forgot_password", $this->viewData);
        } else {
            $forgotten = $this->ion_auth->forgotten_password($this->input->post('email'));
            if ($forgotten) {
                $this->forgotPasswordEmail($forgotten);
                $this->session->set_flashdata('success', $this->ion_auth->messages());
                redirect("/");
            } else {
                $this->session->set_flashdata('error', $this->ion_auth->errors());
                redirect("auth/forgot_password", 'refresh');
            }
        }
    }

    private function forgotPasswordEmail($forgotten) {
        if (!empty($forgotten['identity']) && !empty($forgotten['forgotten_password_code'])) {
            $email = $forgotten['identity'];
            $code = $forgotten['forgotten_password_code'];
            $this->load->helper('email_helper');
            $replaceFrom = array('{name}', '{link}');
            $replaceTo = array($email, site_url("auth/reset_password/$code"));
            sendMailByTemplate('forgot-password', $replaceFrom, $replaceTo, $email);
        }
    }

    public function reset_password($code = "") {
        $reset = $this->ion_auth->forgotten_password_complete($code);
        if ($reset) {
            $this->resetPasswordEmail($reset);
            $this->session->set_flashdata('success', $this->ion_auth->messages());
            redirect("/", 'refresh');
        } else {
            $this->session->set_flashdata('error', $this->ion_auth->errors());
            redirect("auth/forgot_password", 'refresh');
        }
    }

    private function resetPasswordEmail($params) {
        if (!empty($params['identity']) && !empty($params['new_password'])) {
            $email = $params['identity'];
            $password = $params['new_password'];
            $this->load->helper('email_helper');
            $replaceFrom = array('{name}', '{password}');
            $replaceTo = array($email, $password);
            sendMailByTemplate('reset-password', $replaceFrom, $replaceTo, $email);
        }
    } 

    public function logout() {
        $logout = $this->ion_auth->logout();
        redirect('/', 'refresh');
    }

}
