<?php

/*
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Database_backups extends CI_Controller {

    var $viewData = array();

    public function __construct() {
        parent::__construct(); 
        $this->site_santry->allow(array());
        is_allow_admin();
        $this->layout->set_layout("layout/layout_admin");
    }

    function index() {
        $this->load->helper('directory');
        $map = directory_map(APPPATH . 'db', 1);
        $backupFiles = array();
        foreach ($map as $key => $val) {
            $ext = pathinfo($val, PATHINFO_EXTENSION);
            if ($ext == 'zip') {
                $filePath = APPPATH . "db/$val";
                $backupFiles[$key]['filename'] = $val;
                $backupFiles[$key]['created'] = date("Y-m-d H:i:s", filemtime($filePath));
                $backupFiles[$key]['filesize'] = filesize($filePath);
            }
        }
        $this->viewData['title'] = $this->viewData['pageHeading'] = "Database Backup Files";
        $this->viewData['pageModule'] = "Database Backup Manager";
        $this->viewData['backupFiles'] = $backupFiles;
        $this->viewData['datatable_asset'] = true;
        $this->viewData['breadcrumb'] = array('Database Backup' => 'database_backup');
        $this->layout->view("database_backup/index", $this->viewData);
    }

    public function delete() {
        $response = array();
        if ($this->input->is_ajax_request()) {
            $fileName = base64_decode($this->input->post('id'));
            $file = APPPATH . 'db/' . $fileName;
            if ($fileName != "" && file_exists($file)) {
                @unlink($file);
                $response['success'] = __('DatabaseBackUpDeleteSuccess');
            } else {
                $response['error'] = __('InvalidRequest');
            }
        }
        $this->output->set_content_type('application/json')->set_output(json_encode($response));
    }

    function create_db_backup() {
        $this->load->dbutil();
        $time = date('Y-m-d');
        $prefs = array(
            'tables' => array(),
            'ignore' => array('users', 'ci_sessions', 'login_attempts', 'users_groups'),
            'format' => 'zip',
            'filename' => "backup-$time.sql",
            'add_drop' => TRUE,
            'add_insert' => TRUE,
            'newline' => "\n"
        );
        $backup = $this->dbutil->backup($prefs);
        $this->load->helper('file');
        if (write_file(APPPATH . "db/backup-$time.zip", $backup)) {
            $this->session->set_flashdata("success", __('DatabaseBackUpCreated'));
        } else {
            $this->session->set_flashdata("error", __('InvalidRequest'));
        }
        redirect('database_backups');
    }

    function download($file = "") {
        if ($file == "") {
            show_404();
        }
        $fileName = base64_decode($file);
        $file = APPPATH . 'db/' . $fileName;
        if (file_exists($file)) {
            $this->load->helper('download');
            force_download($file, NULL);
        }
    }

}
