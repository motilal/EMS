<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-globe"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('group-add')) { ?>
                            <a href="#" data-toggle="modal" data-target="#modal-manage" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Group </a>
                        <?php } ?> 
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr>
                            <td>Sr.</td>
                            <th>Name</th>
                            <th>Company(s)</th> 
                            <th>City Name</th> 
                            <th>Created</th> 
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
                                    <td><?php echo $row->name; ?></td> 
                                    <td><?php echo $row->name; ?>
                                        <?php
                                        //$companys = $this->company->get_subject_subcourses(array('subject_id' => $row->id));
                                        //$companys_ids = filterAssocArray($companys, 'id');
                                        //$companys = filterAssocArray($companys, 'name');
                                        //echo empty($companys) ? '' : implode(',', $companys);
                                        ?>
                                        <div class="companys" style="display:none;"><?php //echo empty($companys_ids) ? '' : json_encode($companys_ids);    ?></div>
                                    </td>
                                    <td><?php echo date(DATE_FORMATE, strtotime($row->created)); ?></td>
                                    <td>
                                        <?php echo $this->layout->element('admin/element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "admin/groups/changestatus", 'permissionKey' => "group-status"), true); ?>
                                    </td>
                                    <td>  
                                        <?php echo $this->layout->element('admin/element/_module_action', array('id' => $row->id, 'editUrl' => "admin/groups/manage", 'deleteUrl' => 'admin/groups/delete', 'editPermissionKey' => 'group-edit', 'deletePermissionKey' => 'group-delete'), true); ?>
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
            <?php echo form_open_multipart('admin/groups/manage', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Companies Group</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label class="control-label" for="name">Group Name <em>*</em></label>
                            <?php echo form_input("name", '', "id='name' class='form-control'"); ?>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="company">Company(s)</label> 
                            <?php echo form_dropdown('company[]', $company_options, '', 'class="form-control" multiple="multiple" id="company" style="width:100%;"'); ?>  
                        </div>     

                        <div class="form-group <?php echo form_error('city') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="city">City</label> 
                            <?php echo form_dropdown('city', $city_options, set_value("city", isset($data->city) ? $data->city : "", false), 'class="form-control select2dropdown" id="city" style="width:100%;"'); ?> 
                            <?php echo form_error('city'); ?>
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
    var datatbl = datatable_init([0, 6], [[2, 'asc']], DEFAULT_PAGING, 1);

    $('#manage-form').submit(function (e) {
        var _this = $(this);
        _this.find("[type='submit']").prop('disabled', true);
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        e.preventDefault();
        $.ajax({
            url: _this.attr('action'),
            type: "POST",
            data: new FormData($('#manage-form')[0]),
            cache: false,
            processData: false,
            contentType: false,
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
                        datatbl.row.add([0, res.data.image, res.data.name, res.data.companys, res.data.created, res.data.statusButtons, res.data.actionButtons]).draw();
                        $('.changestatus[data-id="' + res.data.id + '"]').closest('tr').attr('id', 'row_' + res.data.id);
                    } else if (res.mode == 'edit') {
                        $('#row_' + res.data.id).find('td:nth-child(2)').html(res.data.image);
                        $('#row_' + res.data.id).find('td:nth-child(3)').text(res.data.name);
                        $('#row_' + res.data.id).find('td:nth-child(4)').html(res.data.companys);
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
        $('.modal-title').text('Add New Subject');
        $('#company').val('').trigger('change.select2');
    });

    $(document).on('click', 'a.edit-row', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var name = $.trim($(this).closest('tr').find('td:nth-child(3)').text());
        var companys_selected = $.trim($(this).closest('tr').find('td:nth-child(4)').find('.companys').text());
        $('#manage-form').find('[name="name"]').val(name);
        $('#manage-form').find('[name="id"]').val(id);
        $('.modal-title').text('Edit Subject');
        if (companys_selected != "") {
            $('#company').val(JSON.parse(companys_selected)).trigger('change.select2');
        }
        $('#modal-manage').modal('show');
    });

    $("#company").select2({
        tags: false
    });
</script>