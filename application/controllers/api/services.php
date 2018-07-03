<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/Rest_server.php';

class Services extends Rest_server {

    function __construct() {
        parent::__construct();
    }

    public function savelead_post() {
        $services_id = $this->getServiceId($this->post('service_name'));
        $cities_id = $this->getCityByAddress($this->post('location'));
        $data = array('name' => $this->post('name'),
            'email' => $this->post('email'),
            'location' => $this->post('location'),
            'cities_id' => $cities_id,
            'servicetypes_id' => $services_id,
            'service_to' => $this->post('service_to'),
            'source' => !empty($this->post('source')) ? $this->post('source') : NULL,
            'phone_number' => $this->post('phone'),
            'date' => !empty($this->post('date')) ? date('Y-m-d', strtotime($this->post('date'))) : NULL,
            'message' => $this->post('message'),
            'portals_id' => $this->post('portal_id'),
            'record_id' => $this->post('record_id'),
            'is_active' => 1
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

    public function users_get() {
        // Users from a data store e.g. database 
        $users = [
            ['id' => 1, 'name' => 'John', 'email' => 'john@example.com', 'fact' => 'Loves coding', 'city' => $this->getCityByAddress('chandni chowk delhi')],
            ['id' => 2, 'name' => 'Jim', 'email' => 'jim@example.com', 'fact' => 'Developed on CodeIgniter'],
            ['id' => 3, 'name' => 'Jane', 'email' => 'jane@example.com', 'fact' => 'Lives in the USA', ['hobbies' => ['guitar', 'cycling']]],
        ];
        $this->set_response($users, Rest_server::HTTP_OK);
    }

    private function getServiceId($service_name = '') {
        $sql = $this->db->select('id')->get_where('servicetypes', array('name' => $service_name, 'is_delete' => 0));
        if ($sql->num_rows() > 0) {
            return $sql->row()->id;
        } else {
            return NULL;
        }
    }

    private function getCityId($city_name = '') {
        $sql = $this->db->select('id')->get_where('cities', array('name' => $city_name, 'is_delete' => 0));
        if ($sql->num_rows() == 0) {
            $city_name = str_replace(' ', '|', $city_name);
            $sql = $this->db->select('id')->where(array('is_delete' => 0, "name REGEXP '$city_name'" => NULL))->limit(1)->get('cities');
        }
        if ($sql->num_rows() > 0) {
            return $sql->row()->id;
        } else {
            return NULL;
        }
    }

    private function getCityByAddress($address = "") {
        if (!empty($address)) {
            $address = urlencode($address);
            $geocode = file_get_contents("https://maps.googleapis.com/maps/api/geocode/json?address=$address&components=country:IN&key=" . GOOGLE_MAP_KEY);
            $output = json_decode($geocode);
            if (isset($output->results[0]->geometry->location->lat)) {
                $lat = $output->results[0]->geometry->location->lat;
                $long = $output->results[0]->geometry->location->lng;
                $geocode = file_get_contents("https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$long&sensor=false&key=" . GOOGLE_MAP_KEY);
                $output = json_decode($geocode);
                if (isset($output->results[0]->address_components)) {
                    $address_compoment = $output->results[0]->address_components;
                    foreach ($address_compoment as $key) {
                        if (isset($key->types[0]) && $key->types[0] == 'administrative_area_level_2') {
                            if (isset($key->long_name)) {
                                return $this->getCityId($key->long_name);
                            }
                        }
                    }
                }
            }
        }
        return NULL;
    }

    public function send_lead_get() {
        $this->load->model(array('lead_model' => 'lead', 'company_model' => 'company'));
        $lead_id = '18';
        $leadDetail = $this->lead->getById($lead_id, true);
        if (isset($leadDetail->status) && $leadDetail->status == 0 && $leadDetail->servicetypes_id > 0 && $leadDetail->cities_id) {
            $companies = $this->company->get_companies_by_city_service($leadDetail->servicetypes_id, $leadDetail->cities_id);
            $sentCounter = 0;
            if ($companies->num_rows() > 0) {
                $companies_result = $companies->result();
                foreach ($companies_result as $key => $row) {
                    $row->todaySentLead = $this->company->total_lead_sent_today($row->id);
                    if ($row->lead_sent_flag == 0 && $sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                        if ($row->lead_limit >= $row->todaySentLead || is_null($row->lead_limit) || $row->lead_limit == "") {
                            //set sent flag for company
                            if ($this->send_message($row, $leadDetail)) {
                                $sentCounter++;
                                $this->db->where('id', $row->id)->set('lead_sent_flag', 1)->update('companies');
                                $companies_result[$key]->lead_sent_flag = 1;
                            }
                        }
                    }
                }
                if ($sentCounter < MAX_LEAD_SENT_TO_COMPANY && $companies->num_rows() >= MAX_LEAD_SENT_TO_COMPANY) {
                    foreach ($companies_result as $key => $row) {
                        $this->db->where('id', $row->id)->set('lead_sent_flag', 0)->update('companies');
                        $companies_result[$key]->lead_sent_flag = 0;
                    }
                    foreach ($companies_result as $key => $row) {
                        if ($row->lead_sent_flag == 0 && $sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                            if ($row->lead_limit >= $row->todaySentLead || is_null($row->lead_limit) || $row->lead_limit == "") {
                                //set sent flag for company 
                                if ($this->send_message($row, $leadDetail)) {
                                    $sentCounter++;
                                    $this->db->where('id', $row->id)->set('lead_sent_flag', 1)->update('companies');
                                    $companies_result[$key]->lead_sent_flag = 1;
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    private function send_sms($company_detail, $lead_detail) {
        /* Send Lead to company via sms */
        $message = "Hello, %nPlease give $lead_detail->service_name quotation to the following customer:%n$lead_detail->name($lead_detail->phone_number),%n %nBookMyTempo";
        $this->load->helper('email_helper');

        $contacts = [$company_detail->phone1];
        if ($company_detail->phone2 != "") {
            array_push($contacts, $company_detail->phone2);
        }
        pr($contacts);
        die;
        //sendsms(array($contacts), $message);
        /* Send company */
    }

    private function send_email($company_detail, $lead_detail) {
        /* Send Lead to company via email */
        $this->load->helper('email_helper');
        $email = $company_detail->email;
        $code = $forgotten['forgotten_password_code'];
        $this->load->helper('email_helper');
        $replaceFrom = array('{service}', '{customer_detail}');
        $replaceTo = array($lead_detail->service_name, $lead_detail->name($lead_detail->phone_number));
        sendMailByTemplate('forgot-password', $replaceFrom, $replaceTo, $email);
    }

}
