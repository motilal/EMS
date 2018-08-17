<script src="https://maps.googleapis.com/maps/api/js?key=<?php echo GOOGLE_MAP_KEY; ?>&libraries=places&callback=initAutocomplete" async defer></script>
<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body">

                <div class="row">
                    <?php echo form_open_multipart(null, array("id" => "manage-form", "method" => "post")); ?>
                    <div class="col-lg-12 padding0">
                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('portals_id') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="portals_id">Portal <em>*</em></label> 
                                <?php echo form_dropdown('portals_id', $portals_options, set_value("portals_id", isset($data->portals_id) ? $data->portals_id : "", false), 'class="form-control" id="portals_id" style="width:100%;"'); ?> 
                                <?php echo form_error('portals_id'); ?>
                            </div>
                        </div>   

                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('name') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="name">Name <em>*</em></label>
                                <?php echo form_input("name", set_value("name", isset($data->name) ? $data->name : "", false), "id='name' class='form-control'"); ?>
                                <?php echo form_error('name'); ?>
                            </div>
                        </div> 
                    </div> 

                    <div class="col-lg-12 padding0">
                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('email') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="email">Email</label>
                                <?php echo form_input("email", set_value("email", isset($data->email) ? $data->email : "", false), "id='email' class='form-control'"); ?>
                                <?php echo form_error('email'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('phone_number') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="phone_number">Phone Number <em>*</em></label>
                                <?php echo form_input("phone_number", set_value("phone_number", isset($data->phone_number) ? $data->phone_number : "", false), "id='phone_number' class='form-control'"); ?>
                                <?php echo form_error('phone_number'); ?>
                            </div>
                        </div> 
                    </div>

                    <div class="col-lg-12 padding0">
                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('source_location') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="source_location">Location From</label>
                                <?php echo form_input("source_location", set_value("source_location", isset($data->source_location) ? $data->source_location : "", false), "id='source_location' class='form-control'"); ?>
                                <?php echo form_error('source_location'); ?>
                            </div>
                        </div>  
                        <?php
                        if (set_value("portals_id", isset($data->portals_id) ? $data->portals_id : "") != 3 || set_value("portals_id", isset($data->portals_id) ? $data->portals_id : "") == "") {
                            $hide = 'hide';
                        } else {
                            $hide = '';
                        }
                        ?>
                        <div class="col-lg-6 <?php echo $hide; ?>" id="location_to_main">
                            <div class="form-group <?php echo form_error('destination_location') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="location_to">Location To</label>
                                <?php echo form_input("destination_location", set_value("destination_location", isset($data->destination_location) ? $data->destination_location : "", false), "id='destination_location' class='form-control'"); ?>
                                <?php echo form_error('destination_location'); ?>
                            </div>
                        </div>

                    </div>

                    <div class="clearfix"></div>
                    <div class="col-lg-12 padding0">
                        <div class="col-lg-6">
                            <div class="form-group <?php echo form_error('services_id') != "" ? 'has-error' : ''; ?>">
                                <label class="control-label" for="services_id">Service</label> 
                                <?php echo form_dropdown('services_id', $services_options, set_value("services_id", isset($data->services_id) ? $data->services_id : "", false), 'class="form-control select2dropdown" id="services_id" style="width:100%;"'); ?> 
                                <?php echo form_error('services_id'); ?>
                            </div>
                        </div> 

                        <div class="col-lg-6">
                            <?php isset($data->date) ? $data->date = date(DATE_FORMATE, strtotime($data->date)) : ""; ?>    
                            <h5 style="margin:5px 0 5px 0;"><strong class="<?php echo form_error('date') != "" ? 'text-red' : ''; ?>">Date</strong></h5>
                            <div class="form-group input-group date <?php echo form_error('date') != "" ? 'has-error' : ''; ?>"> 
                                <?php echo form_input("date", set_value("date", isset($data->date) ? date('d-m-Y', strtotime($data->date)) : ""), "id='date' class='form-control' placeholder='Start Date'"); ?>
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>                                
                            </div>
                            <?php echo form_error('date'); ?>
                        </div> 


                        <!--                        <div class="col-lg-6">
                                                    <div class="form-group <?php echo form_error('city') != "" ? 'has-error' : ''; ?>">
                                                        <label class="control-label" for="city">City</label> 
                        <?php echo form_dropdown('city', $city_options, set_value("city", isset($data->cities_id) ? $data->cities_id : "", false), 'class="form-control select2dropdown" id="city" style="width:100%;"'); ?> 
                        <?php echo form_error('city'); ?>
                                                    </div>
                                                </div> -->
                    </div>  


                    <div class="clearfix"></div>
                    <div class="col-lg-6"> 
                        <div class="form-group <?php echo form_error('message') != "" ? 'has-error' : ''; ?>">
                            <label class="control-label" for="message">Message</label>
                            <?php echo form_textarea("message", set_value("message", isset($data->message) ? $data->message : ""), "id='message' class='form-control' style='height:100px;'"); ?>
                            <?php echo form_error('message'); ?>
                        </div>   
                    </div>

                    <div class="clearfix"></div>
                    <div class="col-lg-6">
                        <?php echo form_hidden('id', set_value('id', isset($data->id) ? $data->id : "")); ?>
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <button type="button" class="btn btn-default" onclick="window.location.href = '<?php echo site_url("leads"); ?>'">Cancel</button>
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
        $('#portals_id').on('select2:select', function (e) {
            if ($(this).val() == 3) {
                $('#location_to_main').removeClass('hide');
            } else {
                $('#location_to_main').addClass('hide');
            }
        });

    });
    var placeSearch, autocomplete, autocomplete2;
    var componentForm = {
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
    };

    function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete((document.getElementById('source_location')), {types: ['geocode']});
        autocomplete.addListener('place_changed', fillInAddress);
        autocomplete2 = new google.maps.places.Autocomplete((document.getElementById('destination_location')), {types: ['geocode']});
        autocomplete2.addListener('place_changed', fillInAddress);
    }

    function fillInAddress() {
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
            document.getElementById(component).value = '';
            document.getElementById(component).disabled = false;
        }
        for (var i = 0; i < place.address_components.length; i++) {
            var addressType = place.address_components[i].types[0];
            if (componentForm[addressType]) {
                var val = place.address_components[i][componentForm[addressType]];
                document.getElementById(addressType).value = val;
            }
        }
    }
    function geolocate() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var geolocation = {
                    lat: position.coords.latitude,
                    lng: position.coords.longitude
                };
                var circle = new google.maps.Circle({
                    center: geolocation,
                    radius: position.coords.accuracy
                });
                autocomplete.setBounds(circle.getBounds());
            });
        }
    }
</script> 