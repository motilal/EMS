<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/Rest_server.php';

class Services extends Rest_server {

    function __construct() {
        parent::__construct();
    }

    public function savelead_post() {
        $services_id = $this->getServiceId($this->post('service_name'));
        $cities_id = $this->send_lead->getCityByAddress($this->post('location'));
        $sub_cities_id = $this->send_lead->getZipByAddress($this->post('location'));
        if (!empty($this->post('service_to'))) {
            $destination_cities_id = $this->send_lead->getCityByAddress($this->post('service_to'));
            $destination_sub_cities_id = $this->send_lead->getZipByAddress($this->post('service_to'));
        }
        $data = array('name' => $this->post('name'),
            'email' => $this->post('email'),
            'source_location' => $this->post('location'),
            'cities_id' => $cities_id,
            'sub_cities_id' => !empty($sub_cities_id) ? $sub_cities_id : NULL,
            'destination_location' => !empty($this->post('service_to')) ? $this->post('service_to') : NULL,
            'destination_cities_id' => !empty($destination_cities_id) ? $destination_cities_id : NULL,
            'destination_sub_cities_id' => !empty($destination_sub_cities_id) ? $destination_sub_cities_id : NULL,
            'services_id' => $services_id,
            'source' => !empty($this->post('source')) ? $this->post('source') : NULL,
            'phone_number' => $this->post('phone'),
            'date' => !empty($this->post('date')) ? date('Y-m-d', strtotime($this->post('date'))) : NULL,
            'message' => $this->post('message'),
            'portals_id' => $this->post('portal_id'),
            'record_id' => $this->post('record_id'),
            'is_active' => 1,
            'created' => date('Y-m-d H:i:s')
        );
        $data = filterPostData($data);
        if (empty($data)) {
            return FALSE;
        }
        if ($this->db->insert('leads', $data)) {
            $last_insert_id = $this->db->insert_id();
            $CurrentTime = new DateTime();
            $LeadSentStartTime = DateTime::createFromFormat('H:i:s', '07:00:00');
            $LeadSentEndTime = DateTime::createFromFormat('H:i:s', '23:58:00');
            if (($CurrentTime > $LeadSentStartTime) && ($CurrentTime < $LeadSentEndTime)) {
                $this->load->library('send_lead');
                $this->send_lead->send($last_insert_id);
            }
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
  
    public function lead_send_cron_get() {
        $this->load->model(['setting_model' => 'setting']);
        if ($this->setting->item('lead_send_cron') == 'On') {
            $condition = ['is_delete' => '0', 'status' => 0, 'DATE(created) >= "2018-08-07"' => NULL];
            $pending_leads = $this->db->select('id,status')->where($condition)->get('leads');
            if ($pending_leads->num_rows() > 0) {
                foreach ($pending_leads->result() as $row) {
                    $this->load->library('send_lead');
                    $response[$row->id] = $this->send_lead->send($row->id);
                    $this->set_response($response, Rest_server::HTTP_OK);
                }
            }
        }
    }

    private function getServiceId($service_name = '') {
        $sql = $this->db->select('id')->get_where('services', array('name' => $service_name, 'is_delete' => 0));
        if ($sql->num_rows() > 0) {
            return $sql->row()->id;
        } else {
            return NULL;
        }
    }
  

    public function send_lead_get() {
        $this->load->library('send_lead');
        $this->send_lead->customer_sms_test();
        //$this->send_lead->send(18);
    }

}
