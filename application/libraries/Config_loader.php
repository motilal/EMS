<?php

defined('BASEPATH') OR exit('No direct script access allowed.');

/**
 * Name:    Config loader
 * Author:  Motilal Soni
 *           motilalsoni@gmail.com 
 * 
 *
 * Created:  03.03.2018
 *
 * Description: This library pass data to all views and controllers  and can be used to load config
 * 
 */
class Config_loader {

    protected $CI;
    var $viewData = array();

    public function __construct() {
        $this->CI = & get_instance();
        if ($this->CI->ion_auth->logged_in()) {
            $this->viewData['_UserAuth'] = $this->CI->ion_auth->user()->row();
        }
        $this->CI->load->vars($this->viewData);
    }

}
