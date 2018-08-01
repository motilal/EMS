<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-map-o"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('sub_city-add')) { ?>
                            <a href="#" data-toggle="modal" data-target="#modal-manage" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Sub City </a>
                        <?php } ?> 
                        <a href="<?php echo site_url('sub_cities?download=report'); ?>" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</a>
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr>
                            <td>Sr.</td> 
                            <th>City</th> 
                            <th>Sub City</th>  
                            <th>Pin Code</th>                              
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($result->num_rows() > 0) { ?>
                            <?php foreach ($result->result() as $key => $row): ?> 
                                <tr id="row_<?php echo $row->id; ?>">
                                    <td> <?php echo $key + 1; ?></td>    
                                    <td><?php echo $row->city_name; ?></td>  
                                    <td><?php echo $row->name; ?> </td> 
                                    <td><?php echo $row->pin_code; ?> </td>                                     
                                    <td><?php echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "sub_cities/changestatus", 'permissionKey' => "sub_city-status"), true); ?></td>
                                    <td><?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => "sub_cities/manage", 'deleteUrl' => 'sub_cities/delete', 'editPermissionKey' => 'sub_city-edit', 'deletePermissionKey' => 'sub_city-delete'), true); ?></td>  
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
            <?php echo form_open('sub_cities/manage', array("id" => "manage-form", "method" => "post")); ?>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Add New Sub City</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-lg-12"> 
                        <div class="form-group">
                            <label class="control-label" for="city">City <em>*</em></label> 
                            <?php echo form_dropdown('city', $cities_options, '', 'class="form-control select2dropdown" id="city" style="width:100%;"'); ?>  
                        </div>

                        <div class="form-group">
                            <label class="control-label" for="name">Name <em>*</em></label>
                            <?php echo form_input("name", '', "id='name' class='form-control' autocomplete='off'"); ?>
                        </div> 


                        <h5><strong>Pin Code  <em>*</em></strong></h5>
                        <div class="form-group input-group">                             
                            <?php echo form_input("pin_code", '', "id='pin_code' class='form-control' readonly"); ?> 
                            <span class="input-group-addon padding0">
                                <button type="button" class="btn btn-success fill-pin-code" style="padding:5px 12px;border-radius: 0;">Fill Pin Code</button>
                            </span>                                
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

<script src="https://maps.googleapis.com/maps/api/js?key=<?php echo GOOGLE_MAP_KEY; ?>&libraries=places" async defer></script>
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
        $('.form-group+.help-block').remove();
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
                        if (elem.closest('.form-group').hasClass('input-group')) {
                            elem.closest('.form-group').after(error);
                        } else {
                            elem.closest('.form-group').append(error);
                        }
                        elem.closest('.form-group').addClass('has-error');
                    });
                } else if (res.success && res.msg && res.data) {
                    if (res.mode == 'add') {
                        datatbl.row.add([0, res.data.city_name, res.data.name, res.data.pin_code, res.data.statusButtons, res.data.actionButtons]).draw();
                        $('.changestatus[data-id="' + res.data.id + '"]').closest('tr').attr('id', 'row_' + res.data.id);
                    } else if (res.mode == 'edit') {
                        $('#row_' + res.data.id).find('td:nth-child(2)').html(res.data.city_name);
                        $('#row_' + res.data.id).find('td:nth-child(3)').text(res.data.name);
                        $('#row_' + res.data.id).find('td:nth-child(4)').html(res.data.pin_code);
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
        var cityval = $('#city').val();
        $('#manage-form')[0].reset();
        $('#manage-form').find('[name="id"]').val('');
        $('#city').val(cityval).trigger('change.select2');
        $('.modal-title').text('Add New Sub City');
    });

    $(document).on('click', 'a.edit-row', function (e) {
        var _this = $(this);
        e.preventDefault();
        var id = $(this).data('id');
        $.ajax({
            url: '<?php echo site_url('sub_cities/getDetailAjax'); ?>',
            type: "POST",
            data: {id: id},
            success: function (res)
            {
                if (res.result) {
                    $('#manage-form').find('[name="name"]').val(res.result.name);
                    $('#manage-form').find('[name="pin_code"]').val(res.result.pin_code);
                    $('#manage-form').find('[name="id"]').val(res.result.id);
                    $('#city').val(res.result.cities_id).trigger('change');
                    $('.modal-title').text('Edit Sub City');
                    $('#modal-manage').modal('show');
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                showMessage('error', 'Internal error: ' + jqXHR.responseText);
            }
        });
    });

    $('.fill-pin-code').on('click', function () {
        if ($('#name').val() != "" && $("#city").val() != "") {
            $('.fill-pin-code').text('Loading...');
            var address = $("#city option:selected").text() + ' ' + $('#name').val();
            getLatLong(address);
        } else {
            showMessage('error', {message: 'Please enter city and sub city name'});
        }
    });

    $('#name,#city').on('change', function () {
        $('#pin_code').val('');
    });

    function getLatLong(address) {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({'address': address}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                var latitude = results[0].geometry.location.lat();
                var longitude = results[0].geometry.location.lng();
                GetPinCodeFromLatLong(latitude, longitude);
            }
        });
    }
    function GetPinCodeFromLatLong(lat, lng) {
        var latlng = new google.maps.LatLng(lat, lng);
        var geocoder = geocoder = new google.maps.Geocoder();
        geocoder.geocode({'latLng': latlng}, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    var pin = results[0].formatted_address.split(',')[results[0].formatted_address.split(',').length - 2].trim().split(' ')[1];
                    if (typeof pin === "undefined") {
                        showMessage('error', {message: 'Please enter correct address'});
                        $('.fill-pin-code').text('Fill Pin Code');
                    } else if (pin != "") {
                        $('#pin_code').val(pin);
                        $('.fill-pin-code').text('Fill Pin Code');
                    }
                } else {
                    showMessage('error', {message: 'Please enter correct address'});
                    $('.fill-pin-code').text('Fill Pin Code');
                }
            }
        });
    }
</script> 
<style>
    .pac-container{z-index: 10000 !important;}
</style>