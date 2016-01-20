<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bar-chart"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well">
          <div class="row">
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_start" value="<?php echo $filter_date_start; ?>" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" id="input-date-start" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <label class="control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_end" value="<?php echo $filter_date_end; ?>" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" id="input-date-end" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <div class="table-responsive">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $column_affiliate; ?></td>
                <td class="text-left"><?php echo $column_email; ?></td>
                <td class="text-left"><?php echo $column_status; ?></td>
                <td class="text-right"><?php echo $column_current_balance; ?></td>
                          
                <td class="text-right"><?php echo $column_total; ?></td>

<td class="text-right"><?php echo $column_total_sales; ?></td><td class="text-right"><?php echo $column_orders; ?></td>			
			
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($affiliates) { ?>
              <?php foreach ($affiliates as $affiliate) { ?>
              <tr>
                <td class="text-left">
<?php echo $affiliate['affiliate']; ?>
						<?php if(!$payout_accounts[$affiliate['affiliate_id']]) {?>
						<br /><span style="font-weight:bold;color:#e11;"><?php echo $text_no_payout_account;?></span>
						<?php }?>
</td>
                <td class="text-left"><?php echo $affiliate['email']; ?></td>
                <td class="text-left"><?php echo $affiliate['status']; ?></td>
                <td class="text-right"><?php echo $affiliate['commission']; ?></td>

        <td class="text-right"><?php echo $affiliate['total_earnings']; ?></td><td class="text-right"><?php echo $affiliate['total'];?></td><?php /* //+mod by yp */ ?>

                <td class="text-right"><?php echo $affiliate['orders']; ?></td>
                          
                <td class="text-right"><a href="<?php echo $affiliate['edit']; ?>" target="_blank" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/affiliate&token=<?php echo $token; ?>';
	
	var filter_date_start = $('input[name=\'filter_date_start\']').val();
	
	if (filter_date_start) {
		url += '&filter_date_start=' + encodeURIComponent(filter_date_start);
	}

	var filter_date_end = $('input[name=\'filter_date_end\']').val();
	
	if (filter_date_end) {
		url += '&filter_date_end=' + encodeURIComponent(filter_date_end);
	}
	

			
	<?php /* //+mod by yp start */ ?>
	var filter_balance = $('input[name=\'filter_balance\']').val();

	if (filter_balance > 0) {
		url += '&filter_balance=' + encodeURIComponent(filter_balance);
	}
	<?php /* //+mod by yp end */ ?>
	

	location = url;
});
//--></script> 
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>

			
<?php /* //+mod by yp start */ ?>			
<script type="text/javascript"><!--		
$(document).ready(function() {
	var _html = '<div class="col-sm-6"><div class="form-group"><label class="control-label" for="input-balance"><?php echo mta_jsstr($entry_current_balance); ?></label><div><input type="text" name="filter_balance" value="<?php echo $filter_balance;?>" placeholder="<?php echo mta_jsstr($entry_current_balance); ?>" id="input-balance" class="form-control" /></div></div></div>';
	$('#button-filter').parent().parent().append(_html);
});
//--></script>
<?php /* //+mod by yp start */ ?>


<?php echo $footer; ?>