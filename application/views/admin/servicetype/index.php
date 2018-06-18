<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-cogs"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('servicetype-add')) { ?>
                            <a href="#" data-toggle="modal" data-target="#modal-manage" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Service </a>
                        <?php } ?> 
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr>
                            <td>Sr.</td> 
                            <th>Name</th> 
                            <th>Code</th> 
                            <th>Portal</th>  
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($result->num_rows() > 0) { ?>
                            <?php foreach ($result->result() as $key => $row): ?> 
                                <tr id="row_<?php echo $row->id; ?>">
                                    <td><?php echo $key + 1; ?></td> 
                                    <td><?php echo $row->name; ?></td> 
                                    <td><?php echo $row->code; ?></td> 
                                    <td><?php echo $row->portal_name; ?><div class="hide portal_id"><?php echo $row->portals_id; ?></div></td>  
                                    <td>
                                        <?php echo $this->layout->element('admin/element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "admin/servicetypes/changestatus", 'permissionKey' => "servicetype-status"), true); ?>
                                    </td>
                                    <td>  
                                        <?php echo $this->layout->element('admin/element/_module_action', array('id' => $row->id, 'editUrl' => "admin/servicetypes/manage", 'deleteUrl' => 'admin/servicetypes/delete', 'editPermissionKey' => 'servicetype-edit', 'deletePermissionKey' => 'servicetype-delete'), true); ?>
                                    </td>  
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

<div class="modal fade" id="modal-manage">
    <div class="modal-dialog">
        <div class="modal-content">
            <?php echo form_open('admin/servicetypes/manage', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Service</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label class="control-label" for="name">Name <em>*</em></label>
                            <?php echo form_input("name", '', "id='name' class='form-control'"); ?>
                        </div> 
                        <div class="form-group">
                            <label class="control-label" for="code">Code</label>
                            <?php echo form_input("code", '', "id='code' class='form-control'"); ?>
                        </div> 
                        <div class="form-group">
                            <label class="control-label" for="portal">Portal</label> 
                            <?php echo form_dropdown('portal', $portal_options, '', 'class="form-control select2dropdown" id="portal" style="width:100%;"'); ?>  
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
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging
     4 show sr. number or not
     */
    var datatbl = datatable_init([0, 5], [[2, 'asc']], DEFAULT_PAGING, 1);

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
                } else if (res.success && res.msg && res.data) {
                    if (res.mode == 'add') {
                        datatbl.row.add([0, res.data.name,res.data.code, res.data.portal_name, res.data.statusButtons, res.data.actionButtons]).draw();
                        $('.changestatus[data-id="' + res.data.id + '"]').closest('tr').attr('id', 'row_' + res.data.id);
                    } else if (res.mode == 'edit') {
                        $('#row_' + res.data.id).find('td:nth-child(2)').html(res.data.name);
                        $('#row_' + res.data.id).find('td:nth-child(3)').text(res.data.code);
                        $('#row_' + res.data.id).find('td:nth-child(4)').text(res.data.portal_name);
                    }
                    showMessage('success', {message: res.msg});
                    $('#modal-manage').modal('hide');
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

    $('#modal-manage').on('hidden.bs.modal', function (e) {
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        $('#manage-form')[0].reset();
        $('#manage-form').find('[name="id"]').val('');
        $('.modal-title').text('Add New Course');
    });

    $(document).on('click', 'a.edit-row', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var name = $.trim($(this).closest('tr').find('td:nth-child(2)').text());
        var code = $.trim($(this).closest('tr').find('td:nth-child(3)').text());
        var portal_selected = $.trim($(this).closest('tr').find('td:nth-child(4)').find('.portal_id').text());
        $('#manage-form').find('[name="name"]').val(name);
        $('#manage-form').find('[name="code"]').val(code);
        if (portal_selected != "") {
            $('#portal').val(portal_selected).trigger('change.select2');
        }
        $('#manage-form').find('[name="id"]').val(id);
        $('.modal-title').text('Edit Service');
        $('#modal-manage').modal('show');
    });

</script>