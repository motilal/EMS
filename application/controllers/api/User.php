<?php error_reporting(E_ALL & ~E_NOTICE); ?>
<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class User extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->library(array('form_validation', 'session', 'encrypt'));
        $this->load->helper(array('url', 'html', 'form'));
        $this->load->database();
    }

    public function index() {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['city'] = $this->User_model->get_city();
        $data['member'] = $this->User_model->get_member();
        $data['get_services'] = $this->User_model->get_services();
        $data['allsettings'] = $this->User_model->allsettings();
        $data['gettestimonial'] = $this->User_model->gettestimonial();
        $data['homeContentdata'] = $this->User_model->homecontentmodel();
        $data['faqhomeListing'] = $this->User_model->faqhomeListing();
        $data['catlist'] = $this->User_model->catlist();
        $this->load->helper('string');
        $this->load->helper('captcha');

        $rand = random_string('numeric', 4);
        $vals = array(
            'word' => $rand,
            'img_path' => './captcha/',
            'img_url' => './captcha/',
            'font_path' => './assets/fonts/times_new_yorker.ttf',
            'img_width' => '100%',
            'img_height' => 35,
            'expiration' => 7200,
            'font_size' => 14
        );
        $cap = create_captcha($vals);

        $data['cap'] = $cap;
        $this->load->view('index', $data);
    }

    public function register() {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['state'] = $this->User_model->get_state();
        $data['city'] = $this->User_model->get_city();
        $data['service'] = $this->User_model->get_services();
        $this->load->helper('string');
        $this->load->helper('captcha');

        $rand = random_string('numeric', 4);
        $vals = array(
            'word' => $rand,
            'img_path' => './captcha/',
            'img_url' => './captcha/',
            'font_path' => './assets/fonts/times_new_yorker.ttf',
            'img_width' => '130',
            'img_height' => 35,
            'expiration' => 7200,
            'font_size' => 16
        );
        $cap = create_captcha($vals);

        $data['cap'] = $cap;
        $this->load->view('register', $data);
    }

    public function login() {
        $session_data = $this->session->userdata('logged_in');
        $data['user_email'] = $session_data['user_email'];
        $data['user_name'] = $session_data['user_name'];
        $data['user_number'] = $session_data['user_number'];
        $data['user_id'] = $session_data['user_id'];
        $data['city'] = $this->User_model->get_city();
        $data['google_analytics'] = $this->User_model->google_analytics();
        $this->load->view('login', $data);
    }

    public function Checklogin() {
        $this->form_validation->set_rules('username', 'username', 'required');
        if ($this->form_validation->run() == FALSE) {
            $current_url = $this->input->post('current_url');

            redirect($current_url);
        } else {
            $current_url = $this->input->post('current_url');

            $data = array(
                'user_name' => $this->input->post('username'),
                'password' => $this->input->post('password'),
                'status' => 1
            );

            $result = $this->User_model->user_login($data);
            if ($result == TRUE) {
                $session_result = $this->User_model->session_data($data['user_name']);
                $sess_array = array(
                    'user_name' => $this->input->post('username'),
                    'user_number' => $session_result[0]['user_number'],
                    'user_email' => $session_result[0]['user_email'],
                    'user_id' => $session_result[0]['user_id']
                );
                // Add user data in session
                $this->session->set_userdata('logged_in', $sess_array);
                if ($result != false) {
                    $data = array(
                        'user_email' => $result[0]->user_email
                    );
                    redirect($current_url);
                }
            } else {
                $data = array(
                    'error_message' => 'Invalid Username or Password'
                );
                $data['message1'] = 'Invalid Username And Password';
                redirect($current_url);
            }
        }
    }

    public function logout() {

// Removing session data
        $sess_array = array(
            'username' => ''
        );
        $this->session->unset_userdata('logged_in', $sess_array);
        $data['message_display'] = '<h4 style="text-align:center;">Successfully Logout</h4>';
        redirect();
    }

    public function user_register_submit() {
        $this->form_validation->set_rules('username', 'username', 'required|is_unique[user.user_name]');
        $current_url = $this->input->post('current_url');
        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error_message1', 'User Already Exist !!');
            //$this->load->view('register');
            redirect($current_url);
        } else {
            /* $pass = 	$this->input->post('usr_pass');
              $confirm_pass = 	$this->input->post('confirm_pass');
              if($pass == $confirm_pass)
              {
              $password = $this->input->post('usr_pass');
              }else{
              redirect('user_register_submit?message=wrong_password');
              } */
            $this->load->helper('string');
            $activation = random_string('alnum', 10);
            $firstname = $this->input->post('firstname');
            $user_email = $this->input->post('email');
            $code = $this->input->post('code');
            $security_code = $this->input->post('security_code');
            if ($code == $security_code) {
                $data = array(
                    'user_name' => $this->input->post('username'),
                    'firstname' => $firstname,
                    'lastname' => $this->input->post('lastname'),
                    'user_number' => $this->input->post('number'),
                    'user_password' => $this->input->post('usr_pass'),
                    'user_email' => $user_email,
                    'user_role' => $this->input->post('user_role'),
                    'activation' => $activation
                );
                $success = $this->db->insert('user', $data);
                $id = $this->db->insert_id();

                $this->load->library('email');

                $config['protocol'] = 'sendmail';
                $config['mailpath'] = '/usr/sbin/sendmail';
                $config['charset'] = 'iso-8859-1';
                $config['wordwrap'] = TRUE;
                $config['mailtype'] = 'html';

                $this->email->initialize($config);


                $message = "Dear " . $firstname . ", Your account has been created successfully. Please click on this <a href='https://www.bookmytempo.in/confirm/" . $id . "/" . $activation . "'>link</a> to verify your account.";
                $this->email->from('info@bookmytempo.in', 'Bookmytempo');
                $this->email->to($user_email);
                //$this->email->cc('ankii572@gmail.com');
                //$this->email->bcc('them@their-example.com');

                $this->email->subject('Account Created Successfully | Bookmytempo');
                $this->email->message($message);

                $this->email->send();
                $this->session->set_flashdata('message', 'Register has been successfully PLease verify your link from email');
                redirect($current_url);
            } else {
                $this->session->set_flashdata('error_message', ' Captcha Invalid Please try Again');
                redirect($current_url);
            }
        }
    }

    public function confirm($id, $activation) {

        $this->db->select('*');
        $this->db->where('user_id', $id);
        $this->db->where('activation', $activation);
        $query = $this->db->get('user');
        $num = $query->num_rows();
        //echo $num;
        if ($num == 1) {
            $array = array(
                'status' => '1',
                'activation' => '0'
            );

            $this->db->set($array);
            $this->db->where('user_id', $id);
            $this->db->update('user');
            echo "Your account has been activated! Please login now";
            echo '<script>$(document).ready(function() {
    window.setTimeout(function(){window.location.href = "https://www.bookmytempo.in/register"},5000);
});</script>';
        } else {
            echo "Already activated or found some problem";
        }
    }

    public function user_register_provider_submit() {
        $this->load->helper('string');
        $this->form_validation->set_rules('company_name', 'company_name', 'required');
        if ($this->form_validation->run() == false) {
            $this->load->view('register');
        } else {
            $service_id = $this->input->post('service_id');
            $company_name = $this->input->post('company_name');
            $company_contact_person = $this->input->post('company_contact_person');
            $company_register_date = $this->input->post('company_register_date');
            $company_website = $this->input->post('company_website');
            $image = $_FILES['image']['name'];
            $folder = 'assets/images/';
            move_uploaded_file($_FILES['image']['tmp_name'], 'assets/images/' . $image);
            $company_address = $this->input->post('company_address');
            $city_name = $this->input->post('city_name');
            $state_name = $this->input->post('state_name');
            $company_about = $this->input->post('company_about');
            $company_email = $this->input->post('company_email');
            $pass = $this->input->post('usr_pass');
            $confirm_pass = $this->input->post('confirm_pass');
            $activation = random_string('alnum', 10);
            $company_code = $this->input->post('company_code');
            $company_security_code = $this->input->post('company_security_code');
            $user_number = $this->input->post('user_number');
            $slug = url_title($company_name);
            if ($pass == $confirm_pass) {
                $password = $this->input->post('usr_pass');
            } else {
                redirect('paypal/register');
            }
            if ($company_code == $company_security_code) {
                $data = array(
                    'company_name' => $company_name,
                    'company_person' => $company_contact_person,
                    'company_register_date' => $company_register_date,
                    'company_website' => $company_website,
                    'company_address' => $company_address,
                    'city_id' => $city_name,
                    'state_id' => $state_name,
                    'about_company' => $company_about,
                    'user_email' => $company_email,
                    'user_password' => $password,
                    'user_number' => $user_number,
                    'provider_image' => $image,
                    'user_role' => '2',
                    'slug' => $slug,
                    'service_id' => $service_id,
                    'activation' => $activation
                );
            } else {
                redirect('register');
            }

            $success = $this->db->insert('user', $data);
            $id = $this->db->insert_id();

            if ($success) {


                $this->load->library('email');

                $config['protocol'] = 'sendmail';
                $config['mailpath'] = '/usr/sbin/sendmail';
                $config['charset'] = 'iso-8859-1';
                $config['wordwrap'] = TRUE;
                $config['mailtype'] = 'html';

                $this->email->initialize($config);


                $message = "Dear " . $firstname . ", Your account has been created successfully. Please click on this <a href='https://www.bookmytempo.in/confirm/" . $id . "/" . $activation . "'>link</a> to verify your account.";
                $this->email->from('info@bookmytempo.in', 'Bookmytempo');
                $this->email->to($company_email);
                //$this->email->cc('ankii572@gmail.com');
                //$this->email->bcc('them@their-example.com');

                $this->email->subject('Account Created Successfully | Bookmytempo');
                $this->email->message($message);

                $this->email->send();
                $this->session->set_flashdata('message', 'Register has been successfully PLease verify your link from email');
                redirect('register');
            }
        }
    }

    public function get_in_touch() {
        $this->form_validation->set_rules('servicefrom', 'servicefrom', 'required');
        if ($this->form_validation->run() == false) {
            $this->load->view('register');
        } else {
            $current_url = $this->input->post('current_url');
            $servicefrom = $this->input->post('servicefrom');
            $serviceto = $this->input->post('serviceto');
            $servicetype = $this->input->post('servicetype');
            $name = $this->input->post('name');
            $phone = $this->input->post('Phone');
            $email = $this->input->post('Email');
            $Shiftingdate = $this->input->post('Shiftingdate');
            $message = $this->input->post('message');
            $code = $this->input->post('code');
            $secuirity_code = $this->input->post('secuirity_code');
            if ($code == $secuirity_code) {
                $data = array(
                    'service_from' => $servicefrom,
                    'service_to' => $serviceto,
                    'select_services' => $servicetype,
                    'enqery_name' => $name,
                    'enqery_phone' => $phone,
                    'shifting_date' => $Shiftingdate,
                    'enqery_email' => $email);
                $success = $this->db->insert('enquery', $data);
                $last_id = $this->db->insert_id();
                $data['source'] = 'http://www.easytempo.in' . $current_url;
                $this->sendDataToServer($data, $last_id);
            } else {
                redirect();
            }
            if ($success) {
                if ($current_url == '/') {
                    redirect('https://www.bookmytempo.in/thankyou.html');
                } else {
                    redirect($current_url . '/thankyou.html');
                }
            }
        }
    }

    function sendDataToServer($data, $record_id) {
        $sendData = array('name' => $data['enqery_name'],
            'email' => $data['enqery_email'],
            'service_name' => $data['select_services'],
            'location' => $data['service_from'],
            'source' => $data['source'],
            'service_to' => $data['service_to'],
            'phone' => $data['enqery_phone'],
            'date' => $data['shifting_date'], 
            'message' => $data['message'],
            'portal_id' => 3,
            'record_id' => $record_id
        );
        $url = 'https://admin.easymysearch.com/api/services/savelead';
        $handle = curl_init($url);
        curl_setopt($handle, CURLOPT_POST, true);
        curl_setopt($handle, CURLOPT_POSTFIELDS, $sendData);
        curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
        $server_output = curl_exec($handle);
        curl_close($handle);
    }

    public function thankyou() {
        $this->load->view('thankyou');
    }

    public function member($slug_id) {
        $session_data = $this->session->userdata('logged_in');
        $data['user_email'] = $session_data['user_email'];
        $data['user_name'] = $session_data['user_name'];
        $data['user_number'] = $session_data['user_number'];
        $data['user_id'] = $session_data['user_id'];
        $data['city'] = $this->User_model->get_city();
        $data['getblog'] = $this->User_model->getblog();
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['company_info'] = $this->User_model->company_info($slug_id);
        extract($data);
        $city_id = $company_info[0]['city_id'];
        $service_id = $company_info[0]['service_id'];
        $data['getcityserviceReviews'] = $this->User_model->getcityserviceReviews($slug_id);
        $this->load->view('member', $data);
    }

    public function city($city_name) {
        if ($city_name == 'thankyou.html') {
            $this->load->view('thankyou.php');
        } else {
            $this->load->helper('string');
            $this->load->helper('captcha');

            $rand = random_string('numeric', 4);
            $vals = array(
                'word' => $rand,
                'img_path' => './captcha/',
                'img_url' => './captcha/',
                'font_path' => './assets/fonts/times_new_yorker.ttf',
                'img_width' => '165',
                'img_height' => 35,
                'expiration' => 7200,
                'font_size' => 16
            );
            $cap = create_captcha($vals);

            $data['cap'] = $cap;
            $data['google_analytics'] = $this->User_model->google_analytics();
            $data['city'] = $this->User_model->get_city();
            $data['single_city'] = $this->User_model->get_single_city($city_name);
            extract($data);
            $city_id = $single_city[0]['id'];
            $data['get_services'] = $this->User_model->get_services();
            $data['allsettings'] = $this->User_model->allsettings();
            $data['getServices'] = $this->User_model->get_single_services($city_id);
            if ($data['single_city'] != null) {
                $this->load->view('city', $data);
            } else {
                $this->error();
            }
        }
    }

    public function Cityservice($city_name, $service_name, $page = false) {
        $url = $_SERVER['REQUEST_URI'];
        $url_data = explode("/", $url);
        $service_url_find = $url_data[2] . $url_data[3];
        $data['currentURL'] = current_url();
        $data['cityservice'] = 'cityservice';
        if ($url_data[2] == 'thankyou.html' || $url_data[3] == 'thankyou.html') {
            $this->load->view('thankyou.php', $data);
        } else {
            if ($this->User_model->check_data($service_url_find) != null) {
                $data['google_analytics'] = $this->User_model->google_analytics();
                $service_name_find_subcity = explode("-", $service_name);
                $data['check_service_name'] = $service_name_find_subcity;
                if (in_array("in", $service_name_find_subcity)) {
                    $data['city'] = $this->User_model->get_city();
                    $data['single_city'] = $this->User_model->get_single_city($city_name);
                    $data['service_id'] = $this->User_model->get_serivceIdbysubCityslug($service_name);
                    extract($data);
                    $service_id = $service_id[0]['service_id'];
                    $data['city_name'] = $city_name;
                    $data['service_bru_name'] = $service_name;
                    $city_id = $single_city[0]['id'];
                    $data['get_seo_details'] = $this->User_model->get_seo_details_subcity($service_id, $city_id, $service_name);
                    $data['getcompany'] = $this->User_model->getReviews($service_id, $city_id);
                    $data['getblog'] = $this->User_model->getblog();
                    $data['gettestimonial'] = $this->User_model->gettestimonial();
                    $data['getRecordreview'] = $this->User_model->getRecordreview($service_id, $city_id);
                    $data['city_wise_services'] = $this->User_model->city_wise_services($service_id);
                    $data['localty_service'] = $this->User_model->localty_service($service_id, $city_id);
                    $data['get_City_wise_services'] = $this->User_model->get_single_services($city_id);
                    $data['get_services'] = $this->User_model->get_services();
                    $data['allsettings'] = $this->User_model->allsettings();
                    $this->load->view('city-services', $data);
                } else {
                    $data['google_analytics'] = $this->User_model->google_analytics();
                    $data['city'] = $this->User_model->get_city();
                    $data['single_city'] = $this->User_model->get_single_city($city_name);
                    $data['service_id'] = $this->User_model->get_serivceId($service_name);
                    extract($data);
                    $data['city_name'] = $city_name;
                    $data['service_bru_name'] = $service_name;
                    $city_id = $single_city[0]['id'];
//$data['getServices12'] = $this->User_model->get_Cityservices($city_id,$service_name);
                    $service_id = $service_id[0]['id'];
                    $data['getcompany'] = $this->User_model->getReviews($service_id, $city_id);
                    $data['get_seo_details'] = $this->User_model->get_seo_details($service_id, $city_id);
                    $data['getRecordreview'] = $this->User_model->getRecordreview($service_id, $city_id);
                    $data['getblog'] = $this->User_model->getblog();
                    $data['gettestimonial'] = $this->User_model->gettestimonial();
                    $data['city_wise_services'] = $this->User_model->city_wise_services($service_id, $city_id);
                    $data['localty_service'] = $this->User_model->localty_service($service_id, $city_id);
                    $data['get_City_wise_services'] = $this->User_model->get_single_services($city_id);
                    $data['get_services'] = $this->User_model->get_services();
                    $data['allsettings'] = $this->User_model->allsettings();

                    $data['faqListing'] = $this->User_model->faqListing($service_id, $city_id);
                    $this->load->helper('string');
                    $this->load->helper('captcha');

                    $rand = random_string('numeric', 4);
                    $vals = array(
                        'word' => $rand,
                        'img_path' => './captcha/',
                        'img_url' => 'https://www.bookmytempo.in/captcha/',
                        'font_path' => './assets/fonts/times_new_yorker.ttf',
                        'img_width' => '165',
                        'img_height' => 35,
                        'expiration' => 7200,
                        'font_size' => 16
                    );
                    $cap = create_captcha($vals);

                    $data['cap'] = $cap;
                    extract($data);
                    $this->load->view('city-services', $data);
                }
            } else {
                $this->error();
            }
        }
    }

    public function getBlogs() {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $session_data = $this->session->userdata('logged_in');
        $data['user_email'] = $session_data['user_email'];
        $data['user_name'] = $session_data['user_name'];
        $data['user_number'] = $session_data['user_number'];
        $data['user_id'] = $session_data['user_id'];
        $data['city'] = $this->User_model->get_city();
        $data['blogcontentmodel'] = $this->User_model->blogcontentmodel();
        $data['getblog'] = $this->User_model->getblogall();
        $this->load->view('blog', $data);
    }

    public function getSingleBlogs($blog_slug) {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['city'] = $this->User_model->get_city();
        $data['getblog'] = $this->User_model->getblog();
        $data['getsingleblog'] = $this->User_model->getsingleblog($blog_slug);
        if ($data['getsingleblog'] != null) {
            $this->load->view('blog_detail', $data);
        } else {
            $this->error();
        }
    }

    public function Addreviews() {
        $this->form_validation->set_rules('service_id', 'service id', 'required');
        if ($this->form_validation->run() == false) {
            echo 1;
            //$this->load->view('register');
        } else {
            $current_url = $this->input->post('current_url');
            $city_id = $this->input->post('city_id');
            $service_id = $this->input->post('service_id');
            $name = $this->input->post('name');
            $phone = $this->input->post('phone');
            $email = $this->input->post('email');
            $message = $this->input->post('message');
            $rating = $this->input->post('inlineRadioOptions');
            $service_provider_id = $this->input->post('service_provider_id');
            $data = array(
                'service_id' => $service_id,
                'city_id' => $city_id,
                'full_name' => $name,
                'email' => $email,
                'phone' => $phone,
                'review' => $message,
                'rating' => $rating,
                'status' => '0',
                'service_provder_id' => $service_provider_id
            );


            $success = $this->db->insert('review', $data);
            if ($success) {
                $this->session->set_flashdata('success', 'Your Review Pending From Admin');
                redirect($current_url);
            }
        }
    }

    public function contact() {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['city'] = $this->User_model->get_city();
        $data['contactcontentmodel'] = $this->User_model->contactcontentmodel();
        $this->load->view('contact', $data);
    }

    public function contact_submit() {
        $name = $this->input->post('name');
        $phone = $this->input->post('phone');
        $email = $this->input->post('email');
        $message = $this->input->post('message');

        $this->load->library('email');

        $this->load->library('email');
        $config = array(
            'mailtype' => 'html',
            'charset' => 'utf-8',
            'priority' => '1'
        );
        $message = "Name : " . $name . "<br> Phone Number :" . $phone . "<br> Email :" . $email . "<br> Message :" . $message . "";
        $this->email->initialize($config);
        $this->email->from($email, 'Dev');
        $this->email->to('info@bookmytempo.in');
        $this->email->subject('Bookmytempo.in Contact Us');
        $this->email->cc('Devlook99@gmail.com');
        $this->email->message($message);
        $this->email->send();
        $this->session->set_flashdata('message', 'Message has been Sent successfully');
        redirect('contact-us');
    }

    public function about() {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['city'] = $this->User_model->get_city();
        $data['aboutcontentmodel'] = $this->User_model->aboutcontentmodel();
        $this->load->view('about', $data);
    }

    public function privacy() {
        $data['google_analytics'] = $this->User_model->google_analytics();
        $data['city'] = $this->User_model->get_city();
        $data['aboutcontentmodel'] = $this->User_model->privacycontentmodel();
        $this->load->view('privacy', $data);
    }

    public function error() {

        $data['error'] = 'error';
        $this->load->view('error', $data);
    }

    public function getblogalldata() {
        $data['id'] = $_POST['id'];
        $this->load->view('testblog', $data);
    }

}
