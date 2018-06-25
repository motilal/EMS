<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/Rest_server.php';

class Services extends Rest_server {

    function __construct() {
        parent::__construct();
    }

    public function savelead_post() {
        $services_id = $this->getServiceId($this->post('service_name'));
        $data = array('name' => $this->post('name'),
            'email' => $this->post('email'),
            'location' => $this->post('location'),
            'servicetypes_id' => $services_id,
            'service_to' => $this->post('service_to'),
            'phone_number' => $this->post('phone'),
            'date' => !empty($this->post('date')) ? date('Y-m-d', strtotime($this->post('date'))) : NULL,
            'message' => $this->post('message'),
            'portals_id' => $this->post('portal_id'),
            'record_id' => $this->post('record_id')
        );
        $data = filterPostData($data);
        if (empty($data)) {
            return FALSE;
        }
        if ($this->db->insert('leads', $data)) {
            $message = [
                'status' => TRUE,
                'message' => 'New lead inserted successfully.'
            ];
        } else {
            $message = [
                'status' => False,
                'message' => 'Something error.'
            ];
        }
        $this->set_response($message, Rest_server::HTTP_CREATED);
    }

    private function getServiceId($service_name = '') {
        $sql = $this->db->select('id')->get_where('servicetypes', array('name' => $service_name, 'is_delete' => 0));
        if ($sql->num_rows() > 0) {
            return $sql->row()->id;
        } else {
            return NULL;
        }
    }

}
