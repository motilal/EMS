<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <?php echo form_open_multipart(null, array("id" => "manage-form", "method" => "post")); ?>

                    <div class="col-lg-12 padding0">

                        <div class="col-lg-7">
                            <div class="form-group <?php echo form_error('contact_group') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="contact_group">Group <em>*</em></label> 
                                <?php echo form_dropdown('contact_group', $contact_group_options, set_value("contact_group"), 'class="form-control select2dropdown" id="contact_group" style="width:100%;"'); ?> 
                                <?php echo form_error('contact_group'); ?>
                            </div>
                        </div>  

                        <div class="col-lg-7"> 
                            <div class="form-group <?php echo form_error('message') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="message">Message <em>*</em></label>
                                <?php echo form_dropdown('template', $templates_options, set_value("template"), 'class="form-control select2dropdown" id="template" style="width:100%;"'); ?> 
                                <?php echo form_textarea("message", set_value("message", '', FALSE), "id='message' class='form-control' style='height:100px;'"); ?>
                                <?php echo form_error('message'); ?>
                            </div>   
                        </div>  

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-7">  
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="button" class="btn btn-default" onclick="window.location.href = '<?php echo site_url("bulk_sms"); ?>'">Cancel</button>
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
<script>
    var template_data = <?php echo isset($template_data) ? json_encode($template_data) : '""'; ?>;
    $('#template').on('select2:select', function (e) {
        var _this = $(this);
        if (_this.val() != "") {
            var str = template_data[_this.val()];
            str = str.replace(/%n/g, "\n");
            $('#message').val(str);
        } else {
            $('#message').val('');
        }
    });
</script>