<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-bug"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="pull-right text-danger">
                    <i class="fa fa-file"></i> <?php echo $filename; ?> 
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr> 
                            <td>Sr.</td> 
                            <th>Type</th>                            
                            <th>Message</th>      
                            <th>Date</th> 
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($result)) { ?>
                            <?php foreach ($result as $key => $row): ?>
                                <tr>  
                                    <td><?php echo $key + 1; ?></td>                                    
                                    <td><?php echo $row['level']; ?></td>                                   
                                    <td><?php echo $row['message']; ?></td>  
                                    <td><?php echo $row['date']; ?></td>  
                                </tr> 
                            <?php endforeach; ?>
                        <?php } ?> 
                    </tbody> 
                </table>  
            </div>
            <!-- /.box-body --> 
        </div>
        <!-- /.box -->
    </div>
    <!-- /.col -->
</div> 

<script type="text/javascript">
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging
     4 show sr. number or not
     */
    var datatbl = datatable_init([0], [[3, 'DESC']], 50, 1);
</script>