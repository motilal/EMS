<?php
$segment_cntr = $this->uri->segment(1);
$segment_fun = $this->uri->segment(2);

$companyIndex = ($segment_cntr == 'companies' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$companyManagePackage = ($segment_cntr == 'companies' && $segment_fun == 'manage_package') ? 'active' : '';
$groupIndex = ($segment_cntr == 'groups' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

$packageIndex = ($segment_cntr == 'packages' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$packagetypeIndex = ($segment_cntr == 'package_types' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

$servicetypeIndex = ($segment_cntr == 'servicetypes' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$serviceIndex = ($segment_cntr == 'services' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

$cityIndex = ($segment_cntr == 'cities' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$subcityIndex = ($segment_cntr == 'sub_cities' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

$contactIndex = ($segment_cntr == 'contacts' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$contactGroupsIndex = ($segment_cntr == 'contact_groups' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$BulkSmsIndex = ($segment_cntr == 'bulk_sms' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

$portalIndex = ($segment_cntr == 'portals' || $segment_cntr == 'leads') ? 'active' : '';
$reasonIndex = ($segment_cntr == 'reasons' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

$settingIndex = ($segment_cntr == 'settings' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$settingProfile = ($segment_cntr == 'settings' && $segment_fun == 'profile') ? 'active' : '';
$logIndex = ($segment_cntr == 'logs') ? 'active' : '';
$dbIndex = ($segment_cntr == 'database_backups') ? 'active' : '';
$user_permissions = $this->session->userdata('_subadmin_module_permissions');
?>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<?php echo gravatar_url($_UserAuth->email); ?>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info"> 
                <p><?php echo $_UserAuth->first_name . ' ' . $_UserAuth->last_name ?></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div> 
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li class="<?php echo $segment_cntr == 'dashboard' ? 'active' : ''; ?>">
                <a href="<?php echo site_url('dashboard'); ?>">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span> 
                </a>
            </li> 

            <?php if (is_allow_admin(FALSE)) { ?>
                <li class="<?php echo $segment_cntr == 'subadmins' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('subadmins'); ?>">
                        <i class="fa fa-user-secret"></i> <span>SubAdmin Manager</span> 
                    </a>
                </li>
            <?php } ?>



            <?php if (is_allow_module('company') || is_allow_module('group')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('companies', 'groups')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-building"></i>
                        <span>Company Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('companies', 'groups')) ? 'block' : 'none'; ?>;">
                        <?php if (is_allow_action('company-index')) { ?>
                            <li class="<?php echo $companyIndex; ?>"><a href="<?php echo site_url('companies'); ?>"><i class="fa fa-th-list"></i> Manage Company</a></li>
                        <?php } ?>
                        <?php if (is_allow_action('company-package-manage')) { ?>
                            <li class="<?php echo $companyManagePackage; ?>"><a href="<?php echo site_url('companies/manage_package'); ?>"><i class="fa fa-shopping-cart"></i> Company Package</a></li> 
                        <?php } ?>
                        <?php if (is_allow_action('group-index')) { ?>
                            <li class="<?php echo $groupIndex; ?>"><a href="<?php echo site_url('groups'); ?>"><i class="fa fa-users"></i> Manage Company Group</a></li>
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?> 

            <?php if (is_allow_module('package') || is_allow_module('package_type')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('packages', 'package_types')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-shopping-cart"></i>
                        <span>Package Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('packages', 'package_types')) ? 'block' : 'none'; ?>;">
                        <?php if (is_allow_action('package-index')) { ?>
                            <li class="<?php echo $packageIndex; ?>"><a href="<?php echo site_url('packages'); ?>"><i class="fa fa-th-list"></i> Manage Package</a></li>
                        <?php } ?>
                        <?php if (is_allow_action('package_type-index')) { ?>
                            <li class="<?php echo $packagetypeIndex; ?>"><a href="<?php echo site_url('package_types'); ?>"><i class="fa fa-th-large"></i> Package Type</a></li> 
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>

            <?php if (is_allow_module('service') || is_allow_module('servicetype')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('servicetypes', 'services')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-cogs"></i>
                        <span>Service Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('servicetypes', 'services')) ? 'block' : 'none'; ?>;">
                        <?php if (is_allow_action('servicetype-index')) { ?>
                            <li class="<?php echo $servicetypeIndex; ?>"><a href="<?php echo site_url('servicetypes'); ?>"><i class="fa fa-th-list"></i> Manage Services Type</a></li>
                        <?php } ?>                    
                        <?php if (is_allow_action('service-index')) { ?>
                            <li class="<?php echo $serviceIndex; ?>"><a href="<?php echo site_url('services'); ?>"><i class="fa fa-th-large"></i> Manage Services</a></li> 
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>    

            <?php if (is_allow_module('city') || is_allow_module('sub city')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('cities', 'sub_cities')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-institution"></i>
                        <span>City Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('cities', 'sub_cities')) ? 'block' : 'none'; ?>;">
                        <?php if (is_allow_action('city-index')) { ?>
                            <li class="<?php echo $cityIndex; ?>"><a href="<?php echo site_url('cities'); ?>"><i class="fa fa-th-list"></i> Manage City</a></li>
                        <?php } ?>                    
                        <?php if (is_allow_action('sub_city-index')) { ?>
                            <li class="<?php echo $subcityIndex; ?>"><a href="<?php echo site_url('sub_cities'); ?>"><i class="fa fa-map-o"></i> Manage Sub City</a></li> 
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?> 


            <?php if (is_allow_module('lead') || is_allow_module('portal') || is_allow_module('reason')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('leads', 'portals', 'reasons')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-envelope"></i>
                        <span>Lead Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('leads', 'portals', 'reasons')) ? 'block' : 'none'; ?>;">
                        <?php if (is_allow_action('portal-index')) { ?>
                            <li class="<?php echo $portalIndex; ?>"><a href="<?php echo site_url('portals'); ?>"><i class="fa fa-th-list"></i> Manage Leads</a></li>
                        <?php } ?>                    
                        <?php if (is_allow_action('reasons-index')) { ?>
                            <li class="<?php echo $reasonIndex; ?>"><a href="<?php echo site_url('reasons'); ?>"><i class="fa fa-comment"></i> Lead Return Reasons</a></li> 
                        <?php } ?>
                    </ul>
                </li>
            <?php } ?>


            <?php if (is_allow_module('follow up')) { ?>    
                <li class="<?php echo $segment_cntr == 'follow_up' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('follow_up'); ?>">
                        <i class="fa fa-user"></i> <span>Follow Up</span> 
                    </a>
                </li>
            <?php } ?>

            <?php if (is_allow_module('email templates')) { ?>    
                <li class="<?php echo $segment_cntr == 'email_templates' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('email_templates'); ?>">
                        <i class="fa fa-envelope-o"></i> <span>Email Templates</span> 
                    </a>
                </li>
            <?php } ?>

            <?php if (is_allow_module('contact') || is_allow_module('contact group') || is_allow_module('bulk sms')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('contacts', 'contact_groups', 'bulk_sms')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-fax"></i>
                        <span>Bulk SMS Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('contacts', 'contact_groups', 'bulk_sms')) ? 'block' : 'none'; ?>;">
                        <?php if (is_allow_action('bulk_sms-index')) { ?>
                            <li class="<?php echo $BulkSmsIndex; ?>"><a href="<?php echo site_url('bulk_sms'); ?>"><i class="fa fa-envelope-o"></i> Bulk SMS History</a></li> 
                        <?php } ?>
                        <?php if (is_allow_action('contact_group-index')) { ?>
                            <li class="<?php echo $contactGroupsIndex; ?>"><a href="<?php echo site_url('contact_groups'); ?>"><i class="fa fa-users"></i> Manage Group</a></li> 
                        <?php } ?>
                        <?php if (is_allow_action('contact-index')) { ?>
                            <li class="<?php echo $contactIndex; ?>"><a href="<?php echo site_url('contacts'); ?>"><i class="fa fa-phone"></i> Manage Contact</a></li>
                        <?php } ?>   
                    </ul>
                </li>
            <?php } ?>
            <?php /* if (is_allow_module('sms')) { ?>    
              <li class="<?php echo $segment_cntr == 'sms' ? 'active' : ''; ?>">
              <a href="<?php echo site_url('sms'); ?>">
              <i class="fa fa-fax"></i> <span>SMS Manager</span>
              </a>
              </li>
              <?php } */ ?> 


            <li class="treeview <?php echo in_array($segment_cntr, array('settings', 'logs')) ? 'active menu-open' : ''; ?>">
                <a href="#">
                    <i class="fa fa-gear"></i>
                    <span>Setting</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('settings', 'visitors', 'flash_messages', 'logs', 'database_backups')) ? 'block' : 'none'; ?>;"> 
                    <li class="<?php echo $settingProfile; ?>"><a href="<?php echo site_url('settings/profile'); ?>"><i class="fa fa-user-plus"></i> Manage Profile</a></li>
                    <?php if (is_allow_action('settings-index')) { ?>
                        <li class="<?php echo $settingIndex; ?>">
                            <a href="<?php echo site_url('settings/index'); ?>"><i class="fa fa-gear"></i> Site Settings</a>
                        </li> 
                    <?php } ?> 

                    <?php if (is_allow_admin(FALSE)) { ?> 
                        <li class="<?php echo $logIndex; ?>">
                            <a href="<?php echo site_url('logs'); ?>"><i class="fa fa-bug"></i> System Error Log</a>
                        </li>  

                        <li class="<?php echo $dbIndex; ?>">
                            <a href="<?php echo site_url('database_backups'); ?>"><i class="fa fa-database"></i> Database Backup</a>
                        </li> 
                    <?php } ?>

                </ul>
            </li>



        </ul>
    </section>
    <!-- /.sidebar -->
</aside>