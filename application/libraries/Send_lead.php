<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Send_lead {

    public function __construct() {
        $this->load->model(array('lead_model' => 'lead', 'company_model' => 'company', 'setting_model' => 'setting'));
        $this->load->helper('email_helper');
    }

    public function __get($var) {
        return get_instance()->$var;
    }

    public function send($lead_id = '') {
        if (empty($lead_id)) {
            return FALSE;
        }
        $leadDetail = $this->lead->getById($lead_id, true);
        if (isset($leadDetail->status) && $leadDetail->status == 0 && $leadDetail->services_id > 0 && $leadDetail->cities_id) {
            $todayLeadDuplicate = $this->company->duplicate_lead_check($leadDetail->phone_number, $leadDetail->services_id);
            if ($todayLeadDuplicate > 1) {
                $this->db->where('id', $leadDetail->id)->set('status', 3)->update('leads');
                return FALSE;
            }
            $companies = $this->company->get_companies_by_city_service($leadDetail);
            $sentCounter = 0;
            if ($companies->num_rows() > 0) {
                $companies_result = $companies->result();
                $leadSendToCompanies = [];
                foreach ($companies_result as $key => $row) {
                    $row->todaySentLead = $this->company->total_lead_sent_today($row->id);
                    if ($row->lead_sent_flag == 0 && $sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                        if ($row->lead_limit > $row->todaySentLead || is_null($row->lead_limit) || $row->lead_limit == "") {
                            //set sent flag for company
                            if ($this->updateLeadSend($row->id, $lead_id) === TRUE) {
                                $this->send_sms_to_company($row, $leadDetail);
                                $this->send_email_to_company($row, $leadDetail);
                                $sentCounter++;
                                $companies_result[$key]->lead_sent_flag = 1;
                                $leadSendToCompanies[] = $row->name . '(' . $row->phone1 . ')';
                            }
                        }
                    }
                }
                if ($sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                    foreach ($companies_result as $key => $row) {
                        $this->db->where('id', $row->id)->set('lead_sent_flag', 0)->update('companies');
                        $companies_result[$key]->lead_sent_flag = 0;
                    }
                    foreach ($companies_result as $key => $row) {
                        if (!in_array($row->name, $leadSendToCompanies)) {
                            $row->todaySentLead = $this->company->total_lead_sent_today($row->id);
                            if ($row->lead_sent_flag == 0 && $sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                                if ($row->lead_limit > $row->todaySentLead || is_null($row->lead_limit) || $row->lead_limit == "") {
                                    //set sent flag for company 
                                    if ($this->updateLeadSend($row->id, $lead_id) === TRUE) {
                                        $this->send_sms_to_company($row, $leadDetail);
                                        $this->send_email_to_company($row, $leadDetail);
                                        $sentCounter++;
                                        $companies_result[$key]->lead_sent_flag = 1;
                                        $leadSendToCompanies[] = $row->name . '(' . $row->phone1 . ')';
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (!empty($leadSendToCompanies)) {
                $this->send_sms_to_customer($leadSendToCompanies, $leadDetail);
                $this->send_email_to_customer($leadSendToCompanies, $leadDetail);
            }
        }
    }

    public function send_manual($lead_id = '', $company_ids = []) {
        if (empty($company_ids)) {
            return;
        }
        $leadSendToCompanies = [];
        $leadDetail = $this->lead->getById($lead_id, true);
        foreach ($company_ids as $company_id) {
            $companyDetail = $this->company->getById($company_id, true);
            if (!empty($companyDetail)) {
                $updateLeadSend = $this->updateLeadSend($companyDetail->id, $lead_id);
                if ($updateLeadSend === TRUE) {
                    $this->send_sms_to_company($companyDetail, $leadDetail);
                    $this->send_email_to_company($companyDetail, $leadDetail);
                    $leadSendToCompanies[] = $companyDetail->name;
                }
                $leadSendToCompanies[] = $companyDetail->name;
            }
        }
        if (!empty($leadSendToCompanies)) {
            $leadSendToCompaniesStr = implode(',', $leadSendToCompanies);
            return ['status' => 'success', 'message' => "The lead successfully sent to </strong>{$leadSendToCompaniesStr}</strong>"];
        } else {
            return ['status' => 'error', 'message' => "Something error occurs."];
        }
    }

    public function resend_lead($leads_sent_history_id) {
        $lead_sent_history = $this->db->get_where('leads_sent_history', array('id' => $leads_sent_history_id));
        if ($lead_sent_history->num_rows() > 0) {
            $lead_sent_history_row = $lead_sent_history->row();
            $leadDetail = $this->lead->getById($lead_sent_history_row->leads_id, true);
            $companyDetail = $this->company->getById($lead_sent_history_row->companies_id, true);
            $this->send_sms_to_company($companyDetail, $leadDetail);
            $this->send_email_to_company($companyDetail, $leadDetail);
            return TRUE;
        }
    }

    private function send_sms_to_company($company_detail, $lead_detail) {
        /* Send Lead to company via sms */
        if ($this->setting->item('send_lead_to_customer') == 'On') {
            $customerDetail = $lead_detail->name . '(' . $lead_detail->phone_number . ')';
            $customerDetail = substr($customerDetail, 0, 70);
            $lead_detail->service_name = substr($lead_detail->service_name, 0, 25);
            $message = "Hello, %nPlease give $lead_detail->service_name quotation to the following customer:%n$customerDetail,%n %nBookMyTempo";
            $contacts = ['91' . $company_detail->phone1];
            if ($company_detail->phone2 != "") {
                array_push($contacts, '91' . $company_detail->phone2);
            }
            $sendSms = TRUE;
            $sendSms = sendsms($contacts, $message);
            if ($sendSms === TRUE) {
                return TRUE;
            }
        }
        /* Send company */
    }

    private function send_email_to_company($company_detail, $lead_detail) {
        if ($this->setting->item('send_lead_to_customer') == 'On') {
            /* Send Lead to company via email */
            $email = $company_detail->email;
            $replaceFrom = array('{service}', '{customer_detail}');
            $customer_detail = "Name: $lead_detail->name \n Phone: $lead_detail->phone_number \n Service: $lead_detail->service_name";
            $replaceTo = array($lead_detail->service_name, nl2br($customer_detail));
            sendMailByTemplate('send-lead-to-company', $replaceFrom, $replaceTo, $email);
        }
    }

    private function send_sms_to_customer($companies, $lead_detail) {
        if ($this->setting->item('send_lead_to_customer') == 'On') {
            if (count($companies) > 0) {
                $companies = implode(',', $companies);
                /* Send sms to customer */
                $lead_detail->name = substr($lead_detail->name, 0, 10);
                $lead_detail->service_name = substr($lead_detail->service_name, 0, 22);
                $companies = substr($companies, 0, 208);

                $message = "Hi $lead_detail->name,%nThanks for $lead_detail->service_name.You will be contacted by these professionals:%n %n$companies";
                $contacts = ['91' . $lead_detail->phone_number];
                $sendSms = TRUE;
                $sendSms = sendsms($contacts, $message);
                if ($sendSms === TRUE) {
                    return TRUE;
                }
            }
        }
    }

    private function send_email_to_customer($companies, $lead_detail) {
        if ($this->setting->item('send_lead_to_customer') == 'On') {
            if (count($companies) > 0) {
                $companies = implode(',', $companies);
                /* Send Lead detail handler to customer */
                $email = $lead_detail->email;
                $replaceFrom = array('{service}', '{company_detail}', '{customer}');
                $replaceTo = array($lead_detail->service_name, $companies, $lead_detail->name);
                sendMailByTemplate('send-company-detail-to-customer', $replaceFrom, $replaceTo, $email);
            }
        }
    }

    public function customer_sms_test() {
        die;
        $message = "Hi Motilal Soni,%nThanks for Rent on truck.You will be contacted by these professionals:%n %nTech Mahindra";
        sendsms(array('919024978491'), $message);
    }

    private function updateLeadSend($company_id, $lead_id) {
        $companies_package_id = $this->company->get_company_active_package($company_id);
        if ($companies_package_id) {
            $check_lead_duplicate_sent = $this->db->select('id')->where(['leads_id' => $lead_id, 'companies_id' => $company_id])->get('leads_sent_history')->num_rows();
            if ($check_lead_duplicate_sent <= 0) {
                $this->db->where('id', $company_id)->set('lead_sent_flag', 1)->update('companies');
                $array = ['leads_id' => $lead_id, 'companies_package_id' => $companies_package_id, 'companies_id' => $company_id, 'status' => '1', 'created' => date('Y-m-d H:i:s')];
                $this->db->insert('leads_sent_history', $array);
                $this->db->where(["id" => $companies_package_id])->set('total_leads', 'total_leads-1', FALSE)->set('used_leads', 'used_leads+1', FALSE)->update("companies_package");
                $this->db->where(["id" => $lead_id])->set('status', '1')->update("leads");
                return TRUE;
            } else {
                return ['status' => 'error', 'message' => 'Lead already sent to the company'];
            }
        } else {
            return ['status' => 'error', 'message' => 'The company does not have any active package'];
        }
    }

    private function getSubCityIdByPincode($pin_code = '') {
        $sql = $this->db->select('id')->get_where('sub_cities', array('pin_code' => $pin_code, 'is_delete' => 0));
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

    public function getCityByAddress($address = "") {
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
                        if (isset($key->types[0]) && $key->types[0] == 'locality') {
                            $option_city = $key->long_name;
                        }
                        if (isset($key->types[0]) && $key->types[0] == 'administrative_area_level_2') {
                            if (isset($key->long_name)) {
                                $cityId = $this->getCityId($key->long_name);
                                if ($cityId == "" && $option_city != "") {
                                    $cityId = $this->getCityId($option_city);
                                }
                                return $cityId;
                            }
                        }
                    }
                }
            }
        }
        return NULL;
    }

    public function getZipByAddress($address = "") {
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
                        if (isset($key->types[0]) && $key->types[0] == 'postal_code') {
                            if (isset($key->long_name)) {
                                $subcityId = $this->getSubCityIdByPincode($key->long_name);
                                return $subcityId;
                            }
                        }
                    }
                }
            }
        }
        return NULL;
    }

}
