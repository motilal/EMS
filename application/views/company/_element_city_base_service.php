<div class="col-lg-12 clonecities">
    <div class="box box-default">
        <div class="box-header"> 
            <h3 class="box-title">City Base Services</h3> 
            <div class="pull-right box-tools">
                <button type="button" class="btn btn-success btn-sm add-more-cities" title="Add More City">
                    <i class="fa fa-plus"></i>
                </button>
            </div> 
        </div>
        <div class="box-body"> 
            <div class="col-lg-6 padding0 citydiv"> 
                <div class="col-lg-12">
                    <div class="form-group <?php echo form_error('cities_id[0]') != "" ? 'has-error' : ''; ?>">
                        <label class="control-label" for="cities_id">Source City</label> 
                        <?php echo form_dropdown('cities_id[0]', $cities_options, set_value("cities_id[0]"), 'class="form-control select2dropdown cities_id" id="cities_id" style="width:100%;"'); ?> 
                        <?php echo form_error('cities_id[0]'); ?>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group <?php echo form_error('sub_cities[]') != "" ? 'has-error' : ''; ?>">
                        <label class="control-label" for="sub_cities">Source Sub Cities(s)</label> 
                        <?php echo form_dropdown('sub_cities[0][]', '', set_value("sub_cities[]"), 'class="form-control sub_cities" multiple="multiple" id="sub_cities" style="width:100%;"'); ?> 
                        <?php echo form_error('sub_cities[0][]'); ?> 
                    </div> 
                </div>  
            </div>   
            <div class="col-lg-6 padding0 citydiv"> 
                <div class="col-lg-12">
                    <div class="form-group <?php echo form_error('dest_cities_id[0]') != "" ? 'has-error' : ''; ?>">
                        <label class="control-label" for="dest_cities_id">Destination City</label> 
                        <?php echo form_dropdown('dest_cities_id[0]', $cities_options, set_value("dest_cities_id[0]"), 'class="form-control select2dropdown cities_id" id="dest_cities_id" style="width:100%;"'); ?> 
                        <?php echo form_error('dest_cities_id[0]'); ?>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="form-group <?php echo form_error('dest_sub_cities[]') != "" ? 'has-error' : ''; ?>">
                        <label class="control-label" for="dest_sub_cities">Destination Sub Cities(s)</label> 
                        <?php echo form_dropdown('dest_sub_cities[0][]', '', set_value("dest_sub_cities[]"), 'class="form-control sub_cities" multiple="multiple" id="dest_sub_cities" style="width:100%;"'); ?> 
                        <?php echo form_error('dest_sub_cities[0][]'); ?> 
                    </div> 
                </div>  
            </div>
        </div>
    </div> 
</div>  


<div class="more_cities">
    <?php if (!empty($company_cities)) { ?>
        <?php foreach ($company_cities as $key => $row): ?> 

            <div class="col-lg-12 clonecities">
                <div class="box box-default">
                    <div class="box-header"> 
                        <h3 class="box-title">City Base Services</h3> 
                        <div class="pull-right box-tools">
                            <button type="button" class="btn btn-danger btn-sm remove-cities" title="Remove Ciry">
                                <i class="fa fa-minus"></i>
                            </button>
                        </div> 
                    </div>
                    <div class="box-body"> 
                        <div class="col-lg-6 padding0 citydiv"> 
                            <div class="col-lg-12">
                                <div class="form-group <?php echo form_error('cities_id[' . ($key + 1) . ']') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="cities_id_<?php echo $key; ?>">Source City</label> 
                                    <?php echo form_dropdown('cities_id[' . ($key + 1) . ']', $cities_options, set_value('cities_id[' . ($key + 1) . ']', $row['cities_id'], false), 'class="form-control select2dropdown cities_id" id="cities_id_' . $key . '" style="width:100%;"'); ?> 
                                    <?php echo form_error('cities_id[' . ($key + 1) . ']'); ?>
                                </div>
                            </div>
                            <?php $sub_cities_options = $this->sub_city->sub_cities_options($row['cities_id']); ?> 
                            <div class="col-lg-12">
                                <div class="form-group <?php echo form_error('sub_cities[' . ($key + 1) . '][]') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="sub_cities_<?php echo $key; ?>">Source Sub Cities(s)</label> 
                                    <?php echo form_dropdown('sub_cities[' . ($key + 1) . '][]', $sub_cities_options, set_value('sub_cities[' . ($key + 1) . '][]', isset($row['source_sub_cities']) ? $row['source_sub_cities'] : '', false), 'class="form-control sub_cities" multiple="multiple" id="sub_cities_' . $key . '" style="width:100%;"'); ?> 
                                    <?php echo form_error('sub_cities[' . ($key + 1) . '][]'); ?> 
                                </div>
                            </div>  
                        </div>   
                        <div class="col-lg-6 padding0 citydiv"> 
                            <div class="col-lg-12">
                                <div class="form-group <?php echo form_error('dest_cities_id[' . ($key + 1) . ']') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="dest_cities_id_<?php echo $key; ?>">Destination City</label> 
                                    <?php echo form_dropdown('dest_cities_id[' . ($key + 1) . ']', $cities_options, set_value('dest_cities_id[' . ($key + 1) . ']', $row['destination_cities_id'], false), 'class="form-control select2dropdown cities_id" id="dest_cities_id_' . $key . '" style="width:100%;"'); ?> 
                                    <?php echo form_error('dest_cities_id[' . ($key + 1) . ']'); ?>
                                </div>
                            </div>
                            <?php $dest_sub_cities_options = $this->sub_city->sub_cities_options($row['destination_cities_id']); ?> 
                            <div class="col-lg-12">
                                <div class="form-group <?php echo form_error('dest_sub_cities[]') != "" ? 'has-error' : ''; ?>">
                                    <label class="control-label" for="dest_sub_cities_<?php echo $key; ?>">Destination Sub Cities(s)</label> 
                                    <?php echo form_dropdown('dest_sub_cities[' . ($key + 1) . '][]', $dest_sub_cities_options, set_value('dest_sub_cities[' . ($key + 1) . '][]', isset($row['destination_sub_cities']) ? $row['destination_sub_cities'] : '', false), 'class="form-control sub_cities" multiple="multiple" id="dest_sub_cities_' . $key . '" style="width:100%;"'); ?> 
                                    <?php echo form_error('dest_sub_cities[' . ($key + 1) . '][]'); ?> 
                                </div> 
                            </div>  
                        </div>
                    </div>
                </div> 
            </div>







            <?php /*


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

             */ ?>
        <?php endforeach; ?>
    <?php } ?> 
</div>