<div class="row">
    <div class="col-xs-12"> 
        <div class="box box-info"> 
            <!-- /.box-header -->
            <div class="box-body"> 
                <?php if (!empty($data)) { ?> 
                    <table class="table table-bordered table-striped"> 
                        <tbody> 
                            <tr>
                                <th>Portal Name</th>
                                <td colspan="4"><?php echo $data->portal_name; ?></td>
                            </tr>
                            <tr>
                                <th>Name</th>
                                <td colspan="4"><?php echo $data->name; ?></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td colspan="4"><?php echo $data->email; ?></td>
                            </tr>
                            <tr>
                                <th>Location</th>
                                <td colspan="4"><?php echo $data->location; ?></td>
                            </tr>

                            <tr>
                                <th>Phone Number</th>
                                <td colspan="4"><?php echo $data->phone_number; ?></td>
                            </tr>
                            <tr>
                                <th>Date</th>
                                <td colspan="4"><?php echo $data->date; ?></td>
                            </tr>
                            <tr>
                                <th>Message</th>
                                <td colspan="4"><?php echo $data->message; ?></td>
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