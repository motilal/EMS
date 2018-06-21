<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <?php echo form_open_multipart(null, array("id" => "manage-form", "method" => "post")); ?> 

                    <div class="col-lg-7">
                        <div class="form-group <?php echo form_error('company') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="company">Company(s) <em>*</em></label> 
                            <?php echo form_dropdown('company[]', $company_options, '', 'class="form-control" multiple="multiple" id="company" style="width:100%;"'); ?>  
                        </div>  
                    </div> 

                    <div class="col-lg-7">
                        <div class="form-group <?php echo form_error('email') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="email">Email</label>
                            <?php echo form_input("email", set_value("email", isset($data->email) ? $data->email : "", false), "id='email' class='form-control'"); ?>
                            <?php echo form_error('email'); ?>
                        </div>
                    </div> 

                    <div class="col-lg-7">
                        <div class="form-group <?php echo form_error('location') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="location">Location</label>
                            <?php echo form_input("location", set_value("location", isset($data->location) ? $data->location : "", false), "id='location' class='form-control'"); ?>
                            <?php echo form_error('location'); ?>
                        </div>
                    </div> 

                    <div class="col-lg-7">
                        <div class="form-group <?php echo form_error('phone_number') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="phone_number">Phone Number</label>
                            <?php echo form_input("phone_number", set_value("phone_number", isset($data->phone_number) ? $data->phone_number : "", false), "id='phone_number' class='form-control'"); ?>
                            <?php echo form_error('phone_number'); ?>
                        </div>
                    </div> 
                    <div class="clearfix"></div>
                    <div class="col-lg-3">
                        <?php isset($data->date) ? $data->date = date(DATE_FORMATE, strtotime($data->date)) : ""; ?>    
                        <h5><strong class="<?php echo form_error('date') != "" ? 'text-red' : ''; ?>">Date</strong></h5>
                        <div class="form-group input-group date <?php echo form_error('date') != "" ? 'has-error' : ''; ?>"> 
                            <?php echo form_input("date", set_value("date", isset($data->date) ? date('d-m-Y', strtotime($data->date)) : ""), "id='date' class='form-control' placeholder='Start Date'"); ?>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>                                
                        </div>
                        <?php echo form_error('date'); ?>
                    </div> 
                    <div class="clearfix"></div>
                    <div class="col-lg-7"> 
                        <div class="form-group <?php echo form_error('message') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="message">Message</label>
                            <?php echo form_textarea("message", set_value("message", isset($data->message) ? $data->message : ""), "id='message' class='form-control' style='height:100px;'"); ?>
                            <?php echo form_error('message'); ?>
                        </div>   
                    </div>

                    <div class="clearfix"></div>
                    <div class="col-lg-7">
                        <?php echo form_hidden('id', set_value('id', isset($data->id) ? $data->id : "")); ?>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="button" class="btn btn-default" onclick="window.location.href = '<?php echo site_url("admin/leads"); ?>'">Cancel</button>
                    </div>
                    <?php echo form_close(); ?>
                </div>
                <!-- /.row (nested) -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->  
<script type="text/javascript">
    $("#portals_id").select2();
    $(function () {
        $('#date').datetimepicker({
            format: 'd-m-Y',
            mask: '39-19-9999',
            timepicker: false
        });
    });
</script>