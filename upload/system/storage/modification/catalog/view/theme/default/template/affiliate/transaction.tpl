<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"> <?php echo $breadcrumb['text']; ?> </a> </li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <p><?php echo $text_balance; ?> <strong><?php echo $balance; ?></strong>.</p>


	<?php /* //+mod by yp start */ ?>
	<p><?php echo $text_total_earnings; ?> <strong><?php echo $total_earnings; ?></strong>.</p>
	<?php if($sub_affiliates) { ?>
	<?php
		if($show_downline) { ?>
	<div>		
	<a href="<?php echo $link_affiliate_downline; ?>"><?php echo $text_affiliate_downline; ?></a></div>
	<?php } ?>	
	<div><a href="javascript:;" onclick="javascript:$('#view_subs_table').toggle();" id="view_subs_link"><?php echo $text_view_subs;?></a></div>
	<div class="table-responsive" id="view_subs_table" style="display:none;">
	<table class="table table-striped table-bordered table-hover">
    <thead>
      <tr>
        <td class="text-right"><?php echo $column_level; ?></td>
        <td class="text-left"><?php echo $column_num_affs; ?></td>
	  </tr>
	</thead>
	<tbody>
		<?php foreach($sub_affiliates as $_sub_aff) {?>
		<tr>
			<td class="text-right"><?php echo $_sub_aff['level'];?></td>
			<td class="text-left"><?php echo $_sub_aff['num'];?></td>
		</tr>
		<?php } ?>
	</tbody>
	</table>
	</div>
	<?php } 
	/* //+mod by yp end */ ?>
	


      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td class="text-left"><?php echo $column_description; ?></td>
              <td class="text-right"><?php echo $column_amount; ?></td>
            </tr>
          </thead>
          <tbody>
            <?php if ($transactions) { ?>
            <?php foreach ($transactions  as $transaction) { ?>
            <tr>
              <td class="text-left"><?php echo $transaction['date_added']; ?></td>
              <td class="text-left"><?php echo $transaction['description']; ?></td>
              <td class="text-right"><?php echo $transaction['amount']; ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="text-center" colspan="5"><?php echo $text_empty; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
	
			
<?php
	//+mod by yp start
	if($accc_allow_funds_transfer) {?>
<form method="post" action="<?php echo $action_funds_transfer;?>" id="funds_transfer_form" class="form-inline">	
  <div class="form-group">
	<label for="funds_transfer_amount"><?php echo $entry_funds_transfer_input;?></label>
	<?php echo $symbol_left;?><input type="text" name="amount" id="funds_transfer_amount" class="form-control" /><?php echo $symbol_right;?> 
	<button type="button" class="btn btn-primary" id="funds_transfer_submit" data-loading-text="<?php echo $text_loading; ?>"><?php echo $button_funds_transfer;?></button>
	<div id="funds_transfer_error" style="display:none;"></div>
	<div class="text-info" id="funds_transfer_message" style="display:none;"></div>
  </div>
</form>
<?php }
	//+mod by yp end
?>	
			

      <div class="text-right"><?php echo $pagination; ?></div>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
	
			
<?php
	//+mod by yp start
	if($accc_allow_funds_transfer) {?>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#funds_transfer_error').addClass('text-danger');
	var _use_multiplier = <?php echo ($use_multiplier ? 'true' : 'false');?>;
	var _balance = <?php echo $balance_raw;?>;
	var _error_message = '<?php echo $error_invalid_transfer_amount_js;?>';
	var _credit_message = '<?php echo $credit_amount_message;?>';	
	var _multiplier = <?php echo $transfer_multiplier;?>;

	$(document).on("change blur keyup mouseup", '#funds_transfer_amount', function() {
		var _v = $(this).val();
		if(_v.length < 1) {
			$('#funds_transfer_message').html('');
			$('#funds_transfer_error').html('');
			return;
		}
		if(!/^\d+(?:\.\d+)?$/.test(_v) || (parseFloat(_v) - _balance) > 0.005) {
			$('#funds_transfer_message').hide();
			$('#funds_transfer_error').html(_error_message);			
			$('#funds_transfer_error').show();
			return;
		}
		if(_use_multiplier) {
			var _msg = _credit_message.replace('%s', '<?php echo $symbol_left;?>'+(parseInt(Math.round(parseFloat(_v) * _multiplier * 100)) / 100)+'<?php echo $symbol_right;?>');
			$('#funds_transfer_error').hide();
			$('#funds_transfer_message').html(_msg);
			$('#funds_transfer_message').show();
			return;
		}
		$('#funds_transfer_message').html('');
		$('#funds_transfer_error').html('');
	});
	
	$('#funds_transfer_submit').click(function() {
		var _v = $('#funds_transfer_amount').val();
		if(!/^\d+(?:\.\d+)?$/.test(_v) || (parseFloat(_v) - _balance) > 0.005) {
			$('#funds_transfer_message').hide();
			$('#funds_transfer_error').html(_error_message);
			$('#funds_transfer_error').show();			
			return;
		}
		$('#funds_transfer_form').submit();	
	});
});
//-->
</script>
<?php }
	//+mod by yp end
?>			


<?php echo $footer; ?>