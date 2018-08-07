<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <?php echo form_open(null, array("id" => "manage-form", "method" => "post")); ?>
                    <?php if (!empty($users_options)) { ?>
                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('users_id') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="users_id">Assign User</label> 
                                    <?php echo form_dropdown('users_id', $users_options, set_value("users_id", isset($data->users_id) ? $data->users_id : "", false), 'class="form-control select2dropdown" id="users_id" style="width:100%;"'); ?> 
                                    <?php echo form_error('users_id'); ?>
                                </div>
                            </div> 
                        </div>
                    <?php } ?>
                    <div class="col-lg-12 padding0"> 
                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('member_name') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="member_name">Member Name<em>*</em></label>
                                <?php echo form_input("member_name", set_value("member_name", isset($data->member_name) ? $data->member_name : "", false), "id='member_name' class='form-control'"); ?>
                                <?php echo form_error('member_name'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-6">
                            <?php isset($data->follow_up_date) ? $data->follow_up_date = date('d-m-Y', strtotime($data->follow_up_date)) : ""; ?>   
                            <div class="form-group <?php echo form_error('follow_up_date') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="follow_up_date">Follow Up Date</label>
                                <?php echo form_input("follow_up_date", set_value("follow_up_date", isset($data->follow_up_date) ? $data->follow_up_date : "", false), "id='follow_up_date' class='form-control'"); ?>
                                <?php echo form_error('follow_up_date'); ?>
                            </div>
                        </div> 
                    </div>
                    <div class="col-lg-12 padding0"> 
                        <div class="col-lg-6">
                            <?php $follow_status = $this->config->item('follow_status'); ?>
                            <div class="form-group <?php echo form_error('follow_status') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="follow_status">Status</label>  
                                <?php echo form_dropdown('follow_status', $follow_status, set_value("follow_status", isset($data->status_id) ? $data->status_id : "", false), 'class="form-control" id="follow_status" style="width:100%;"'); ?> 
                                <?php echo form_error('follow_status'); ?>
                            </div>
                        </div>   

                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('client_name') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="client_name">Client Name</label>
                                <?php echo form_input("client_name", set_value("client_name", isset($data->client_name) ? $data->client_name : "", false), "id='client_name' class='form-control'"); ?>
                                <?php echo form_error('client_name'); ?>
                            </div>
                        </div> 
                    </div>
                    <div class="col-lg-12 padding0"> 
                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('phone_number') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="phone_number">Phone Number</label>
                                <?php echo form_input("phone_number", set_value("phone_number", isset($data->phone_number) ? $data->phone_number : "", false), "id='phone_number' class='form-control'"); ?>
                                <?php echo form_error('phone_number'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('email') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="email">Email</label>
                                <?php echo form_input("email", set_value("email", isset($data->email) ? $data->email : "", false), "id='email' class='form-control'"); ?>
                                <?php echo form_error('email'); ?>
                            </div>
                        </div> 
                    </div> 

                    <div class="col-lg-12 padding0">
                        <div class="col-lg-7"> 
                            <?php echo form_hidden('id', set_value('id', isset($data->id) ? $data->id : "")); ?>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="button" class="btn btn-default" onclick="window.location.href = '<?php echo site_url("follow_up"); ?>'">Cancel</button>
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
<!-- /.row -->   
<script>
    $(function () {
        $('#follow_up_date').datetimepicker({
            format: 'd-m-Y',
            mask: '39-19-9999',
            timepicker: false
        });
    });
</script>