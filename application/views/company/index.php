<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-building"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('company-add')) { ?>
                            <a href="<?php echo site_url('companies/manage'); ?>" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Company </a>
                        <?php } ?>
                        <a href="<?php echo site_url('companies?download=report'); ?>" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</a>
                    </div>
                </div>
            </div>     
            <!-- /.box-header -->
            <div class="box-body table-responsive"> 
                <table id="dataTables-grid" class="table table-bordered table-striped" width="100%">
                    <thead>
                        <tr> 
                            <td>Sr.</td>
                            <th>Name</th>
                            <th>Phone</th> 
                            <th>Service</th>  
                            <th>Cities</th> 
                            <th>Created</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if ($result->num_rows() > 0) { ?>
                            <?php foreach ($result->result() as $key => $row): ?>
                                <tr>  
                                    <td><?php echo $key + 1; ?></td>
                                    <td><?php echo $row->name; ?></td>
                                    <td>
                                        <?php echo $row->phone1; ?>
                                        <div class="hide"><?php echo json_encode($row); ?></div>
                                    </td> 
                                    <td><?php echo $row->service_name; ?></td>
                                    <td>
                                        <?php
                                        $cities = $this->company->get_company_cities($row->id);
                                        echo empty($cities) ? '' : implode(',', $cities);
                                        ?> 
                                    </td>
                                    <td><?php echo date(DATE_FORMATE, strtotime($row->created)); ?></td>
                                    <td>
                                        <?php echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "companies/changestatus", 'permissionKey' => 'page-status'), true); ?>
                                    </td>
                                    <td class="action-link">  
                                        <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => "companies/manage/$row->id", 'viewUrl' => "companies/view/$row->id", 'addPackageUrl' => "companies/manage_package/$row->id", 'editPermissionKey' => 'page-edit', 'deleteUrl' => 'companies/delete', 'deletePermissionKey' => 'page-delete'), true); ?>
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
    var datatbl = datatable_init([0, 6], [[1, 'asc']], DEFAULT_PAGING, 1);
</script>