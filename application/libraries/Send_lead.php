<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Send_lead {

    public function __construct() {
        $this->load->model(array('lead_model' => 'lead', 'company_model' => 'company'));
        $this->load->helper('email_helper');
    }

    public function __get($var) {
        return get_instance()->$var;
    }

    public function send($lead_id = '') {
        if (empty($lead_id)) {
            return false;
        }
        $leadDetail = $this->lead->getById($lead_id, true);
        if (isset($leadDetail->status) && $leadDetail->status == 0 && $leadDetail->servicetypes_id > 0 && $leadDetail->cities_id) {
            $companies = $this->company->get_companies_by_city_service($leadDetail->servicetypes_id, $leadDetail->cities_id);
            $sentCounter = 0;
            if ($companies->num_rows() > 0) {
                $companies_result = $companies->result();
                $leadSendToCompanies = [];
                foreach ($companies_result as $key => $row) {
                    $row->todaySentLead = $this->company->total_lead_sent_today($row->id);
                    if ($row->lead_sent_flag == 0 && $sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                        if ($row->lead_limit >= $row->todaySentLead || is_null($row->lead_limit) || $row->lead_limit == "") {
                            //set sent flag for company
                            if ($this->updateLeadSend($row->id, $lead_id) === TRUE) {
                                $this->send_sms_to_company($row, $leadDetail);
                                $this->send_email_to_company($row, $leadDetail);
                                $sentCounter++;
                                $companies_result[$key]->lead_sent_flag = 1;
                                $leadSendToCompanies[] = $row->name;
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
                            if ($row->lead_sent_flag == 0 && $sentCounter < MAX_LEAD_SENT_TO_COMPANY) {
                                if ($row->lead_limit >= $row->todaySentLead || is_null($row->lead_limit) || $row->lead_limit == "") {
                                    //set sent flag for company 
                                    if ($this->updateLeadSend($row->id, $lead_id) === TRUE) {
                                        $this->send_sms_to_company($row, $leadDetail);
                                        $this->send_email_to_company($row, $leadDetail);
                                        $sentCounter++;
                                        $companies_result[$key]->lead_sent_flag = 1;
                                        $leadSendToCompanies[] = $row->name;
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

    public function send_manual($lead_id = '', $company_id = '') {
        if (empty($company_id)) {
            return;
        }
        $leadDetail = $this->lead->getById($lead_id, true);
        $companyDetail = $this->company->getById($company_id, true);
        if (!empty($companyDetail)) {
            $leadSendToCompany = FALSE;
            $check_lead_total_sent = $this->db->select('id')->where(['leads_id' => $lead_id])->get('leads_sent_history')->num_rows();
            if ($check_lead_total_sent >= MAX_LEAD_SENT_TO_COMPANY) {
                return ['status' => 'error', 'message' => 'Lead exceed total sent limit.'];
            }
            $companyDetail->todaySentLead = $this->company->total_lead_sent_today($companyDetail->id);
            if ($companyDetail->lead_limit >= $companyDetail->todaySentLead || is_null($companyDetail->lead_limit) || $companyDetail->lead_limit == "") {
                //set sent flag for company
                $updateLeadSend = $this->updateLeadSend($companyDetail->id, $lead_id);
                if ($updateLeadSend === TRUE) {
                    $this->send_sms_to_company($companyDetail, $leadDetail);
                    $this->send_email_to_company($companyDetail, $leadDetail);
                    $leadSendToCompany = $companyDetail->name;
                } else {
                    return $updateLeadSend;
                }
            } else {
                return ['status' => 'error', 'message' => 'This company exceed max today lead sent limit.'];
            }

            if (!empty($leadSendToCompany)) {
                //$this->send_sms_to_customer($leadSendToCompany, $leadDetail);
                //$this->send_email_to_customer($leadSendToCompany, $leadDetail);
            }
            return TRUE;
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
        return TRUE;
        /* Send Lead to company via sms */
        $customerDetail = $lead_detail->name . '(' . $lead_detail->phone_number . ')';
        $customerDetail = substr($customerDetail, 0, 70);
        $lead_detail->service_name = substr($lead_detail->service_name, 0, 25);
        $message = "Hello, %nPlease give $lead_detail->service_name quotation to the following customer:%n$customerDetail,%n %nBookMyTempo";
        $contacts = [$company_detail->phone1];
        if ($company_detail->phone2 != "") {
            array_push($contacts, $company_detail->phone2);
        }
        $sendSms = TRUE;
        $sendSms = sendsms(array($contacts), $message);
        if ($sendSms === TRUE) {
            return TRUE;
        }
        /* Send company */
    }

    private function send_email_to_company($company_detail, $lead_detail) { 
        /* Send Lead to company via email */
        $email = $company_detail->email;
        $email = 'motilalsoni@gmail.com';
        $replaceFrom = array('{service}', '{customer_detail}');
        $customer_detail = "Name: $lead_detail->name \n Phone: $lead_detail->phone_number \n Service: $lead_detail->service_name";
        $replaceTo = array($lead_detail->service_name, nl2br($customer_detail));
        sendMailByTemplate('send-lead-to-company', $replaceFrom, $replaceTo, $email);
    }

    private function send_sms_to_customer($companies, $lead_detail) {
        return TRUE;
        if (count($companies) > 0) {
            $companies = implode(',', $companies);
            /* Send sms to customer */
            $lead_detail->name = substr($lead_detail->name, 0, 10);
            $lead_detail->service_name = substr($lead_detail->service_name, 0, 22);
            $companies = substr($companies, 0, 208);

            $message = "Hi $lead_detail->name,%nThanks for $lead_detail->service_name.You will be contacted by these professionals:%n %n$companies";
            $contacts = [$lead_detail->phone_number];
            $sendSms = TRUE;
            $sendSms = sendsms(array($contacts), $message);
            if ($sendSms === TRUE) {
                return TRUE;
            }
        }
    }

    private function send_email_to_customer($companies, $lead_detail) {
        return TRUE;
        if (count($companies) > 0) {
            $companies = implode(',', $companies);
            /* Send Lead detail handler to customer */
            $email = $lead_detail->email;
            $email = 'motilalsoni@gmail.com';
            $replaceFrom = array('{service}', '{company_detail}', '{customer}');
            $replaceTo = array($lead_detail->service_name, $companies, $lead_detail->name);
            sendMailByTemplate('send-company-detail-to-customer', $replaceFrom, $replaceTo, $email);
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

}
