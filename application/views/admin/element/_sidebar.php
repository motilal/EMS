<?php
$segment_cntr = $this->uri->segment(2);
$segment_fun = $this->uri->segment(3);

$companyIndex = ($segment_cntr == 'companies' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$companyManagePackage = ($segment_cntr == 'companies' && $segment_fun == 'manage_package') ? 'active' : '';

$packageIndex = ($segment_cntr == 'packages' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';
$packagetypeIndex = ($segment_cntr == 'package_types' && ($segment_fun == 'index' || $segment_fun == '')) ? 'active' : '';

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
                <a href="<?php echo site_url('admin/dashboard'); ?>">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span> 
                </a>
            </li> 

            <?php if (is_allow_admin(FALSE)) { ?>
                <li class="<?php echo $segment_cntr == 'subadmins' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/subadmins'); ?>">
                        <i class="fa fa-user-secret"></i> <span>SubAdmin Manager</span> 
                    </a>
                </li>
            <?php } ?>



            <?php if (is_allow_module('company')) { ?>  
                <li class="treeview <?php echo $segment_cntr == 'companies' ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-building"></i>
                        <span>Company Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo $segment_cntr == 'companies' ? 'block' : 'none'; ?>;">
                        <li class="<?php echo $companyIndex; ?>"><a href="<?php echo site_url('admin/companies'); ?>"><i class="fa fa-th-list"></i> Manage Company</a></li>
                        <li class="<?php echo $companyManagePackage; ?>"><a href="<?php echo site_url('admin/companies/manage_package'); ?>"><i class="fa fa-shopping-cart"></i> Company Package</a></li> 
                    </ul>
                </li>
            <?php } ?>

            <?php if (is_allow_module('group')) { ?>    
                <li class="<?php echo $segment_cntr == 'groups' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/groups'); ?>">
                        <i class="fa fa-users"></i> <span>Group</span> 
                    </a>
                </li>
            <?php } ?>  

            <?php if (is_allow_module('package') || is_allow_module('package_type')) { ?>  
                <li class="treeview <?php echo in_array($segment_cntr, array('packages', 'package_types')) ? 'active menu-open' : ''; ?>">
                    <a href="#">
                        <i class="fa fa-building"></i>
                        <span>Package Manager</span>
                        <span class="pull-right-container">
                            <i class="fa fa-angle-left pull-right"></i>
                        </span>
                    </a>
                    <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('packages', 'package_types')) ? 'block' : 'none'; ?>;">
                        <li class="<?php echo $packageIndex; ?>"><a href="<?php echo site_url('admin/packages'); ?>"><i class="fa fa-shopping-cart"></i> Manage Package</a></li>
                        <li class="<?php echo $packagetypeIndex; ?>"><a href="<?php echo site_url('admin/package_types'); ?>"><i class="fa fa-th-large"></i> Package Type</a></li> 
                    </ul>
                </li>
            <?php } ?>

            <?php if (is_allow_module('service')) { ?>    
                <li class="<?php echo $segment_cntr == 'servicetypes' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/servicetypes'); ?>">
                        <i class="fa fa-cogs"></i> <span>Services</span> 
                    </a>
                </li>
            <?php } ?>

            <?php if (is_allow_module('sub service')) { ?>    
                <li class="<?php echo $segment_cntr == 'services' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/services'); ?>">
                        <i class="fa fa-th-large"></i> <span>Sub Services</span> 
                    </a>
                </li>
            <?php } ?>

            <?php if (is_allow_module('city')) { ?>    
                <li class="<?php echo $segment_cntr == 'cities' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/cities'); ?>">
                        <i class="fa fa-institution"></i> <span>City</span> 
                    </a>
                </li>
            <?php } ?>

            <?php if (is_allow_module('follow up')) { ?>    
                <li class="<?php echo $segment_cntr == 'follow_up' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/follow_up'); ?>">
                        <i class="fa fa-user"></i> <span>Follow Up</span> 
                    </a>
                </li>
            <?php } ?>

            <?php if (is_allow_module('lead') && is_allow_module('portal')) { ?>    
                <li class="<?php echo in_array($segment_cntr, array('leads', 'portals')) ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/portals'); ?>">
                        <i class="fa fa-inbox"></i> <span>Manage Leads</span> 
                    </a>
                </li>
            <?php } ?> 

            <?php if (is_allow_module('email templates')) { ?>    
                <li class="<?php echo $segment_cntr == 'email_templates' ? 'active' : ''; ?>">
                    <a href="<?php echo site_url('admin/email_templates'); ?>">
                        <i class="fa fa-envelope-o"></i> <span>Email Templates</span> 
                    </a>
                </li>
            <?php } ?>


            <li class="treeview <?php echo in_array($segment_cntr, array('settings', 'logs')) ? 'active menu-open' : ''; ?>">
                <a href="#">
                    <i class="fa fa-gear"></i>
                    <span>Setting</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu" style="display:<?php echo in_array($segment_cntr, array('settings', 'visitors', 'flash_messages', 'logs', 'database_backups')) ? 'block' : 'none'; ?>;"> 
                    <li class="<?php echo $settingProfile; ?>"><a href="<?php echo site_url('admin/settings/profile'); ?>"><i class="fa fa-user-plus"></i> Manage Profile</a></li>
                    <?php if (is_allow_action('settings-index')) { ?>
                        <li class="<?php echo $settingIndex; ?>">
                            <a href="<?php echo site_url('admin/settings/index'); ?>"><i class="fa fa-gear"></i> Site Settings</a>
                        </li> 
                    <?php } ?> 

                    <?php if (is_allow_admin(FALSE)) { ?> 
                        <li class="<?php echo $logIndex; ?>">
                            <a href="<?php echo site_url('admin/logs'); ?>"><i class="fa fa-bug"></i> System Error Log</a>
                        </li>  

                        <li class="<?php echo $dbIndex; ?>">
                            <a href="<?php echo site_url('admin/database_backups'); ?>"><i class="fa fa-database"></i> Database Backup</a>
                        </li> 
                    <?php } ?>

                </ul>
            </li>



        </ul>
    </section>
    <!-- /.sidebar -->
</aside>