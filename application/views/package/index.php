<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-users"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-package" data-toggle="btn-toggle">
                        <?php if (is_allow_action('package-add')) { ?>
                            <a href="<?php echo site_url('packages/manage'); ?>" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Package </a>
                        <?php } ?> 
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body"> 
                <div class="table-responsive"> 
                    <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                        <thead>
                            <tr>
                                <td>Sr.</td>
                                <th>Name</th> 
                                <th>Service</th> 
                                <th>Sub Service(s)</th>
                                <th>Duration</th> 
                                <th>Amount</th>
                                <th>Leads</th>
                                <th>Type</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php $package_type = $this->config->item('package_type'); ?>
                            <?php if ($result->num_rows() > 0) { ?>
                                <?php foreach ($result->result() as $key => $row): ?> 
                                    <tr id="row_<?php echo $row->id; ?>">
                                        <td><?php echo $key + 1; ?></td>
                                        <td><?php echo $row->name; ?></td>
                                        <td><?php echo $row->service_name; ?></td> 
                                        <td><?php
                                            $services = $this->package->get_package_services($row->id);
                                            echo empty($services) ? '' : implode(',', $services);
                                            ?> 
                                        </td>
                                        <td><?php echo $row->duration; ?></td>
                                        <td><?php echo $row->amount; ?></td>
                                        <td><?php echo $row->no_of_leads; ?></td>
                                        <td><?php echo $row->package_type_name; ?></td>
                                        <td>
                                            <?php echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "packages/changestatus", 'permissionKey' => "package-status"), true); ?>
                                        </td>
                                        <td>  
                                            <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => "packages/manage/$row->id", 'viewUrl' => "packages/view/$row->id", 'deleteUrl' => 'packages/delete', 'editPermissionKey' => 'package-edit', 'deletePermissionKey' => 'package-delete'), true); ?>
                                        </td>  
                                    </tr>
                                <?php endforeach; ?>
                            <?php } ?> 
                        </tbody> 
                    </table>
                </div>
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
    var datatbl = datatable_init([0, 9], [[1, 'asc']], DEFAULT_PAGING, 1);
</script>