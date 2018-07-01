<?php

/**
 * Description of Sms
 *
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Sms extends CI_Controller {

    var $viewData = array();
    var $per_page = DEFAULT_PAGING;

    public function __construct() {
        parent::__construct();
        $this->site_santry->allow(array());
        $this->layout->set_layout("layout/layout_admin");
        $this->viewData['pageModule'] = 'SMS Manager';
    }

    public function index() {
        $this->acl->has_permission('sms-index');
        if ($this->input->is_ajax_request()) {
            $orderColomn = array(4 => 'sort_order');
            $params = dataTableGetRequest($this->input->get(), $orderColomn);
            $result = $this->get_list($params->limit, $params->order);
            if ($result->status == 'success' && $result->total > 0) {
                $response['data'] = $this->showTableData($result->messages);
            } else {
                $response['data'] = array();
            }
            $response['recordsFiltered'] = $response['recordsTotal'] = $result->total;
            $this->output->set_content_type('application/json')->set_output(json_encode($response))->_display();
            exit();
        }
        $result = $this->get_list(array('start' => 0, 'limit' => $this->per_page), '');
        if ($result->status == 'success' && $result->total > 0) {
            $this->viewData['result'] = $this->showTableData($result->messages);
        }

        $this->viewData['title'] = "SMS History";
        $this->viewData['datatable_asset'] = true;
        $this->viewData['pageHeading'] = 'SMS History';
        $this->viewData['breadcrumb'] = array('SMS Manager' => 'cities', $this->viewData['title'] => '');
        $this->layout->view("sms/index", $this->viewData);
    }

    private function get_list($limit = array(), $order = array()) {
        $apiKey = urlencode(TEXT_LOCAL_APIKEY);
        $data = array('apikey' => $apiKey, 'start' => $limit['start'], 'limit' => $limit['limit'], 'sort_order' => isset($order[1]) ? $order[1] : 'DESC');
        $ch = curl_init('https://api.textlocal.in/get_history_single/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);
        return json_decode($response);
    }

    private function showTableData($data) {
        $resultData = array();
        if ($data != "") {
            foreach ($data as $key => $row) {
                $rowData = array();
                $rowData[0] = getPageSerial($this->input->get('length'), $this->input->get('start'), $key);
                $rowData[1] = $row->id;
                $rowData[2] = $row->number;
                $rowData[3] = $row->content;
                $rowData[4] = date(DATETIME_FORMATE, strtotime($row->datetime));
                $rowData[5] = $row->status == 'D' ? '<span class="text-green">Delivered</span>' : '<span class="text-red">Sent</span>';
                $resultData[] = $rowData;
            }
        }
        return $resultData;
    }

    public function test() {
        $apiKey = urlencode('pFn1aqBql5k-yXzvvQ5UwEs6ImeGwYQsQK7fN7wqTe');
        // Prepare data for POST request
        $data = array('apikey' => $apiKey);

        // Send the POST request with cURL
        $ch = curl_init('https://api.textlocal.in/get_history_group/');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response = curl_exec($ch);
        curl_close($ch);

        // Process your response here
        echo $response;
    }

}
