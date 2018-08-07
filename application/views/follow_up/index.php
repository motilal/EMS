<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-user"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3> 

                <div class="box-tools pull-right">
                    <?php echo form_open('follow_up', ['method' => 'get']); ?>    
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('follow_up-add')) { ?>
                            <a href="<?php echo site_url('follow_up/manage'); ?>" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Member </a>
                        <?php } ?> 
                        <div class="form-group pull-left"> 
                            <div class="input-group">
                                <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                                    <span>
                                        <i class="fa fa-calendar"></i> Select Date Range
                                    </span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                            </div>
                        </div> 
                        <?php
                        echo form_hidden('download', 'report');
                        echo form_hidden('datefrom');
                        echo form_hidden('dateto');
                        ?>
                        <button type="submit" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</button>
                    </div>
                    <?php echo form_close(); ?>
                </div>

            </div>     
            <!-- /.box-header -->
            <div class="box-body"> 
                <div class="table-responsive"> 
                    <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr>
                                <td>Sr.</td>
                                <th>Member Name</th>  
                                <th>Follow Date</th>  
                                <th>Status</th>
                                <th>Client Name</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $follow_status = $this->config->item('follow_status'); ?>
                            <?php if ($result->num_rows() > 0) { ?>
                                <?php foreach ($result->result() as $key => $row): ?> 
                                    <tr id="row_<?php echo $row->id; ?>">
                                        <td><?php echo $key + 1; ?></td>
                                        <td><?php echo $row->member_name; ?></td>  
                                        <td><?php echo date(DATE_FORMATE, strtotime($row->follow_up_date)); ?></td> 
                                        <td><?php echo isset($follow_status[$row->status_id]) ? $follow_status[$row->status_id] : ''; ?></td>
                                        <td><?php echo $row->client_name; ?></td> 
                                        <td><?php echo $row->phone_number; ?></td> 
                                        <td><?php echo $row->email; ?></td>  
                                        <td>
                                            <?php echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "follow_up/changestatus", 'permissionKey' => "follow_up-status"), true); ?>
                                        </td>
                                        <td>  
                                            <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => "follow_up/manage/$row->id", 'deleteUrl' => 'follow_up/delete', 'editPermissionKey' => 'follow_up-edit', 'deletePermissionKey' => 'follow_up-delete'), true); ?>
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
    var datatbl = datatable_init([0, 8], [[1, 'asc']], DEFAULT_PAGING, 1);
    $('#daterange-btn').daterangepicker(
            {
                ranges: {
                    'Today': [moment(), moment()],
                    'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                    'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                    'This Month': [moment().startOf('month'), moment().endOf('month')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
                    'This Year': [moment().startOf('year'), moment()]
                },
                startDate: moment().startOf('year'),
                endDate: moment()
            },
    function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        $('[name="datefrom"]').val(start.format('YYYY-M-D'));
        $('[name="dateto"]').val(end.format('YYYY-MM-DD'));
    });
</script>