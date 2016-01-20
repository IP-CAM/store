<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
      <form id="form-affiliate-payout" onsubmit="javascript:return false;" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-action"><?php echo $entry_transaction_type; ?></label>
            <div class="col-sm-10">
              <select name="action" id="input-action" class="form-control">
				<option value="set"><?php echo $text_type_set; ?></option>
				<option value="sub"><?php echo $text_type_subtract; ?></option>
              </select>
            </div>
          </div>	  
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-amount"><?php echo $entry_amount; ?></label>
            <div class="col-sm-10">
			  <input type="text" name="amount" id="input-amount" placeholder="<?php echo $entry_amount; ?>" value="" class="form-control" />
            </div>
          </div>	  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
            <div class="col-sm-10">
			  <input type="text" name="description" id="input-description" placeholder="<?php echo $entry_description; ?>" value="" class="form-control" />
            </div>
          </div>	  		  
         <div class="form-group">
            <label class="col-sm-2 control-label" for="input-higher"><?php echo $entry_higher; ?></label>
            <div class="col-sm-10">
			  <input type="text" name="higher" id="input-higher" placeholder="<?php echo $entry_higher; ?>" value="" class="form-control" />
            </div>
          </div>
         <div class="form-group">
            <label class="col-sm-2 control-label" for="input-lower"><?php echo $entry_lower; ?></label>
            <div class="col-sm-10">
			  <input type="text" name="lower" id="input-lower" placeholder="<?php echo $entry_lower; ?>" value="" class="form-control" />
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label"><?php echo $entry_payment; ?></label>
            <div class="col-sm-10">
              <div class="checkbox">
                <label>
				  <input type="checkbox" id="pm_all" /><?php echo $text_all; ?>
                </label>
              </div>
			  <?php foreach($payment_methods as $method => $method_name) { ?>
              <div class="checkbox">
                <label>			  
				  <input type="checkbox" name="payment_methods[]" class="payment_methods" value="<?php echo $method; ?>" /><?php echo $method_name; ?>
                </label>
              </div>				  
			  <?php } ?>              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-exclude-blank"><?php echo $entry_exclude_blank; ?></label>
            <div class="col-sm-10">
              <select name="exclude_blank" id="input-exclude-blank" class="form-control">
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
              </select>
            </div>
          </div>	  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-send-emails"><?php echo $entry_send_emails; ?></label>
            <div class="col-sm-10">
              <select name="send_emails" id="input-send-emails" class="form-control">
				<option value="0"><?php echo $text_no; ?></option>			  
				<option value="1"><?php echo $text_yes; ?></option>
              </select>
            </div>
          </div>	
      </form>
  <p>
	<button type="button" class="btn btn-info" data-loading-text="<?php echo $text_loading; ?>" id="button_prepare"><?php echo $button_prepare; ?></button></p>
  <div style="display:none;" id="error_no_data_div"><?php echo $error_no_data; ?></div>
  <div style="display:none;" id="error_unknown_div"><?php echo $error_unknown; ?></div>  
  <div style="display:none;" id="error_amount_div"><?php echo $error_amount; ?></div>  
  <div style="display:none;" id="prepare_div">
	<div>
	<?php echo $text_num_affs;?> <span id="num_affs_span"></span><br />
	<?php echo $text_total;?> <span id="total_span"></span><br />
	</div>
	<div id="pmp_div" class="well" style="display:none">	  
		<h4><?php echo $text_paypal_mass_pay; ?></h4>
		<div>
		<?php echo $text_num_affs_pmp;?> <span id="num_affs_span_pmp"></span></div>
		<form method="post" enctype="multipart/form-data" action="<?php echo $action_pmp; ?>" target="_blank" id="pmp_form" class="form-horizontal">
			<input type="hidden" name="page" value="1" id="pmp_page" />
			<input type="hidden" name="data" value="" id="pmp_data" />
			<div class="form-group">
				<input type="text" name="pmp_description" placeholder="<?php echo $entry_paypal_mass_pay_description; ?>" size="100" class="form-control" />
			</div>
			<div id="pmp_links"></div><br />
		</form>
		<div id="pmp_warning"><?php echo $text_paypal_mass_pay_warning; ?></div>
    </div>
	
	<div id="csv_div" class="well" style="display:none">	  
		<h4><?php echo $text_csv; ?></h4>
		<form method="post" enctype="multipart/form-data" action="<?php echo $action_csv; ?>" target="_blank" id="csv_form" class="form-horizontal">
			<input type="hidden" name="data" value="" id="csv_data" />
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-fsep"><?php echo $entry_csv_fsep; ?></label>
				<div class="col-sm-10">
				  <select name="fsep" class="form-control" id="input-fsep">
					<option value="t"><?php echo $option_fsep_tab; ?></option>
					<option value="c"><?php echo $option_fsep_comma; ?></option>
				  </select>
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-2 control-label" for="input-lsep"><?php echo $entry_csv_lsep; ?></label>
				<div class="col-sm-10">
				  <select name="lsep" class="form-control" id="input-lsep">
					<option value="m"><?php echo $option_lsep_mac; ?></option>
					<option value="w"><?php echo $option_lsep_windows; ?></option>
				  </select>
				</div>
			</div>
			<div>
				<p><button class="btn btn-primary" type="submit"><?php echo $text_export; ?></button></p>			
			</div><br />
		</form>
		<div id="csv_warning"><?php echo $text_csv_warning; ?></div>
    </div>	
	
	<div id="description" style="display:none;"></div>
	<div id="data_to_confirm" style="display:none;"></div>
	<p>
		<button type="button" class="btn btn-primary" data-loading-text="<?php echo $text_loading; ?>" id="button_confirm"><?php echo $button_confirm; ?></button>	
	</p>
  </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {

var _show_error = function(_id) {
	if(!$('#error_'+_id).hasClass('text-danger')) $('#error_'+_id).addClass('text-danger');
	$('#error_'+_id).show();
}

$('#button_prepare').on('click', function() {	
	$('.text-danger').hide();		
	$('#prepare_div').hide();
	if(!/^\d+(?:\.\d+)?$/.test($('input[name="amount"]').val())) {
		_show_error('amount_div');
		return;
	}	
	$.ajax({
		url: '<?php echo $action_prepare; ?>', 
		data: $('#form-affiliate-payout').serialize(), 
		type: 'post',		
		dataType: 'json',
		beforeSend: function() {			
			$('#button_prepare').button('loading');
			$('#pmp_div').hide();
			$('#csv_div').hide();
		},
		complete: function() {
			$('#button_prepare').button('reset');
		},		
		success: function(_r) {		
			if(_r.num_affs && parseInt(_r.num_affs) > 0 && _r.total) {
				$('#description').text($('input[name="description"]').val());
				$('#data_to_confirm').text(_r.data);
				$('#num_affs_span').text(_r.num_affs);
				$('#total_span').text(_r.total);
				if(_r.num_pmp > 0) {
					$('#pmp_data').val(_r.data);
					$('#num_affs_span_pmp').text(_r.num_pmp);
					$('#pmp_links').html('');
					for(var _i = 1; _i <= _r.num_pmp_pages; _i++) {
						var pmp_link_text = '<?php echo $text_export; ?>';
						if(_r.num_pmp_pages > 1) pmp_link_text += ' <?php echo $text_page; ?> '+_i;
						$('#pmp_links').append('<p><button class="btn btn-primary" type="button" onclick="javascript:$(\'#pmp_page\').val(\''+_i+'\');$(\'#pmp_form\').submit();">'+pmp_link_text+'</button></p>');
					}
					if(!$('#pmp_warning').hasClass('text-danger')) $('#pmp_warning').addClass('text-danger');
					$('#pmp_warning').show();
					$('#pmp_div').show();
				}
				if(_r.num_affs > 0) {
					$('#csv_data').val(_r.data);
					if(!$('#csv_warning').hasClass('text-danger')) $('#csv_warning').addClass('text-danger');
					$('#csv_warning').show();
					$('#csv_div').show();
				}				
				$('#prepare_div').show();
				return;
			}
			$('#prepare_div').hide();
			if(_r.error && _r.error == 'no_data') {
				_show_error('no_data_div');			
			} else {
				_show_error('unknown_div');
			}	
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}	
	});	
});


$('#button_confirm').on('click', function() {
	if(!confirm('<?php echo $text_confirm; ?>')) return;
	$('.text-danger').hide();
	$.ajax({
	url: '<?php echo $action_confirm; ?>', 
	data: {data : $('#data_to_confirm').text(), description : $('#description').text(), send_emails : $('[name="send_emails"]').val()}, 
	type: 'post',		
	dataType: 'json',
	beforeSend: function() {
			$('#button_confirm').button('loading');
	},
	complete: function() {
		$('#button_confirm').button('reset');
	},	
	success: function(_r) {	
		if(_r.success) {
			document.location.href = '<?php echo html_entity_decode($cancel, ENT_QUOTES, "UTF-8"); ?>';
			return;
		} 
		$('#prepare_div').hide();
		if(_r.error && _r.error == 'no_data') {
			_show_error('no_data_div');			
		} else {
			_show_error('unknown_div');
		}	
	},
	error: function(xhr, ajaxOptions, thrownError) {
		alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
	}	
	});
	
});

$('#pm_all').on('click', function() {
	if($(this).is(':checked')) $('.payment_methods').removeAttr('checked');	
});

$('.payment_methods').on('click', function() {
	if($(this).is(':checked')) $('#pm_all').removeAttr('checked');
});

$('#pm_all').trigger('click');

});
//--></script></div>
<?php echo $footer; ?>