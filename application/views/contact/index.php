<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-phone-square"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle"> 
                        <?php if (is_allow_action('contact-add')) { ?>
                            <a href="#" data-toggle="modal" data-target="#modal-manage" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Contact </a>
                        <?php } ?> 
                        <a href="<?php echo site_url('contacts?download=report'); ?>" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</a>
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body"> 
                <?php
                if (!empty($group_id)) {
                    echo form_open('contacts/update_group_contacts/' . $group_id, array("id" => "table-form", "method" => "post"));
                }
                ?> 
                <div class="table-responsive">
                    <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr>
                                <th><input class="check-all" type="checkbox"></th>  
                                <th>Name</th> 
                                <th>Contact Number</th> 
                                <th>Created</th> 
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if ($result->num_rows() > 0) { ?>
                                <?php foreach ($result->result() as $key => $row): ?> 
                                    <tr id="row_<?php echo $row->id; ?>">
                                        <td><?php echo form_checkbox("ids[]", $row->id, !empty($group_contacts) && in_array($row->id, $group_contacts) ? true : false, "id=\"ids_{$row->id}\""); ?></td> 
                                        <td><?php echo $row->name; ?></td> 
                                        <td><?php echo $row->contact; ?></td> 
                                        <td><?php echo date(DATETIME_FORMATE, strtotime($row->created)); ?></td>
                                        <td>
                                            <?php echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "contacts/changestatus", 'permissionKey' => "contact-status"), true); ?>
                                        </td>
                                        <td>  
                                            <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => "contacts/manage", 'deleteUrl' => 'contacts/delete', 'editPermissionKey' => 'contact-edit', 'deletePermissionKey' => 'contact-delete'), true); ?>
                                        </td>  
                                    </tr>
                                <?php endforeach; ?>
                            <?php } ?> 
                        </tbody> 
                    </table>
                </div>
                <?php if (!empty($group_id)) { ?>
                    <input type="hidden" name='contact_ids'>
                    <div class="col-sm-4 multi-action padding0">  
                        <select name="actions" id="list-action" class="form-control list-action"> 
                            <option value="update_group_contacts">Update Contact List</option> 
                        </select> 
                        <input type="submit" value="GO" class="btn btn-primary"/> 
                    </div>
                    <?php echo form_close(); ?>
                <?php } ?>
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
            <?php echo form_open('contacts/manage', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Contact</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label class="control-label" for="name">Name <em>*</em></label>
                            <?php echo form_input("name", '', "id='name' class='form-control'"); ?>
                        </div>  
                        <div class="form-group">
                            <label class="control-label" for="name">Contact Number <em>*</em></label>
                            <?php echo form_input("contact", '', "id='contact' class='form-control'"); ?>
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
    var datatbl = datatable_init([0, 5, 2], [], DEFAULT_PAGING, 0);
    var group_has = <?php echo (isset($group_id) && $group_id) > 0 ? '1' : '0'; ?>;
    if (group_has == 1) {
        var arr = [];
        var selectedvalue = <?php echo isset($group_contacts) ? json_encode($group_contacts) : "''"; ?>;
        $.each(selectedvalue, function (index, value) {
            arr.push(value);
        });

        $(document).on('change', '[name="ids[]"]', function () {
            if (this.checked) {
                if ($.inArray(this.value, arr) == -1) {
                    arr.push(this.value);
                }
            } else {
                arr.splice(arr.indexOf(this.value), 1);
            }
            $("[name='contact_ids']").val(arr + '');
        });
        $(document).on('change', '.check-all', function () {
            $("[name='contact_ids']").trigger('change');
        });
    }


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
                        datatbl.row.add([res.data.checkbox, res.data.name, res.data.contact, res.data.created, res.data.statusButtons, res.data.actionButtons]).draw();
                        $('.changestatus[data-id="' + res.data.id + '"]').closest('tr').attr('id', 'row_' + res.data.id);
                    } else if (res.mode == 'edit') {
                        $('#row_' + res.data.id).find('td:nth-child(2)').text(res.data.name);
                        $('#row_' + res.data.id).find('td:nth-child(3)').text(res.data.contact);
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
        $('.modal-title').text('Add New Contact');
    });

    $(document).on('click', 'a.edit-row', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        var name = $.trim($(this).closest('tr').find('td:nth-child(2)').text());
        var contact = $.trim($(this).closest('tr').find('td:nth-child(3)').text());
        $('#manage-form').find('[name="name"]').val(name);
        $('#manage-form').find('[name="contact"]').val(contact);
        $('#manage-form').find('[name="id"]').val(id);
        $('.modal-title').text('Edit Contact');
        $('#modal-manage').modal('show');
    });

</script>