<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <?php if (!empty($data)) { ?> 
                    <table class="table table-bordered table-striped"> 
                        <tbody>  
                            <tr>
                                <th>Company Name</th>
                                <td colspan="4"><?php echo $data->name; ?></td>
                            </tr>
                            <tr>
                                <th>Company Owner</th>
                                <td colspan="4"><?php echo $data->company_owner; ?></td>
                            </tr>
                            <tr>
                                <th>Company Address</th>
                                <td colspan="4"><?php echo $data->company_address; ?></td>
                            </tr>

                            <tr>
                                <th>Email</th>
                                <td colspan="4"><?php echo $data->email; ?></td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td colspan="4"><?php echo $data->phone1; ?></td>
                            </tr>
                            <tr>
                                <th>Alternate Phone</th>
                                <td colspan="4"><?php echo $data->phone2; ?></td>
                            </tr>
                            <tr>
                                <th>Service</th>
                                <td colspan="4"><?php echo $data->service_name; ?></td>
                            </tr>
                            <tr>
                                <th>Sub Service(s)</th>
                                <td colspan="4"><?php echo implode(',', $company_services); ?></td>
                            </tr>
                            <tr>
                                <th>GST No.</th>
                                <td colspan="4"><?php echo $data->gst_no; ?></td>
                            </tr>
                            <tr>
                                <th>Aadhar No.</th>
                                <td colspan="4"><?php echo $data->aadhar_no; ?></td>
                            </tr>
                            <tr>
                                <th>Aadhar document</th>
                                <td colspan="4">
                                    <?php if (isset($data->aadhar_doc) && $data->aadhar_doc != "") { ?>
                                        <a href="<?php echo site_url('companies/download_doc/' . $data->aadhar_doc); ?>"><?php echo $data->aadhar_doc; ?></a>
                                    <?php } ?>
                                </td>
                            </tr>
                            <tr>
                                <th>Pencard No.</th>
                                <td colspan="4"><?php echo $data->pencard_no; ?></td>
                            </tr>
                            <tr>
                                <th>Pencard document</th>
                                <td colspan="4"> 
                                    <?php if (isset($data->pencard_doc) && $data->pencard_doc != "") { ?>
                                        <a href="<?php echo site_url('companies/download_doc/' . $data->pencard_doc); ?>"><?php echo $data->pencard_doc; ?></a>
                                    <?php } ?>
                                </td>
                            </tr>
                            <tr>
                                <th>Location</th>
                                <td colspan="4"><?php echo $data->location; ?></td>
                            </tr>
                            <?php foreach ($company_cities as $key => $row): ?>
                                <tr>
                                    <th>City</th>
                                    <td colspan="4">
                                        <?php echo $key; ?>
                                    </td>
                                </tr> 
                                <tr>
                                    <th>Sub Cities</th>
                                    <td colspan="4">
                                        <?php
                                        if (!empty($row)) {
                                            echo implode(', ', $row);
                                        }
                                        ?>
                                    </td>
                                </tr> 
                            <?php endforeach; ?>

                            <tr>
                                <th>Country</th>
                                <td colspan="4"><?php echo $data->country; ?></td>
                            </tr>

                            <tr>
                                <th>State</th>
                                <td colspan="4"><?php echo $data->state; ?></td>
                            </tr>

                            <tr>
                                <th>City</th>
                                <td colspan="4"><?php echo $data->city; ?></td>
                            </tr>  

                            <tr>
                                <th>Zip Code</th>
                                <td colspan="4"><?php echo $data->zip_code; ?></td>
                            </tr>

                            <tr>
                                <th>Latitude</th>
                                <td colspan="4"><?php echo $data->latitude; ?></td>
                            </tr>

                            <tr>
                                <th>Longitude</th>
                                <td colspan="4"><?php echo $data->logitude; ?></td>
                            </tr>

                            <tr>
                                <th>Created</th>
                                <td colspan="4"><?php echo date(DATETIME_FORMATE, strtotime($data->created)); ?></td>
                            </tr>  
                            <?php if ($data->updated != ""): ?>
                                <tr>
                                    <th>Updated</th>
                                    <td colspan="4"><?php echo date(DATETIME_FORMATE, strtotime($data->updated)); ?></td>
                                </tr>  
                            <?php endif; ?>

                        </tbody>
                    </table> 

                <?php } ?> 
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->  