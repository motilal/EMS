<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-shopping-cart"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('city-add')) { ?>
                            <a href="#" data-toggle="modal" data-target="#modal-manage" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Package </a>
                        <?php } ?> 
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
                                <th>Company Name</th> 
                                <th>Package Name</th> 
                                <th>Total Leads</th> 
                                <th>Used Leads</th> 
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
                                        <td><?php echo $row->company_name; ?></td> 
                                        <td><?php echo $row->package_name; ?></td> 
                                        <td><?php echo $row->total_leads; ?></td> 
                                        <td><?php echo $row->used_leads; ?></td>  
                                        <td><?php echo date(DATE_FORMATE, strtotime($row->created)); ?></td> 
                                        <td>
                                            <?php echo $this->layout->element('admin/element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "admin/companies/change_comapany_package_status", 'permissionKey' => "comapny-package-status"), true); ?>
                                        </td>
                                        <td>  
                                            <?php echo $this->layout->element('admin/element/_module_action', array('id' => $row->id, 'deleteUrl' => 'admin/companies/delete_company_package', 'deletePermissionKey' => 'comapny-package-delete'), true); ?>
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

<div class="modal fade" id="modal-manage">
    <div class="modal-dialog">
        <div class="modal-content">
            <?php echo form_open('admin/companies/manage_package', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Package</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12"> 
                        <div class="form-group <?php echo isset($company_id) ? 'hide' : ''; ?>"> 
                            <label class="control-label" for="company">Company <em>*</em></label>  
                            <?php echo form_dropdown('company', $company_options, isset($row->companies_id) ? $row->companies_id : '', 'class="form-control select2dropdown" id="company" style="width:100%;"'); ?>  
                        </div> 
                        <div class="form-group">
                            <label class="control-label" for="package">Package <em>*</em></label>  
                            <?php echo form_dropdown('package', $packages_options, '', 'class="form-control select2dropdown" id="package" style="width:100%;"'); ?>  
                        </div>   
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
    var datatbl = datatable_init([0, 7], [[2, 'asc']], DEFAULT_PAGING, 1);
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
                    $('#modal-manage').modal('hide');
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

    $('#modal-manage').on('hidden.bs.modal', function (e) {
        $('.form-group .help-block').remove();
        $('.form-group').removeClass('has-error');
        $('#manage-form')[0].reset();
        $('#manage-form').find('[name="id"]').val('');
        $('.modal-title').text('Add New City');
    });
</script>