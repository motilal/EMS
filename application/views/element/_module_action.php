<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>   
<div class="action-link">
    <?php if (isset($editUrl)) { ?> 
        <a href="<?php echo site_url($editUrl); ?>"  data-id="<?php echo $id; ?>" class="btn btn-block btn-warning btn-xs edit-row<?php echo (isset($editPermissionKey) && is_allow_action($editPermissionKey) === FALSE) ? ' disabled' : ''; ?>" data-toggle="tooltip" title="" data-original-title="Edit"> <span class="fa fa-edit"></span> </a>
    <?php } ?>
    <?php if (isset($permissionUrl)) { ?>
        <a href="<?php echo site_url($permissionUrl); ?>" data-id="<?php echo $id; ?>" class="btn btn-block btn-primary btn-xs"  data-toggle="tooltip" title="" data-original-title="Manage Permissions"> <span class="fa fa-key"></span> </a>
    <?php } ?>
    <?php if (isset($deleteUrl)) { ?>
        <a href="<?php echo site_url($deleteUrl); ?>" data-id="<?php echo $id; ?>" class="btn btn-block btn-danger btn-xs delete-row<?php echo (isset($deletePermissionKey) && is_allow_action($deletePermissionKey) === FALSE) ? ' disabled' : ''; ?>"  data-toggle="tooltip" title="" data-original-title="Delete"> <span class="fa fa-trash-o"></span> </a>
    <?php } ?>
    <?php if (isset($viewUrl)) { ?>
        <a href="<?php echo site_url($viewUrl); ?>" data-id="<?php echo $id; ?>" class="btn btn-block btn-primary btn-xs view-row"  data-toggle="tooltip" title="" data-original-title="View"> <span class="fa fa-eye"></span> </a>
    <?php } ?> 
    <?php if (isset($downloadUrl)) { ?>
        <a href="<?php echo site_url($downloadUrl); ?>" class="btn btn-block btn-primary btn-xs"  data-toggle="tooltip" title="" data-original-title="Download"> <span class="fa fa-download"></span> </a>
    <?php } ?>
    <?php if (isset($addPackageUrl)) { ?>
        <a href="<?php echo site_url($addPackageUrl); ?>" class="btn btn-block btn-warning btn-xs<?php echo (is_allow_action('manage-company-package') === FALSE) ? ' disabled' : ''; ?>" data-toggle="tooltip" title="" data-original-title="Manage Package"> <span class="fa fa-shopping-cart"></span> </a>
    <?php } ?>
    <?php if (!empty($sendLeadUrl) && is_allow_action('send-lead') === TRUE) { ?>
        <a href="#" data-action="<?php echo site_url($sendLeadUrl); ?>" class="btn btn-block bg-aqua btn-xs send-lead" href="#" data-toggle="modal" data-target="#modal-send-lead" title="Send Lead"> <span class="fa fa-send"></span> </a>
    <?php } ?>

</div> 