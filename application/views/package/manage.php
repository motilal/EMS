<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <?php echo form_open_multipart(null, array("id" => "manage-form", "method" => "post")); ?>

                    <div class="col-lg-12 padding0">

                        <div class="col-lg-7">
                            <div class="form-group <?php echo form_error('package_type') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="package_type">Package Type <em>*</em></label> 
                                <?php echo form_dropdown('package_type', $package_types_options, set_value("package_type", isset($data->package_types_id) ? $data->package_types_id : "", false), 'class="form-control select2dropdown" id="package_type" style="width:100%;"'); ?> 
                                <?php echo form_error('package_type'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-7">
                            <div class="form-group <?php echo form_error('name') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="name">Package name <em>*</em></label>
                                <?php echo form_input("name", set_value("name", isset($data->name) ? $data->name : "", false), "id='name' class='form-control'"); ?>
                                <?php echo form_error('name'); ?>
                            </div>
                        </div> 


                        <div class="col-lg-7"> 
                            <h5><strong class="<?php echo form_error('duration') != "" ? 'text-red' : ''; ?>">Package Duration <em>*</em></strong></h5>
                            <div class="form-group input-group <?php echo form_error('duration') != "" ? 'has-error' : ''; ?>"> 
                                <?php echo form_input("duration", set_value("duration", isset($data->duration) ? $data->duration : ""), "id='duration' class='form-control'"); ?>
                                <span class="input-group-addon">
                                    Days
                                </span>                                
                            </div>
                            <?php echo form_error('duration'); ?>
                        </div> 
                        
                        <div class="col-lg-7">
                            <div class="form-group <?php echo form_error('no_of_leads') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="no_of_leads">Number of Leads <em>*</em></label>
                                <?php echo form_input("no_of_leads", set_value("no_of_leads", isset($data->no_of_leads) ? $data->no_of_leads : "", false), "id='no_of_leads' class='form-control'"); ?>
                                <?php echo form_error('no_of_leads'); ?>
                            </div>
                        </div> 
                        
                        <div class="col-lg-7"> 
                            <h5><strong class="<?php echo form_error('amount') != "" ? 'text-red' : ''; ?>">Package Amount  <em>*</em></strong></h5>
                            <div class="form-group input-group <?php echo form_error('amount') != "" ? 'has-error' : ''; ?>"> 
                                <?php echo form_input("amount", set_value("amount", isset($data->amount) ? $data->amount : ""), "id='amount' class='form-control'"); ?>
                                <span class="input-group-addon">
                                    &#8377;
                                </span>                                
                            </div>
                            <?php echo form_error('amount'); ?>
                        </div> 

                        <div class="col-lg-7">
                            <div class="form-group <?php echo form_error('servicetypes_id') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="servicetypes_id">Service</label> 
                                <?php echo form_dropdown('servicetypes_id', $servicetypes_options, set_value("servicetypes_id", isset($data->servicetypes_id) ? $data->servicetypes_id : "", false), 'class="form-control select2dropdown" id="servicetypes_id" style="width:100%;"'); ?> 
                                <?php echo form_error('servicetypes_id'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-7">
                            <div class="form-group <?php echo form_error('services[]') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="services">Sub Service(s)</label> 
                                <?php echo form_dropdown('services[]', isset($services_options) ? $services_options : '', set_value("services[]", isset($package_services) ? $package_services : '', false), 'class="form-control" multiple="multiple" id="services" style="width:100%;"'); ?> 
                                <?php echo form_error('services[]'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-7"> 
                            <div class="form-group <?php echo form_error('description') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="description">Package Description</label>
                                <?php echo form_textarea("description", set_value("description", isset($data->description) ? $data->description : ""), "id='description' class='form-control' style='height:100px;'"); ?>
                                <?php echo form_error('description'); ?>
                            </div>   
                        </div> 

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-7"> 
                                <?php echo form_hidden('id', set_value('id', isset($data->id) ? $data->id : "")); ?>
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="button" class="btn btn-default" onclick="window.location.href = '<?php echo site_url("packages"); ?>'">Cancel</button>
                            </div>
                        </div>
                        <?php echo form_close(); ?>
                    </div>
                    <!-- /.row (nested) -->
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 padding0 -->
    </div>
</div>
<!-- /.row -->  
<script type="text/javascript">
    $("#cities,#services").select2({
        tags: false
    });

    $('#servicetypes_id').on('select2:select', function (e) {
        var _this = $(this);
        $.ajax({
            url: '<?php echo site_url('companies/ajax_getsubservices'); ?>',
            type: "POST",
            dataType: "json",
            data: {servicetypes_id: _this.val()},
            success: function (response) {
                if (response.result) {
                    $('#services').select2('destroy').empty().select2({data: response.result});
                }
            },
            error: function (jqXHR, exception) {
                showMessage('error', {message: 'Uncaught Error.\n' + jqXHR.responseText});
            }
        });

    });
</script>