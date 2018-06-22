<?php

defined('BASEPATH') OR exit('No direct script access allowed');

$config = array(
    'companies/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Company Name',
            'rules' => "trim|required|max_length[255]|callback__is_unique_company_name"
        ),
        array(
            'field' => 'phone1',
            'label' => 'Phone Number',
            'rules' => "trim|required|max_length[20]|callback__is_unique_company_phone"
        ),
        array(
            'field' => 'servicetypes_id',
            'label' => 'Service',
            'rules' => "trim|required"
        )
    ),
    'groups/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Group Name',
            'rules' => "trim|required|max_length[255]"
        )
    ),
    'packages/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Package Name',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'duration',
            'label' => 'Package Duration',
            'rules' => "trim|required|numeric|max_length[11]"
        ),
        array(
            'field' => 'amount',
            'label' => 'Package Amount',
            'rules' => "trim|required|numeric|max_length[11]"
        ),
        array(
            'field' => 'no_of_leads',
            'label' => 'Number of leads',
            'rules' => "trim|required|numeric|max_length[11]"
        )
    ),
    'follow_up/manage' => array(
        array(
            'field' => 'member_name',
            'label' => 'Member Name',
            'rules' => "trim|required|max_length[255]"
        )
    ),
    'servicetypes/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Service Name',
            'rules' => "trim|required|max_length[255]"
        )
    ),
    'services/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => "trim|required|max_length[255]"
        )
    ),
    'cities/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => "trim|required|max_length[255]|callback__is_unique_city_name"
        )
    ),
    'package_types/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => "trim|required|max_length[255]|callback__is_unique_package_type_name"
        )
    ),
    'portals/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => "trim|required|max_length[255]"
        )
    ),
    'leads/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'portals_id',
            'label' => 'Portal',
            'rules' => "trim|required"
        )
    ),
    'manage_package' => array(
        array(
            'field' => 'package',
            'label' => 'Package',
            'rules' => "trim|required|callback__validate_package"
        ),
        array(
            'field' => 'company',
            'label' => 'Company',
            'rules' => "trim|required"
        )
    ),
    'add_lead_return_request' => array(
        array(
            'field' => 'reason',
            'label' => 'Reason',
            'rules' => "trim|required"
        ),
        array(
            'field' => 'id',
            'label' => 'leads sent history id',
            'rules' => "trim|required"
        )
    ),
    'email_templates/manage' => array(
        array(
            'field' => 'title',
            'label' => 'Title',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'subject',
            'label' => 'Subject',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'variable',
            'label' => 'Variable',
            'rules' => 'trim|required'
        ),
        array(
            'field' => 'body',
            'label' => 'Body',
            'rules' => 'trim|required'
        )
    ),
    'add_subadmins' => array(
        array(
            'field' => 'first_name',
            'label' => 'First Name',
            'rules' => "trim|required|max_length[50]"
        ),
        array(
            'field' => 'last_name',
            'label' => 'Last Name',
            'rules' => "trim|max_length[50]"
        ),
        array(
            'field' => 'email',
            'label' => 'Email',
            'rules' => "trim|required|valid_email|max_length[254]|callback__validate_email"
        ),
        array(
            'field' => 'phone',
            'label' => 'Phone',
            'rules' => "trim|max_length[20]"
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'cpassword',
            'label' => 'Confrim Password',
            'rules' => "trim|matches[password]"
        )
    ),
    'edit_subadmins' => array(
        array(
            'field' => 'first_name',
            'label' => 'First Name',
            'rules' => "trim|required|max_length[50]"
        ),
        array(
            'field' => 'last_name',
            'label' => 'Last Name',
            'rules' => "trim|max_length[50]"
        ),
        array(
            'field' => 'phone',
            'label' => 'Phone',
            'rules' => "trim|max_length[20]"
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => "trim|max_length[255]"
        ),
        array(
            'field' => 'cpassword',
            'label' => 'Confrim Password',
            'rules' => "trim|matches[password]"
        )
    ),
    'permissions/manage' => array(
        array(
            'field' => 'name',
            'label' => 'Name',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'key',
            'label' => 'Key',
            'rules' => "trim|required|max_length[255]|callback__validate_permission_key"
        ),
        array(
            'field' => 'group',
            'label' => 'group',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'order',
            'label' => 'Order',
            'rules' => "trim|max_length[11]"
        )
    ),
    'flash_messages/manage' => array(
        array(
            'field' => 'value',
            'label' => 'Message',
            'rules' => "trim|required|max_length[1500]"
        ),
        array(
            'field' => 'key',
            'label' => 'Key',
            'rules' => "trim|required|max_length[255]|callback__validate_flash_message_key"
        ),
        array(
            'field' => 'group',
            'label' => 'group',
            'rules' => "trim|required|max_length[255]"
        ),
        array(
            'field' => 'order',
            'label' => 'Order',
            'rules' => "trim|max_length[11]"
        )
    ),
    'change_admin_password' => array(
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => 'trim|required|callback__validate_password'
        ),
        array(
            'field' => 'new_password',
            'label' => 'New Password',
            'rules' => 'trim|required|min_length[6]|max_length[40]'
        ),
        array(
            'field' => 'confirm_password',
            'label' => 'Confirm Password',
            'rules' => 'trim|required|min_length[6]|max_length[40]|matches[new_password]'
        )
    ),
    'change_admin_profile' => array(
        array(
            'field' => 'first_name',
            'label' => 'First Name',
            'rules' => "trim|required|max_length[50]"
        ),
        array(
            'field' => 'last_name',
            'label' => 'Last Name',
            'rules' => "trim|max_length[50]"
        ),
        array(
            'field' => 'phone',
            'label' => 'Phone',
            'rules' => "trim|max_length[20]"
        ),
        array(
            'field' => 'password',
            'label' => 'Password',
            'rules' => "trim|max_length[255]"
        ),
        array(
            'field' => 'cpassword',
            'label' => 'Confrim Password',
            'rules' => "trim|matches[password]"
        )
    ),
    'update_profile' => array(
        array(
            'field' => 'first_name',
            'label' => 'First Name',
            'rules' => "trim|required|max_length[50]"
        ),
        array(
            'field' => 'last_name',
            'label' => 'Last Name',
            'rules' => "trim|max_length[50]"
        ),
        array(
            'field' => 'phone',
            'label' => 'Phone',
            'rules' => "trim|max_length[20]"
        )
    )
);
$config['error_prefix'] = '<div class="help-block">';
$config['error_suffix'] = '</div>';
