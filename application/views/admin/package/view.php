<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <?php if (!empty($data)) { ?> 
                    <table class="table table-bordered table-striped"> 
                        <tbody>  
                            <?php $package_types = $this->config->item('package_type'); ?>
                            <tr>
                                <th>Package Type</th>
                                <td colspan="4"><?php echo $data->package_type_name; ?></td>
                            </tr>

                            <tr>
                                <th>Package Name</th>
                                <td colspan="4"><?php echo $data->name; ?></td>
                            </tr>

                            <tr>
                                <th>Package Duration</th>
                                <td colspan="4"><?php echo $data->duration; ?> Days</td>
                            </tr>

                            <tr>
                                <th>Package Amount</th>
                                <td colspan="4"><?php echo $data->amount; ?>  &#8377;</td>
                            </tr>


                            <tr>
                                <th>No. of leads</th>
                                <td colspan="4"><?php echo $data->no_of_leads; ?></td>
                            </tr>


                            <tr>
                                <th>Package Desctiption</th>
                                <td colspan="4"><?php echo $data->description; ?></td>
                            </tr>

                            <tr>
                                <th>Services</th>
                                <td colspan="4"><?php echo $data->service_name; ?></td>
                            </tr>

                            <tr>
                                <th>Sub Services</th>
                                <td colspan="4"><?php echo implode(',', $package_services); ?></td>
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