<?php echo form_open('companies/pay_package_amount', array("id" => "pay-package-amount-form", "method" => "post")); ?>
<div class="pull-right" style="margin-bottom: 8px;">  
    <div class="input-group input-group-sm" style="width: 200px;">  
        <?php echo form_input("amount", '', "class='form-control pull-right' placeholder='Pay remainig amount'"); ?>
        <div class="input-group-btn">
            <button type="submit" class="btn btn-primary">Pay</button>
        </div>
    </div> 
</div>
<table class="table table-bordered">
    <tbody>
        <tr>
            <th style="width: 10px">#</th>
            <th>Date</th> 
            <th>Amount</th> '
            <th>Payment Status</th>
            <?php if (is_allow_admin(FALSE) === TRUE) { ?>
                <th>Action</th>
            <?php } ?>
        </tr>
        <?php $amount_paid = 0; ?>
        <?php if (!empty($result)) { ?>
            <?php foreach ($result as $key => $row) { ?>
                <?php
                if ($row->approved == 1) {
                    $amount_paid = $amount_paid + $row->amount;
                }
                ?>
                <tr>
                    <td><?php echo $key + 1; ?>.</td> 
                    <td><?php echo date(DATE_FORMATE, strtotime($row->created)); ?></td> 
                    <td><?php echo $row->amount; ?></td>
                    <td>
                        <?php if ($row->approved == 1) { ?>
                            <span class="text-success">Approved</span>
                        <?php } else { ?>
                            <?php if (is_allow_admin(FALSE) === TRUE) { ?>
                                <a class="label label-danger approve-payment-status" data-id="<?php echo $row->id; ?>" data-status="1" href="<?php echo site_url('companies/approve_package_amount'); ?>">Approve</a>
                            <?php } else { ?>
                                <span class="text-warning">Pending</span>
                            <?php } ?>
                        <?php } ?>
                    </td>
                    <?php if (is_allow_admin(FALSE) === TRUE) { ?>
                        <td>
                            <div class="action-link">
                                <a href="<?php echo site_url('companies/delete_package_amount'); ?>" data-id="<?php echo $row->id; ?>" class="btn btn-block btn-danger btn-xs delete-package-payment"  data-toggle="tooltip" title="" data-original-title="Delete"> <span class="fa fa-trash-o"></span> </a>
                            </div>      
                        </td>
                    <?php } ?>
                </tr>  
            <?php } ?>
        <?php } ?>
    </tbody>
</table>  
<div class="clearfix"></div>
<div>
    Total Package Amount : <span class="text-green"><?php echo $company_package->package_amount; ?> &#8377;</span> | 
    Total Paid Amount : <span class="text-red"><?php echo $amount_paid; ?> &#8377;</span> |
    Due Amount : <span class="text-red"><?php echo $dueAmount = $company_package->package_amount - $amount_paid; ?> &#8377;</span>
</div> 
<?php
echo form_hidden('due_amount', $dueAmount);
echo form_hidden('package_amount', $company_package->package_amount);
echo form_hidden('package_lead', $company_package->package_lead);
echo form_hidden('companies_package_id', $row->companies_package_id);
?>
<?php echo form_close(); ?> 