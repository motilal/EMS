<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-shopping-cart"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('company-package-add')) { ?>
                            <a href="#" data-toggle="modal" data-target="#modal-manage" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Package </a>
                        <?php } ?> 
                        <a href="<?php echo site_url('companies/manage_package?download=report'); ?>" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</a>
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
                                <th>Package Amount(&#8377;)</th>
                                <th>Amount Paid(&#8377;)</th> 
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
                                        <td><?php echo $row->package_amount; ?></td> 
                                        <td><?php echo $row->total_paid_amount; ?></td> 
                                        <td><?php echo date(DATE_FORMATE, strtotime($row->created)); ?></td> 
                                        <td>
                                            <?php if ($row->total_leads <= $row->used_leads) { ?>
                                                <label class="label label-default">Expired</label>
                                                <?php
                                            } else {
                                                echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "companies/change_comapany_package_status", 'permissionKey' => "company-package-status"), true);
                                            }
                                            ?>
                                        </td>
                                        <td>  
                                            <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'deleteUrl' => 'companies/delete_company_package', 'deletePermissionKey' => 'company-package-delete', 'packagePaymentHistoryUrl' => 'companies/getPackagePaymentHistory/' . $row->id), true); ?>
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

<!-- Modal -->
<div class="modal fade" id="packagePaymentHistoryModal" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Package Payment History</h4>
            </div>
            <div class="modal-body">

            </div> 
        </div>
    </div>
</div>


<div class="modal fade" id="modal-manage" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content"> 
            <?php echo form_open('companies/manage_package', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Package</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12"> 
                        <div class="form-group <?php echo isset($company_id) ? '' : ''; ?>"> 
                            <label class="control-label" for="company">Company <em>*</em></label>  
                            <?php echo form_dropdown('company', $company_options, isset($company_id) ? $company_id : '', 'class="form-control select2dropdown" id="company" style="width:100%;"'); ?>  
                        </div> 
                        <div class="form-group">
                            <label class="control-label" for="package">Package <em>*</em></label>  
                            <?php echo form_dropdown('package', $packages_options, '', 'class="form-control select2dropdown" id="package" style="width:100%;"'); ?>  
                            <div class="pull-right text-info" id="package_amount"></div>
                        </div>  
                        <?php echo form_hidden('package_amount'); ?>
                        <?php echo form_hidden('total_lead'); ?>
                        <?php echo form_hidden('lead_balance'); ?>
                        <div class="form-group">
                            <label class="control-label" for="amount_paid">Amount Paid <em>*</em></label>
                            <?php echo form_input("amount_paid", '', "id='amount_paid' autocomplete='off' class='form-control'"); ?>
                            <div class="pull-right text-info" id="lead_balance"></div>
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
    var datatbl = datatable_init([0, 9], [[1, 'asc']], DEFAULT_PAGING, 1);
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
        $('#package').val('').trigger('change.select2');
        $('#package_amount,#lead_balance').empty();
        $('.modal-title').text('Add New Package');
    });

    $('#amount_paid').on('keyup', function () {
        var amount_paid = parseFloat($(this).val());
        var package_amount = parseFloat($('[name="package_amount"]').val());
        var total_lead = parseInt($('[name="total_lead"]').val());
        var calculate_lead = (total_lead / package_amount) * amount_paid;
        if (amount_paid > 0 && package_amount > 0 && total_lead > 0) {
            $('#lead_balance').html('Lead Balance: ' + Math.floor(calculate_lead));
            $('[name="lead_balance"]').val(Math.floor(calculate_lead));
        } else {
            $('[name="lead_balance"]').val('');
            $('#lead_balance').empty();
        }
    });

    $('#package').on('select2:select', function (e) {
        var _this = $(this);
        if (_this.val() == "") {
            $('#package_amount').empty();
            $('[name="package_amount"]').val('');
            $('[name="total_lead"]').val('');
            $('#amount_paid').keyup();
            return;
        }
        $.ajax({
            url: '<?php echo site_url('companies/ajax_getPackageAmount'); ?>',
            type: "POST",
            dataType: "json",
            data: {package_id: _this.val()},
            success: function (response) {
                if (response.success && response.row) {
                    $('#package_amount').html('Package Amount : ' + response.row.amount + ' | Total Lead : ' + response.row.no_of_leads);
                    $('[name="package_amount"]').val(response.row.amount);
                    $('[name="total_lead"]').val(response.row.no_of_leads);
                    $('#amount_paid').keyup();
                }
            },
            error: function (jqXHR, exception) {
                showMessage('error', {message: 'Uncaught Error.\n' + jqXHR.responseText});
            }
        });
    });


    $('.package-payment-history').on('click', function (e) {
        $('#packagePaymentHistoryModal .modal-body').load($(this).attr('data-href'), function () {
            $('#packagePaymentHistoryModal').modal({show: true});
            $('#packagePaymentHistoryModal .modal-title').text('Package Payment History');
        });
        e.preventDefault();
    });

    $(document).on('submit', '#pay-package-amount-form', function (e) {
        var _this = $(this);
        _this.find("[type='submit']").prop('disabled', true);
        e.preventDefault();
        $.ajax({
            url: _this.attr('action'),
            type: "POST",
            data: $('#pay-package-amount-form').serialize(),
            success: function (res)
            {
                _this.find("[type='submit']").prop('disabled', false);
                if (res.validation_error) {
                    $.each(res.validation_error, function (index, value) {
                        showMessage('error', {message: value});
                    });
                } else if (res.success && res.msg) {
                    showMessage('success', {message: res.msg});
                    $('#packagePaymentHistoryModal').modal('hide');
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

    $(document).on('click', 'a.delete-package-payment', function (e) {
        e.preventDefault();
        var _this = $(this);
        if (confirm("Are you sure to wants delete this?")) {
            $.ajax({
                url: _this.attr('href'),
                type: "POST",
                dataType: "json",
                data: {id: _this.data('id')},
                success: function (response) {
                    if (response.success) {
                        _this.closest('tr').remove();
                        showMessage('success', {message: response.success});
                        location.reload();
                    } else if (response.error) {
                        showMessage('error', {message: response.error});
                    }
                },
                error: function (jqXHR, exception) {
                    showMessage('error', {message: 'Uncaught Error.\n' + jqXHR.responseText});
                }
            });
        }
    });

    $(document).on('click', 'a.approve-payment-status', function (e) {
        e.preventDefault();
        var _this = $(this);
        if (confirm("Are you sure to wants approve this payment?")) {
            $.ajax({
                url: _this.attr('href'),
                type: "POST",
                dataType: "json",
                data: {id: _this.data('id')},
                success: function (response) {
                    if (response.success) {
                        showMessage('success', {message: response.success});
                        location.reload();
                    } else if (response.error) {
                        showMessage('error', {message: response.error});
                    }
                },
                error: function (jqXHR, exception) {
                    showMessage('error', {message: 'Uncaught Error.\n' + jqXHR.responseText});
                }
            });
        }
    });

</script>