<div class="nav-tabs-custom">
    <ul class="nav nav-tabs">
        <li class="<?php echo $type == '' || $type == 'inbox' ? 'active' : ''; ?>"><a href="<?php echo site_url('admin/leads/index/inbox/' . $portal_id); ?>">Lead Inbox</a></li>
        <li class="<?php echo $type == 'sent' ? 'active' : ''; ?>"><a href="<?php echo site_url('admin/leads/index/sent/' . $portal_id); ?>">Lead Sent</a></li>
        <li class="<?php echo $type == 'pending' ? 'active' : ''; ?>"><a href="<?php echo site_url('admin/leads/index/pending/' . $portal_id); ?>">Lead Remaining</a></li>
        <li class=""><a href="<?php echo site_url('admin/leads/leads_sent_history/' . $portal_id); ?>">Lead Sent History</a></li>
        <li class=""><a href="<?php echo site_url('admin/leads/leads_return_history/' . $portal_id); ?>">Lead Return History</a></li>
        <?php if ($type == 'inbox') { ?>
            <li class="pull-right"> 
                <?php if (is_allow_action('add-lead')) { ?>
                    <div style="width: 100%;">
                        <div class="btn-group" data-toggle="btn-toggle">
                            <a href="#<?php //echo site_url('admin/leads/add_lead_return_request'); ?>" class="btn btn-primary btn-sm add_new_tab_item"><i class="fa fa-plus"></i> Add New Lead</a>
                        </div>
                    </div> 
                <?php } ?> 
            </li>
        <?php } else if ($type == 'pending') { ?>
            <li class="pull-right"> 
                <?php if (is_allow_action('send-lead')) { ?>
                    <div style="width: 100%;">
                        <div class="btn-group" data-toggle="btn-toggle">
                            <a href="#<?php //echo site_url('admin/leads/add_lead_return_request'); ?>" class="btn btn-primary btn-sm add_new_tab_item"><i class="fa fa-plus"></i> Send Lead Manual</a>
                        </div>
                    </div> 
                <?php } ?> 
            </li>
        <?php } ?> 
    </ul>
    <div class="tab-content">
        <div class="tab-pane active"> 
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr> 
                            <td>Sr.</td>
                            <th>Portal</th>
                            <th>Ref Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                            <th>Sent Status</th>
                            <th>Approve Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (isset($result) && $result != "") { ?>
                            <?php foreach ($result as $key => $row): ?>
                                <tr>
                                    <td><?php echo $row[0]; ?></td>
                                    <td><?php echo $row[1]; ?></td>
                                    <td><?php echo $row[2]; ?></td>
                                    <td><?php echo $row[3]; ?></td>
                                    <td><?php echo $row[4]; ?></td> 
                                    <td><?php echo $row[5]; ?></td>
                                    <td><?php echo $row[6]; ?></td>
                                    <td><?php echo $row[7]; ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php } ?>
                    </tbody> 
                </table>  
            </div>

        </div>
    </div>
</div>
<script>
    var current_url = '<?php echo current_url(); ?>';
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging 
     */
    var datatbl = dynamic_datatable_init(current_url, [0, 8], [], DEFAULT_PAGING);
</script>