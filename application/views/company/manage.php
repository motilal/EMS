<script src="https://maps.googleapis.com/maps/api/js?key=<?php echo GOOGLE_MAP_KEY; ?>&libraries=places&callback=initAutocomplete" async defer></script>
<div class="row">
    <div class="col-xs-12"> 
        <?php echo form_open_multipart(null, array("id" => "manage-form", "method" => "post")); ?>
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs" id="company_tab">
                <li class="active"><a href="#tab_1" data-toggle="tab">Company Detail</a></li>
                <li><a href="#tab_2" data-toggle="tab">Company Documents</a></li>
                <li><a href="#tab_3" data-toggle="tab">Lead Base</a></li> 
            </ul> 
            <div class="tab-content"> 
                <div class="tab-pane active" id="tab_1"> 
                    <div class="row">
                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('name') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="name">Company name <em>*</em></label>
                                    <?php echo form_input("name", set_value("name", isset($data->name) ? $data->name : "", false), "id='name' class='form-control'"); ?>
                                    <?php echo form_error('name'); ?>
                                </div>
                            </div> 


                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('company_owner') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="company_owner">Company Owner</label>
                                    <?php echo form_input("company_owner", set_value("company_owner", isset($data->company_owner) ? $data->company_owner : "", false), "id='company_owner' class='form-control'"); ?>
                                    <?php echo form_error('company_owner'); ?>
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
                                <div class="form-group <?php echo form_error('phone1') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="phone1">Phone</label>
                                    <?php echo form_input("phone1", set_value("phone1", isset($data->phone1) ? $data->phone1 : "", false), "id='phone1' class='form-control'"); ?>
                                    <?php echo form_error('phone1'); ?>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 padding0"> 
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('phone2') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="phone2">Alternate Phone</label>
                                    <?php echo form_input("phone2", set_value("phone2", isset($data->phone2) ? $data->phone2 : "", false), "id='phone2' class='form-control'"); ?>
                                    <?php echo form_error('phone2'); ?>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('company_address') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="company_address">Company Address</label>
                                    <?php echo form_input("company_address", set_value("company_address", isset($data->company_address) ? $data->company_address : "", false), "id='location' class='form-control'"); ?>
                                    <?php echo form_error('company_address'); ?>
                                </div>
                            </div> 
                        </div>   

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('country') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="country">Country</label>
                                    <?php echo form_input("country", set_value("country", isset($data->country) ? $data->country : "", false), "id='country' class='form-control'"); ?>
                                    <?php echo form_error('country'); ?>
                                </div>
                            </div> 
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('state') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="state">State</label>
                                    <?php echo form_input("state", set_value("state", isset($data->state) ? $data->state : "", false), "id='state' class='form-control'"); ?>
                                    <?php echo form_error('state'); ?>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('city') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="city">City</label>
                                    <?php echo form_input("city", set_value("city", isset($data->city) ? $data->city : "", false), "id='city' class='form-control'"); ?>
                                    <?php echo form_error('city'); ?>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('zip_code') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="zip_code">Zip Code</label>
                                    <?php echo form_input("zip_code", set_value("zip_code", isset($data->zip_code) ? $data->zip_code : "", false), "id='zip_code' class='form-control'"); ?>
                                    <?php echo form_error('zip_code'); ?>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('latitude') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="latitude">Latitude</label>
                                    <?php echo form_input("latitude", set_value("latitude", isset($data->latitude) ? $data->latitude : "", false), "id='latitude' class='form-control'"); ?>
                                    <?php echo form_error('latitude'); ?>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('logitude') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="logitude">Longitude</label>
                                    <?php echo form_input("logitude", set_value("logitude", isset($data->logitude) ? $data->logitude : "", false), "id='logitude' class='form-control'"); ?>
                                    <?php echo form_error('logitude'); ?>
                                </div>
                            </div> 
                        </div>

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-12">
                                <div class="pull-right"> 
                                    <button type="button" class="btn btn-default" onclick="window.location.href = '<?php echo site_url("companies"); ?>'">Cancel</button>
                                    <button type="button" class="btn btn-primary" onclick="show_tab('#company_tab li:nth-child(2) a')">Next</button>                                     
                                </div>
                            </div>
                        </div>
                    </div> 
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="tab_2"> 
                    <div class="row">
                        <div class="col-lg-12 padding0">   
                            <div class="col-lg-12 padding0">
                                <div class="col-lg-6">
                                    <div class="form-group <?php echo form_error('gst_no') != "" ? 'has-error' : ''; ?>">
                                        <label class="control-label" for="gst_no">GST No.</label>
                                        <?php echo form_input("gst_no", set_value("gst_no", isset($data->gst_no) ? $data->gst_no : "", false), "id='gst_no' class='form-control'"); ?>
                                        <?php echo form_error('gst_no'); ?>
                                    </div>
                                </div>
                                <div class="col-lg-6"> 
                                    <div class="form-group">
                                        <label class="control-label" for="photo">Photo:</label>
                                        <?php echo form_upload("photo", '', "id='photo' accept='image/*'"); ?> 
                                        <?php if (isset($data->photo) && $data->photo != "") { ?>
                                            <a href="<?php echo site_url('companies/download_doc/' . $data->photo); ?>"><?php echo $data->photo; ?></a>
                                        <?php } ?>
                                    </div> 
                                </div>
                            </div> 

                            <div class="col-lg-12 padding0">
                                <div class="col-lg-6">
                                    <div class="form-group <?php echo form_error('aadhar_no') != "" ? 'has-error' : ''; ?>">
                                        <label class="control-label" for="aadhar_no">Aadhar No.</label>
                                        <?php echo form_input("aadhar_no", set_value("aadhar_no", isset($data->aadhar_no) ? $data->aadhar_no : "", false), "id='aadhar_no' class='form-control'"); ?>
                                        <?php echo form_error('aadhar_no'); ?>
                                    </div>
                                </div>

                                <div class="col-lg-6"> 
                                    <div class="form-group">
                                        <label class="control-label" for="aadhar_doc">Aadhar document:</label>
                                        <?php echo form_upload("aadhar_doc", '', "id='aadhar_doc' accept='image/*'"); ?>  
                                        <?php if (isset($data->aadhar_doc) && $data->aadhar_doc != "") { ?>
                                            <a href="<?php echo site_url('companies/download_doc/' . $data->aadhar_doc); ?>"><?php echo $data->aadhar_doc; ?></a>
                                        <?php } ?>
                                    </div> 
                                </div>
                            </div>

                            <div class="col-lg-12 padding0">
                                <div class="col-lg-6">
                                    <div class="form-group <?php echo form_error('pencard_no') != "" ? 'has-error' : ''; ?>">
                                        <label class="control-label" for="pencard_no">Pencard No.</label>
                                        <?php echo form_input("pencard_no", set_value("pencard_no", isset($data->pencard_no) ? $data->pencard_no : "", false), "id='pencard_no' class='form-control'"); ?>
                                        <?php echo form_error('pencard_no'); ?>
                                    </div>
                                </div>

                                <div class="col-lg-6"> 
                                    <div class="form-group">
                                        <label class="control-label" for="pencard_doc">Pencard document:</label>
                                        <?php echo form_upload("pencard_doc", '', "id='pencard_doc' accept='image/*'"); ?> 
                                        <?php if (isset($data->pencard_doc) && $data->pencard_doc != "") { ?>
                                            <a href="<?php echo site_url('companies/download_doc/' . $data->pencard_doc); ?>"><?php echo $data->pencard_doc; ?></a>
                                        <?php } ?>
                                    </div> 
                                </div>
                            </div> 
                            <div class="col-lg-12 padding0">
                                <div class="col-lg-6"> 
                                    <div class="form-group">
                                        <label class="control-label" for="driving_license">Driving License:</label>
                                        <?php echo form_upload("driving_license", '', "id='driving_license' accept='image/*'"); ?> 
                                        <?php if (isset($data->driving_license) && $data->driving_license != "") { ?>
                                            <a href="<?php echo site_url('companies/download_doc/' . $data->driving_license); ?>"><?php echo $data->driving_license; ?></a>
                                        <?php } ?>
                                    </div> 
                                </div>
                                <div class="col-lg-6"> 
                                    <div class="form-group">
                                        <label class="control-label" for="other_documents">Other Documents:</label>
                                        <?php echo form_upload("other_documents[]", '', "id='other_documents' multiple='multiple' accept='image/*'"); ?> 
                                        <?php
                                        if (isset($data->other_documents) && $data->other_documents != "") {
                                            $other_documents = explode(',', $data->other_documents);
                                            foreach ($other_documents as $doc) {
                                                ?>
                                                <small class="label label-danger other-doc-label">
                                                    <a href="<?php echo site_url('companies/download_doc/' . $doc); ?>" class="text-white">
                                                        <i class="fa fa-file-image-o"></i> <?php echo $doc; ?> 
                                                    </a> 
                                                    <a href="<?php echo site_url('companies/delete_doc/' . $doc); ?>" data-id="<?php echo $data->id; ?>" class="text-white delete_doc"><i class="fa fa-remove"></i></a>
                                                </small>&nbsp;
                                                <?php
                                            }
                                        }
                                        ?>  
                                    </div> 
                                </div> 
                            </div>


                            <div class="col-lg-12 padding0">
                                <div class="col-lg-12">
                                    <div class="pull-right">  
                                        <button type="button" class="btn btn-default" onclick="show_tab('#company_tab li:nth-child(1) a')">Previous</button>
                                        <button type="button" class="btn btn-primary" onclick="show_tab('#company_tab li:nth-child(3) a')">Next</button>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </div> 
                </div>
                <!-- /.tab-pane -->
                <div class="tab-pane" id="tab_3"> 
                    <div class="row"> 
                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('lead_limit') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="lead_limit">Lead Limit(Per Day)</label>
                                    <?php echo form_input("lead_limit", set_value("lead_limit", isset($data->lead_limit) ? $data->lead_limit : "", false), "id='lead_limit' class='form-control'"); ?>
                                    <?php echo form_error('lead_limit'); ?>
                                </div>
                            </div> 
                        </div>
                        <div class="col-lg-12 padding0">
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('servicetypes_id') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="servicetypes_id">Service</label> 
                                    <?php echo form_dropdown('servicetypes_id', $servicetypes_options, set_value("servicetypes_id", isset($data->servicetypes_id) ? $data->servicetypes_id : "", false), 'class="form-control select2dropdown" id="servicetypes_id" style="width:100%;"'); ?> 
                                    <?php echo form_error('servicetypes_id'); ?>
                                </div>
                            </div> 

                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('services[]') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="services">Sub Service(s)</label> 
                                    <?php echo form_dropdown('services[]', isset($services_options) ? $services_options : '', set_value("services[]", isset($company_services) ? $company_services : '', false), 'class="form-control" multiple="multiple" id="services" style="width:100%;"'); ?> 
                                    <?php echo form_error('services[]'); ?>
                                </div>
                            </div>  
                        </div> 
                        <div class="col-lg-12 padding0 clonecities"> 
                            <div class="col-lg-6">
                                <div class="form-group <?php echo form_error('cities_id[0]') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="cities_id">Select City</label> 
                                    <?php echo form_dropdown('cities_id[0]', $cities_options, set_value("cities_id[0]"), 'class="form-control select2dropdown cities_id" id="cities_id" style="width:100%;"'); ?> 
                                    <?php echo form_error('cities_id[0]'); ?>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group sub_city_c <?php echo form_error('sub_cities[]') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="sub_cities">Sub Cities(s)</label> 
                                    <?php echo form_dropdown('sub_cities[0][]', '', set_value("sub_cities[]"), 'class="form-control sub_cities" multiple="multiple" id="sub_cities" style="width:100%;"'); ?> 
                                    <?php echo form_error('sub_cities[0][]'); ?> 
                                </div>
                                <button class="btn btn-success add-more-cities" type="button"><i class="fa fa-plus"></i> </button>
                            </div>  
                        </div>  
                        <div class="more_cities">
                            <?php if (!empty($company_cities)) { ?>
                                <?php foreach ($company_cities as $key => $city_id): ?>
                                    <div class="col-lg-12 padding0 clonecities"> 
                                        <div class="col-lg-6">
                                            <div class="form-group <?php echo form_error('cities_id[' . ($key + 1) . ']') != "" ? 'has-error' : ''; ?>">
                                                <label class="control-label" for="cities_id_<?php echo $key; ?>">Select City</label> 
                                                <?php echo form_dropdown('cities_id[' . ($key + 1) . ']', $cities_options, set_value('cities_id[' . ($key + 1) . ']', $city_id, false), 'class="form-control select2dropdown cities_id" id="cities_id_' . $key . '" style="width:100%;"'); ?> 
                                                <?php echo form_error('cities_id[' . ($key + 1) . ']'); ?>
                                            </div>
                                        </div>
                                        <?php
                                        $sub_cities_options = $this->sub_city->sub_cities_options($city_id); 
                                        $subcities = $this->company->get_company_sub_cities_ids($data->id, $city_id); 
                                        ?> 
                                        <div class="col-lg-6">
                                            <div class="form-group sub_city_c <?php echo form_error('sub_cities[' . ($key + 1) . '][]') != "" ? 'has-error' : ''; ?>">
                                                <label class="control-label" for="sub_cities_<?php echo $key; ?>">Sub Cities(s)</label> 
                                                <?php echo form_dropdown('sub_cities[' . ($key + 1) . '][]', $sub_cities_options, set_value('sub_cities[' . ($key + 1) . '][]', isset($subcities) ? $subcities : '', false), 'class="form-control sub_cities" multiple="multiple" id="sub_cities_' . $key . '" style="width:100%;"'); ?> 
                                                <?php echo form_error('sub_cities[' . ($key + 1) . '][]'); ?> 
                                            </div>
                                            <button class="btn btn-danger remove-cities" type="button"><i class="fa fa-minus"></i> </button>
                                        </div>  
                                    </div> 
                                <?php endforeach; ?>
                            <?php } ?>
                        </div>

                        <div class="col-lg-12 padding0">
                            <div class="col-lg-12">
                                <div class="pull-right">  
                                    <?php echo form_hidden('id', set_value('id', isset($data->id) ? $data->id : "")); ?> 
                                    <button type="button" class="btn btn-default" onclick="show_tab('#company_tab li:nth-child(2) a')">Previous</button>
                                    <button type="submit" class="btn btn-primary">Finish</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.tab-pane --> 

            </div>
            <!-- /.tab-content -->

        </div>
        <?php echo form_close(); ?>
    </div>
    <!-- /.col-lg-12 padding0 -->
</div>
<!-- /.row -->  

<script type="text/javascript">
    $(document).ready(function () {
        var _key = parseInt($('.clonecities').length) - 1;
        $('.add-more-cities').on('click', function () {
            var clone = $(this).closest('.clonecities').clone();
            clone.find('.add-more-cities').addClass('remove-cities').removeClass('add-more-cities');
            clone.find('.fa-plus').addClass('fa-minus').removeClass('fa-plus');
            clone.find('.btn-success').addClass('btn-danger').removeClass('btn-success');
            clone.find('#cities_id').attr('id', 'cities_id_' + _key);
            clone.find('#sub_cities').attr('id', 'sub_cities_' + _key);
            clone.find('[for="cities_id"]').attr('for', 'cities_id_' + _key);
            clone.find('[for="sub_cities"]').attr('for', 'sub_cities_' + _key);
            clone.find('[name="cities_id[0]"]').attr('name', 'cities_id[' + (_key + 1) + ']');
            clone.find('[name="sub_cities[0][]"]').attr('name', 'sub_cities[' + (_key + 1) + '][]');
            clone.find('.select2-container').remove();
            clone.appendTo('.more_cities');
            $("#sub_cities_" + _key).select2({tags: false});
            $('.select2dropdown').select2();
            _key++;
        });
        $(document).on('click', '.remove-cities', function () {
            $(this).closest('.clonecities').remove();
        });



        $("#services,.sub_cities").select2({
            tags: false
        });
        $('#company_tab li:nth-child(3) a').tab('show');
        function show_tab(element) {
            $(element).tab('show');
        }
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

        $(document).on('select2:select', '.cities_id', function (e) {
            var _this = $(this);
            $.ajax({
                url: '<?php echo site_url('companies/ajax_getsubcities'); ?>',
                type: "POST",
                dataType: "json",
                data: {cities_id: _this.val()},
                success: function (response) {
                    if (response.result) {
                        _this.closest('.clonecities').find('.sub_cities').select2('destroy').empty().select2({data: response.result});
                    }
                },
                error: function (jqXHR, exception) {
                    showMessage('error', {message: 'Uncaught Error.\n' + jqXHR.responseText});
                }
            });

        });
        $(document).on('click', 'a.delete_doc', function (e) {
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
                            _this.closest('small').remove();
                            showMessage('success', {message: response.success});
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
    });

    var placeSearch, autocomplete;
    var componentForm = {
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
    };

    function initAutocomplete() {
        autocomplete = new google.maps.places.Autocomplete((document.getElementById('location')), {types: ['geocode']});
        autocomplete.addListener('place_changed', fillInAddress);
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