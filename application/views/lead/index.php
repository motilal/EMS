<div class="nav-tabs-custom">
    <ul class="nav nav-tabs">
        <li class="<?php echo $type == '' || $type == 'inbox' ? 'active' : ''; ?>"><a href="<?php echo site_url('leads/index/inbox/' . $portal_id); ?>">Lead Inbox</a></li>
        <li class="<?php echo $type == 'sent' ? 'active' : ''; ?>"><a href="<?php echo site_url('leads/index/sent/' . $portal_id); ?>">Lead Sent</a></li>
        <li class="<?php echo $type == 'pending' ? 'active' : ''; ?>"><a href="<?php echo site_url('leads/index/pending/' . $portal_id); ?>">Lead Remaining</a></li>
        <?php if (is_allow_action('lead-sent-history') === TRUE) { ?>
            <li class=""><a href="<?php echo site_url('leads/leads_sent_history/' . $portal_id); ?>">Companies Lead Sent History</a></li>
        <?php } ?>
        <?php if (is_allow_action('lead-return-history') === TRUE) { ?>
            <li class=""><a href="<?php echo site_url('leads/leads_return_history/' . $portal_id); ?>">Companies Lead Return History</a></li>
        <?php } ?>
        <?php if ($type == 'inbox') { ?>
            <li class="pull-right"> 
                <?php if (is_allow_action('add-lead')) { ?>
                    <div style="width: 100%;">
                        <div class="btn-group" data-toggle="btn-toggle">
                            <a href="<?php echo site_url('leads/manage'); ?>" class="btn btn-primary btn-sm add_new_tab_item"><i class="fa fa-plus"></i> Add New Lead</a>
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
                            <th>Customer Name</th>
                            <th>Customer Phone</th>
                            <th>Service Type</th>  
                            <th>City</th> 
                            <th>Received</th> 
                            <th>Sent Status</th>
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

        </div>
    </div>
</div>
<div class="modal fade" id="modal-send-lead">
    <div class="modal-dialog">
        <div class="modal-content">
            <?php echo form_open('leads/send_lead', array("id" => "send-lead-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Manual Send Request</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label class="control-label" for="company">Company(s)</label> 
                            <?php echo form_dropdown('company[]', $company_options, '', 'class="form-control" multiple="multiple" id="company" style="width:100%;"'); ?>  
                        </div>  
                    </div>
                    <?php echo form_hidden('flag'); ?>
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
<script>
    var current_url = '<?php echo current_url(); ?>';
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging 
     */
    var datatbl = dynamic_datatable_init(current_url, [0, 8], [], DEFAULT_PAGING);
    $('#send-lead-form').submit(function (e) {
        var _this = $(this);
        _this.find("[type='submit']").prop('disabled', true);
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        e.preventDefault();
        $.ajax({
            url: _this.attr('action'),
            type: "POST",
            data: $('#send-lead-form').serialize(),
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
                    $('#send-lead-form').modal('hide');
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
    $('#modal-send-lead').on('hidden.bs.modal', function (e) {
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        $('#send-lead-form')[0].reset();
        $('#send-lead-form').find('[name="id"]').val('');
        $('#company').val('').trigger('change.select2');
    });
    $(document).on('click', 'a.send-lead', function (e) {
        e.preventDefault();
        var action = $(this).data('action');
        $('#send-lead-form').attr('action', action);
        $('#modal-send-lead').modal('show');
    });
    $("#company").select2({
        tags: false
    });
</script>