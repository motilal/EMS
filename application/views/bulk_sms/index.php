<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-envelope-o"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('bulk-sms-send')) { ?>
                            <a href="<?php echo site_url('bulk_sms/send_sms_to_group'); ?>" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-envelope-o"></i> Send SMS to group </a>
                        <?php } ?> 
                        <a href="<?php echo site_url('bulk_sms?download=report'); ?>" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</a>
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body"> 
                <div class="table-responsive">
                    <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr>
                                <td>Sr.</td> 
                                <th>Group</th> 
                                <th>Message</th> 
                                <th>Batch Id</th> 
                                <th>SentOn</th> 
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($result->num_rows() > 0) { ?>
                                <?php foreach ($result->result() as $key => $row): ?> 
                                    <tr id="row_<?php echo $row->id; ?>">
                                        <td><?php echo $key + 1; ?></td> 
                                        <td><?php echo $row->group_name; ?></td> 
                                        <td><?php echo str_replace('%n', '<br>', $row->message); ?></td> 
                                        <td><?php echo $row->batch_id; ?></td> 
                                        <td><?php echo date(DATETIME_FORMATE, strtotime($row->created)); ?></td> 
                                        <td>  
                                            <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'deleteUrl' => 'bulk_sms/delete', 'deletePermissionKey' => 'bulk-sms-delete'), true); ?>
                                        </td>  
                                    </tr>
                                <?php endforeach; ?>
                            <?php } ?> 
                        </tbody> 
                    </table>
                </div>
            </div>
            <!-- /.box-body --> 
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
</div> 



<script>
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging
     4 show sr. number or not
     */
    var datatbl = datatable_init([0, 5], [[4, 'desc']], DEFAULT_PAGING, 1);
</script>