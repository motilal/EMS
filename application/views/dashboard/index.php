<!-- Info boxes -->
<div class="row">
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3><?php echo $total_companies; ?></h3> 
                <p>Companies</p>
            </div>
            <div class="icon">
                <i class="fa fa-building"></i>
            </div>
            <a href="<?php echo site_url('companies'); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-green">
            <div class="inner">
                <h3><?php echo $total_cities; ?></h3>
                <p>Cities</p>
            </div>
            <div class="icon">
                <i class="fa fa-institution"></i>
            </div>
            <a href="<?php echo site_url('cities'); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-yellow">
            <div class="inner">
                <h3><?php echo $total_services; ?></h3>
                <p>Services</p>
            </div>
            <div class="icon">
                <i class="fa fa-cogs"></i>
            </div>
            <a href="<?php echo site_url('services'); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-red">
            <div class="inner">
                <h3><?php echo $total_portals; ?></h3>
                <p>Portals</p>
            </div>
            <div class="icon">
                <i class="ion fa-cart"></i>
            </div>
            <a href="<?php echo site_url('companies/manage_package'); ?>" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <!-- ./col -->
</div>
<!-- /.row --> 