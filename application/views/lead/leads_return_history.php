<div class="nav-tabs-custom">

    <ul class="nav nav-tabs">
        <li><a href="<?php echo site_url('leads/index/inbox/' . $portal_id); ?>">Lead Inbox</a></li>
        <li><a href="<?php echo site_url('leads/index/sent/' . $portal_id); ?>">Lead Sent</a></li>
        <li><a href="<?php echo site_url('leads/index/pending/' . $portal_id); ?>">Lead Remaining</a></li>
        <?php if (is_allow_action('lead-sent-history') === TRUE) { ?>
            <li class=""><a href="<?php echo site_url('leads/leads_sent_history/' . $portal_id); ?>">Companies Lead Sent History</a></li>
        <?php } ?>
        <?php if (is_allow_action('lead-return-history') === TRUE) { ?>
            <li class="active"><a href="<?php echo site_url('leads/leads_return_history/' . $portal_id); ?>">Companies Lead Return History</a></li> 
        <?php } ?>
        <li class="pull-right"> 
            <div class="btn-group" data-toggle="btn-toggle"> 
                <?php echo form_open("leads/leads_return_history/$portal_id", ['method' => 'get']); ?>  
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
                <button type="submit" class="btn btn-default btn-sm pull-left"><i class="fa fa-download"></i> Export CSV</button>
                <?php echo form_close(); ?>
            </div> 
        </li>
    </ul>

    <div class="tab-content">
        <div class="tab-pane active">  
            <!-- /.box-header -->  
            <div class="box-body"> 
                <?php echo form_open('leads/actions', array("id" => "table-form", "method" => "post")); ?>  
                <div class="table-responsive">
                    <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr> 
                                <td><input class="check-all" type="checkbox"></td> 
                                <th>Company Name</th>
                                <th>Customer Name</th>
                                <th>Customer Phone</th>
                                <th>Comment</th>
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
                <div class="col-sm-4 multi-action padding0">  
                    <select name="actions" id="list-action" class="form-control list-action">
                        <option value="">Choose an action...</option>
                        <option value="return_approve">Approve</option> 
                    </select>
                    <input type="hidden" name="current_url" value="<?php echo current_url(); ?>">
                    <input type="submit" value="GO" class="btn btn-primary"/> 
                </div>
                <?php echo form_close(); ?>

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
    $("#table-form").submit(function () {
        if ($("[name='ids[]']:checked").length == 0) {
            alert('Please select atleast one checkbox.');
            return false;
        }
    });
</script>