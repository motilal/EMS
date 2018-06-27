<div class="nav-tabs-custom">

    <ul class="nav nav-tabs">
        <li><a href="<?php echo site_url('leads/index/inbox/' . $portal_id); ?>">Lead Inbox</a></li>
        <li><a href="<?php echo site_url('leads/index/sent/' . $portal_id); ?>">Lead Sent</a></li>
        <li><a href="<?php echo site_url('leads/index/pending/' . $portal_id); ?>">Lead Remaining</a></li>
        <li class=""><a href="<?php echo site_url('leads/leads_sent_history/' . $portal_id); ?>">Lead Sent History</a></li>
        <li class="active"><a href="<?php echo site_url('leads/leads_return_history/' . $portal_id); ?>">Lead Return History</a></li>
        <li class="pull-right"> 
            <?php if (is_allow_action('lead-return-add')) { ?>
                <div style="width: 100%;">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <a href="<?php echo site_url('leads/add_lead_return_request'); ?>" class="btn btn-primary btn-sm add_new_tab_item"><i class="fa fa-plus"></i> Add Lead Return Request</a>
                    </div>
                </div> 
            <?php } ?>
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active">  
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr> 
                            <td>Sr.</td>
                            <th>Company Name</th>
                            <th>User Name</th>
                            <th>User Phone</th>
                            <th>Reason</th>
                            <th>Return On</th>
                            <th>Approve By</th>
                            <th>Status</th> 
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
            <!-- /.box-body --> 
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
</div> 

<script>
    var current_url = '<?php echo current_url(); ?>';
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging 
     */
    var datatbl = dynamic_datatable_init(current_url, [0], [], DEFAULT_PAGING);
    $(document).on('click', 'a.approve-return-lead', function (e) {
        if (confirm('Are you sure to wants to approve this lead for return ?')) {
            return;
        }
        e.preventDefault();
    });
</script>