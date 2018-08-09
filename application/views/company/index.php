<div class="row">
    <div class="col-xs-12"> 
        <div class="box">
            <div class="box-header">
                <i class="fa fa-building"></i> 
                <h3 class="box-title"><?php echo isset($pageHeading) ? $pageHeading : '&nbsp;'; ?></h3>
                <div class="box-tools pull-right">
                    <?php echo form_open('companies', ['method' => 'get']); ?>    
                    <div class="btn-group" data-toggle="btn-toggle">
                        <?php if (is_allow_action('company-add')) { ?>
                            <a href="<?php echo site_url('companies/manage'); ?>" class="btn btn-primary btn-sm add_new_item"><i class="fa fa-plus"></i> Add New Company </a>
                        <?php } ?>  
                        <div class="form-group pull-left"> 
                            <div class="input-group">
                                <button type="button" class="btn btn-default pull-right" id="daterange-btn">
                                    <span>
                                        <i class="fa fa-calendar"></i> Select Date Range
                                    </span>
                                    <i class="fa fa-caret-down"></i>
                                </button>
                            </div>
                        </div> 
                        <?php
                        echo form_hidden('download', 'report');
                        echo form_hidden('datefrom');
                        echo form_hidden('dateto');
                        ?>
                        <button type="submit" class="btn btn-default btn-sm"><i class="fa fa-download"></i> Export CSV</button>
                    </div>
                    <?php echo form_close(); ?>
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
                            <th>Lead Balance</th>
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
                                    <td><?php
                                        $services = $this->company->get_company_services($row->id);
                                        echo empty($services) ? '' : implode(',', $services);
                                        ?> </td>
                                    <td>
                                        <?php
                                        $cities = $this->company->get_company_cities($row->id);
                                        echo empty($cities) ? '' : implode(',', $cities);
                                        ?> 
                                    </td>
                                    <td><?php echo $this->company->get_company_lead_balance($row->id); ?></td>
                                    <td><?php echo date(DATE_FORMATE, strtotime($row->created)); ?></td>
                                    <td>
                                        <?php echo $this->layout->element('element/_module_status', array('status' => $row->is_active, 'id' => $row->id, 'url' => "companies/changestatus", 'permissionKey' => 'company-status'), true); ?>
                                    </td>
                                    <td class="action-link">  
                                        <?php echo $this->layout->element('element/_module_action', array('id' => $row->id, 'editUrl' => "companies/manage/$row->id", 'viewUrl' => "companies/view/$row->id", 'addPackageUrl' => "companies/manage_package/$row->id", 'editPermissionKey' => 'company-edit', 'deleteUrl' => 'companies/delete', 'deletePermissionKey' => 'company-delete'), true); ?>
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
    var datatbl = datatable_init([0, 8], [[1, 'asc']], DEFAULT_PAGING, 1);
</script>