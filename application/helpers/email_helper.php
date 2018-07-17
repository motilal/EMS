<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!function_exists("sendmail")) {

    /**
     * 
     * @param type $mail_key
     * @param type $replace_from
     * @param type $replace_to
     * @param type $to
     * @param type $from
     * @param type $from_name
     * @param type $debug
     * @return boolean
     */
    function sendMailByTemplate($mail_key = "", $replace_from = array(), $replace_to = array(), $to = "", $from = "", $from_name = "", $debug = false) {
        $CI = & get_instance();
        $CI->load->model(array("email_template_model" => "email_template"));
        $mail_data = $CI->email_template->getBySlag($mail_key);
        if (!empty($mail_data)) {
            $subject = str_replace($replace_from, $replace_to, $mail_data->subject);
            $message = str_replace($replace_from, $replace_to, $mail_data->body);
            $CI->load->library('email');
            $mail_smtp = $CI->config->item("mail_smtp");
            $CI->email->initialize($mail_smtp);
            $CI->email->clear();

            if ($from == "" || $from_name == "") {
                $CI->email->reply_to(get_site_setting("site_email"), get_site_setting("site_title"));
                $CI->email->from($mail_smtp['smtp_user'], get_site_setting("site_title"));
            } else {
                $CI->email->reply_to($from, $from_name);
                $CI->email->from($mail_smtp['smtp_user'], $from_name);
            }
            $CI->email->to($to);
            $CI->email->subject($subject);
            $CI->email->message($message); 
            $CI->email->send();
            if ($debug == true) {
                echo $CI->email->print_debugger();
                die;
            }
        }
    }

    function sendsms($phone = array(), $message = '') {
        //echo $message; die;
        $apiKey = urlencode(TEXT_LOCAL_APIKEY);
        // Message details
        $numbers = array(919024978491);
        $sender = urlencode(TEXT_LOCAL_SENDER);
        $message = rawurlencode($message);
        $numbers = implode(',', $numbers);
        $data = array('apikey' => $apiKey, 'numbers' => $numbers, "message" => $message, 'sender' => $sender);
        // Send the POST request with cURL
        $ch = curl_init('https://api.textlocal.in/send/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);
        // Process your response here
        $response = json_decode($response); 
        if (isset($response->status) && $response->status == 'failure' && isset($response->errors)) {
            log_message('error', json_encode($response->errors));
            return false;
        } else {
            return true;
        }
    }

}
