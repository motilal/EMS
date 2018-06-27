<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-database"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3> 
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle"> 
                        <a href="<?php echo site_url('database_backups/create_db_backup'); ?>" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Create Database Backup </a>
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body table-responsive">
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr>
                            <td>Sr.</td>
                            <th>File Name</th>
                            <th>Created</th>
                            <th>File Size</th> 
                            <th width="10%">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (!empty($backupFiles)) { ?>
                            <?php foreach ($backupFiles as $key => $row): ?>
                                <?php $encfile = base64_encode($row['filename']); ?>
                                <tr>
                                    <td><?php echo $key + 1; ?></td>
                                    <td><?php echo $row['filename']; ?></td>
                                    <td><?php echo date(DATETIME_FORMATE, strtotime($row['created'])); ?></td>
                                    <td data-order='<?php echo $row['filesize']; ?>'><?php echo human_filesize($row['filesize']); ?></td> 
                                    <td> 
                                        <?php echo $this->layout->element('element/_module_action', array('id' => $encfile, 'deleteUrl' => "database_backups/delete", 'downloadUrl' => "database_backups/download/$encfile"), true); ?>
                                    </td>  
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

<script>
    /*
     params 
     1 sorting remove from colomns
     2 default sort order of colomn set default []
     3 default paging
     4 show sr. number or not
     */
    var datatbl = datatable_init([0, 4], [[1, 'desc']], DEFAULT_PAGING, 1);
</script>