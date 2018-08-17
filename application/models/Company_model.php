<?php

/**
 * @author Motilal Soni
 */
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Company_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function get_list($condition = array()) {
        $this->db->select("companies.*");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        $data = $this->db->get("companies");
        return $data;
    }

    public function getById($id) {
        if (is_numeric($id) && $id > 0) {
            $result = $this->db->select("companies.*")
                    ->get_where("companies", array("id" => $id));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function getBySlag($type = "") {
        if ($type != "") {
            $result = $this->db->select("companies.*")
                    ->get_where("companies", array("slug" => $type, "is_active" => 1));
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        return false;
    }

    public function get_company_services($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("services.name")
                    ->where(array('cs.is_delete' => 0, 'cs.companies_id' => $companies_id))
                    ->join('services', 'services.id=cs.services_id', 'LEFT')
                    ->get("companies_service as cs");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_company_services_ids($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("services_id")
                    ->where(array('is_delete' => 0, 'companies_id' => $companies_id))
                    ->get("companies_service");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->services_id;
                }
            }
            return $array;
        }
    }

    public function get_company_cities($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("cities.name")
                    ->where(array('cc.companies_id' => $companies_id))
                    ->join('cities', 'cities.id=cc.cities_id', 'LEFT')
                    ->get("companies_city as cc");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_company_sub_cities($companies_id, $cities_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("sub_cities.name")
                    ->where(array('csc.companies_id' => $companies_id))
                    ->join('sub_cities', 'sub_cities.id=csc.sub_cities_id AND cities_id = ' . $cities_id, 'LEFT')
                    ->get("companies_sub_city as csc");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_company_sub_cities_ids($companies_id, $cities_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("sub_cities_id")
                    ->where(array('companies_id' => $companies_id, 'cities_id' => $cities_id))
                    ->get("companies_sub_city");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->sub_cities_id;
                }
            }
            return $array;
        }
    }

    public function get_company_sub_cities_group($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("sub_cities.name,cities.name as city_name")
                    ->where(array('csc.companies_id' => $companies_id))
                    ->join('sub_cities', 'sub_cities.id=csc.sub_cities_id', 'LEFT')
                    ->join('cities', 'cities.id=csc.cities_id', 'LEFT')
                    ->get("companies_sub_city as csc");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[$row->city_name][] = $row->name;
                }
            }
            return $array;
        }
    }

    public function get_company_cities_ids($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $result = $this->db->select("cities_id")
                    ->where(array('companies_id' => $companies_id))
                    ->get("companies_city");
            $array = array();
            if ($result->num_rows()) {
                foreach ($result->result() as $row) {
                    $array[] = $row->cities_id;
                }
            }
            return $array;
        }
    }

    public function company_options($first_element = false) {
        $sql = $this->db->select('name,id')->where(array('is_active' => 1, 'is_delete' => '0'))->order_by('name', 'ASC')->get('companies');
        if ($sql->num_rows() > 0) {
            $array = array();
            if ($first_element) {
                $array = array('' => 'Select Company');
            }
            foreach ($sql->result() as $row) {
                $array[$row->id] = $row->name;
            }
            return $array;
        } else {
            return false;
        }
    }

    public function get_company_packages($condition) {
        $count_amount = '(SELECT SUM(amount) FROM companies_package_payment WHERE companies_package_payment.companies_package_id=cp.id) as total_paid_amount';
        $result = $this->db->select("cp.*,companies.name as company_name,packages.name as package_name,$count_amount")
                ->where($condition)
                ->join('companies', 'companies.id=cp.companies_id', 'LEFT')
                ->join('packages', 'packages.id=cp.packages_id', 'LEFT')
                ->get("companies_package as cp");
        return $result;
    }

    public function get_company_active_package($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $sql = $this->db->select('id')->where(array('companies_id' => $companies_id, 'total_leads > used_leads' => NULL, 'is_active' => '1'))->get('companies_package');
            if ($sql->num_rows() > 0) {
                return $sql->row()->id;
            } else {
                return FALSE;
            }
        }
    }

    public function get_company_lead_balance($companies_id) {
        if (is_numeric($companies_id) && $companies_id > 0) {
            $sql = $this->db->select('total_leads,used_leads')->where(array('companies_id' => $companies_id, 'total_leads > used_leads' => NULL, 'is_active' => '1'))->get('companies_package');
            if ($sql->num_rows() > 0) {
                $row = $sql->row();
                return ($row->total_leads - $row->used_leads);
            } else {
                return 0;
            }
        }
    }

    public function get_companies_by_city_service($leadDetail) {
        $cities_id = array($leadDetail->cities_id, $leadDetail->destination_cities_id);
        $cities_id = array_unique($cities_id);
        $condition = array('c.is_delete' => '0', 'c.is_active' => '1', 'companies_service.services_id' => $leadDetail->services_id, 'cp.total_leads > cp.used_leads' => NULL, 'cp.is_active' => 1);
        if ($leadDetail->sub_cities_id != "") {
            $condition["(csc.sub_cities_id=$leadDetail->sub_cities_id OR csc.sub_cities_id IS NULL)"] = NULL;
        } else {
            $condition["(csc.sub_cities_id IS NULL)"] = NULL;
        }
        $this->db->select("c.*");
        if (!empty($condition) || $condition != "") {
            $this->db->where($condition);
        }
        $this->db->where_in('companies_city.cities_id', $cities_id);
        $this->db->join('companies_city', 'companies_city.companies_id=c.id', 'INNER');
        $this->db->join('companies_service', 'companies_service.companies_id=c.id', 'INNER');
        $this->db->join('companies_package as cp', 'cp.companies_id=c.id', 'INNER');
        $this->db->join('companies_sub_city csc', 'csc.companies_id=c.id AND csc.cities_id=' . $leadDetail->cities_id, 'LEFT');
        $this->db->group_by('c.id');
        $this->db->having('count(c.id)', count($cities_id));
        $data = $this->db->get("companies as c");
        return $data;
    }

    public function total_lead_sent_today($company_id) {
        $sql = $this->db->select('count(id) as total')->where(['companies_id' => $company_id, 'DATE(created)' => date('Y-m-d')])->group_by('companies_id')->get('leads_sent_history');
        if ($sql->num_rows() > 0) {
            return $sql->row()->total;
        }
        return 0;
    }

    public function duplicate_lead_check($phone, $service_id) {
        $sql = $this->db->select('count(leads.id) as total')->join('leads', 'leads.id=lsh.leads_id', 'LEFT')->where(['leads.phone_number' => $phone, 'services_id' => $service_id, 'DATE(lsh.created)' => date('Y-m-d')])->group_by('leads.phone_number')->get('leads_sent_history as lsh');
        if ($sql->num_rows() > 0) {
            return $sql->row()->total;
        }
        return 0;
    }

    /* list of all companies which have already receive a lead */

    public function leadsent_company_list($lead_id) {
        $sql = $this->db->select('companies_id')->where(['leads_id' => $lead_id])->get('leads_sent_history');
        $companies = [];
        if ($sql->num_rows() > 0) {
            foreach ($sql->result() as $row) {
                $companies[] = $row->companies_id;
            }
        }
        return $companies;
    }

}
