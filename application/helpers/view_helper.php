<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

if (!function_exists("sanitize_output")) {

    /**
     *
     * @param type $buffer
     * @return type 
     */
    function sanitize_output($buffer) {

        $search = array(
            '/\>[^\S ]+/s', // strip whitespaces after tags, except space
            '/[^\S ]+\</s', // strip whitespaces before tags, except space
            '/(\s)+/s'       // shorten multiple whitespace sequences
        );

        $replace = array(
            '>',
            '<',
            '\\1'
        );
        //$buffer = preg_replace($search, $replace, $buffer);

        return $buffer;
    }

}

if (!function_exists('sort_attribute')) {

    function sort_attribute($fieldname = null) {
        $CI = & get_instance();
        if (!empty($fieldname)) {
            $sort = 'asc';
            $sort_class = 'sorting';
            if ($CI->input->get('sort') == 'asc' && $CI->input->get('order_by') == $fieldname) {
                $sort = 'desc';
                $sort_class = 'sorting_asc';
            } else if ($CI->input->get('sort') == 'desc' && $CI->input->get('order_by') == $fieldname) {
                $sort = 'asc';
                $sort_class = 'sorting_desc';
            }
            return (object) array('sort' => $sort, 'sort_class' => $sort_class);
        }
    }

}

if (!function_exists('sorting_url')) {

    function sorting_url($fieldname = null) {
        $CI = & get_instance();
        if (!empty($fieldname)) {
            $sort_attr = sort_attribute($fieldname);
            $getdata = $CI->input->get();
            unset($getdata['sort']);
            unset($getdata['order_by']);
            $query_string = http_build_query($getdata);
            $ext_url = "";
            if (!empty($query_string)) {
                $ext_url = '&' . $query_string;
            }
            $url = current_url() . "?sort={$sort_attr->sort}&order_by={$fieldname}{$ext_url}";

            return (object) array('url' => $url, 'class' => $sort_attr->sort_class);
        }
    }

}
if (!function_exists('dataTableGetRequest')) {

    function dataTableGetRequest($getData, $colomn) {
        $order = array();
        $limit = array();
        $search = '';
        if (!empty($getData['order'][0]['column']) && !empty($getData['order'][0]['dir'])) {
            $colomnIndex = $getData['order'][0]['column'];
            if (isset($colomn[$colomnIndex])) {
                $order = array($colomn[$colomnIndex], $getData['order'][0]['dir']);
            }
        }
        if (isset($getData['start']) && !empty($getData['length'])) {
            $limit = array('start' => $getData['start'], 'limit' => $getData['length']);
        }
        if (!empty($getData['search']['value'])) {
            $search = $getData['search']['value'];
        }
        return (object) array('order' => $order, 'limit' => $limit, 'search' => $search);
    }

}

if (!function_exists('getPageSerial')) {

    function getPageSerial($perpage, $start, $key) {
        $page = 0;
        if ($start > 0) {
            $page = ($start / $perpage);
        }
        return ($page * $perpage) + ($key + 1);
    }

}

/* set blank value to NULL */
if (!function_exists('filterPostData')) {

    function filterPostData($data = array()) {
        if (!empty($data)) {
            foreach ($data as $key => $value) {
                if (empty($value) && $value == "") {
                    $data[$key] = NULL;
                }
            }
        }
        return $data;
    }

}


if (!function_exists('getNewsImage')) {

    function getNewsImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = NEWS_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = NEWS_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = NEWS_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}
if (!function_exists('getCurrentAffairsQuizImage')) {

    function getCurrentAffairsQuizImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = CURRENT_AFFAIRS_QUIZ_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = CURRENT_AFFAIRS_QUIZ_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = CURRENT_AFFAIRS_QUIZ_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}

if (!function_exists('getFormAlertImage')) {

    function getFormAlertImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = FORM_ALERT_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = FORM_ALERT_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = FORM_ALERT_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}

if (!function_exists('getDiscussionImage')) {

    function getDiscussionImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = DISCUSSION_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = DISCUSSION_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = DISCUSSION_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}

if (!function_exists('getSubjectImage')) {

    function getSubjectImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = SUBJECT_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = SUBJECT_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = SUBJECT_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}

if (!function_exists('getCourseImage')) {

    function getCourseImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = COURSE_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = COURSE_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = COURSE_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}

if (!function_exists('getSubCourseImage')) {

    function getSubCourseImage($img, $size, $master_dim = 'auto') {
        $CI = & get_instance();
        $folderPath = $master_dim . '_' . $size['width'] . 'x' . $size['height'];
        $SourceImgPath = SUB_COURSE_IMG_PATH . $img;
        if (!file_exists($SourceImgPath)) {
            return FALSE;
        }
        $NewImgPath = SUB_COURSE_IMG_PATH . $folderPath;
        if (!is_dir($NewImgPath)) {
            mkdir($NewImgPath, DIR_WRITE_MODE, TRUE);
        }
        $NewImgPath = SUB_COURSE_IMG_PATH . $folderPath . '/' . $img;
        if (file_exists($NewImgPath)) {
            return base_url($NewImgPath);
        } else {
            $config = array();
            $config['image_library'] = 'gd2';
            $config['source_image'] = $SourceImgPath;
            $config['new_image'] = $NewImgPath;
            $config['create_thumb'] = FALSE;
            $config['maintain_ratio'] = TRUE;
            $config['width'] = $size['width'];
            $config['height'] = $size['height'];
            $CI->load->library('image_lib');
            $CI->image_lib->initialize($config);
            if ($CI->image_lib->resize()) {
                $CI->image_lib->clear();
                return base_url($NewImgPath);
            }
        }
    }

}