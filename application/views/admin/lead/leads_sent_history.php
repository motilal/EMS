<div class="nav-tabs-custom">
    <ul class="nav nav-tabs">
        <li><a href="<?php echo site_url('admin/leads/index/inbox/' . $portal_id); ?>">Lead Inbox</a></li>
        <li><a href="<?php echo site_url('admin/leads/index/sent/' . $portal_id); ?>">Lead Sent</a></li>
        <li><a href="<?php echo site_url('admin/leads/index/pending/' . $portal_id); ?>">Lead Remaining</a></li>
        <li class="active"><a href="<?php echo site_url('admin/leads/leads_sent_history/' . $portal_id); ?>">Lead Sent History</a></li>
        <li class=""><a href="<?php echo site_url('admin/leads/leads_return_history/' . $portal_id); ?>">Lead Return History</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active">
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr> 
                            <td>Sr.</td>
                            <th>Company Name</th>
                            <th>User Name</th>
                            <th>User Phone</th>
                            <th>User Message</th>
                            <th>Sent On</th>
                            <th>Status</th>
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
            <!-- /.box-body --> 
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
</div> 

<div class="modal fade" id="modal-return-lead">
    <div class="modal-dialog">
        <div class="modal-content">
            <?php echo form_open('admin/leads/add_lead_return_request', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Generate Lead Return Request</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label class="control-label" for="name">Reason <em>*</em></label>
                            <?php echo form_textarea("reason", '', "id='reason' class='form-control' style='height:100px;'"); ?>
                        </div>  
                        <?php echo form_hidden('id'); ?> 
                    </div>
                </div>
            </div>
            <div class="modal-footer"> 
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
            <?php echo form_close(); ?> 
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    var current_url = '<?php echo current_url(); ?>';
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging 
     */
    var datatbl = dynamic_datatable_init(current_url, [0, 6, 7], [], DEFAULT_PAGING);
    $(document).on('click', 'a.resend-lead', function (e) {
        if (confirm('Are you sure to wants resend email lead again?')) {
            return;
        }
        e.preventDefault();
    });


    $('#manage-form').submit(function (e) {
        var _this = $(this);
        _this.find("[type='submit']").prop('disabled', true);
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        e.preventDefault();
        $.ajax({
            url: _this.attr('action'),
            type: "POST",
            data: $('#manage-form').serialize(),
            success: function (res)
            {
                _this.find("[type='submit']").prop('disabled', false);
                if (res.validation_error) {
                    $.each(res.validation_error, function (index, value) {
                        var elem = _this.find('[name="' + index + '"]');
                        var error = '<div class="help-block">' + value + '</div>';
                        elem.closest('.form-group').append(error);
                        elem.closest('.form-group').addClass('has-error');
                    });
                } else if (res.success && res.msg) {
                    showMessage('success', {message: res.msg});
                    $('#modal-return-lead').modal('hide');
                    location.reload();
                } else if (res.error) {
                    showMessage('error', {message: res.error});
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                _this.find("[type='submit']").prop('disabled', false);
                showMessage('error', 'Internal error: ' + jqXHR.responseText);
            }
        });
    });
    $('#modal-return-lead').on('hidden.bs.modal', function (e) {
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        $('#manage-form')[0].reset();
        $('#manage-form').find('[name="id"]').val('');
    });
    $(document).on('click', 'a.return-lead', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        $('#manage-form').find('[name="id"]').val(id);
        $('#modal-return-lead').modal('show');
    });

</script>