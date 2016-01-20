<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-account-combine" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-account-combine" class="form-horizontal">
  <input type="hidden" name="account_combine_version" value="<?php echo $account_combine_version; ?>" />
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_status" id="input-status" class="form-control">
                <?php if ($account_combine_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-allow-own-aff"><span data-toggle="tooltip" title="<?php echo $help_allow_own_aff_links; ?>"><?php echo $entry_allow_own_aff_links; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_allow_own_aff" id="input-allow-own-aff" class="form-control triggers">
                <?php if ($account_combine_allow_own_aff) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 	
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-own-parent"><span data-toggle="tooltip" title="<?php echo $help_own_parent; ?>"><?php echo $entry_own_parent; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_own_parent" id="input-own-parent" class="form-control triggers">
                <?php if ($account_combine_own_parent) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 			  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-allow-funds-transfer"><span data-toggle="tooltip" title="<?php echo $help_allow_funds_transfer; ?>"><?php echo $entry_allow_funds_transfer; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_allow_funds_transfer" id="input-allow-funds-transfer" class="form-control triggers">
                <?php if ($account_combine_allow_funds_transfer) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>   
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-transfer-multiplier"><span data-toggle="tooltip" title="<?php echo $help_transfer_multiplier; ?>"><?php echo $entry_transfer_multiplier; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="account_combine_transfer_multiplier" id="input-transfer-multiplier" class="form-control" value="<?php echo $account_combine_transfer_multiplier; ?>" />
            </div>
          </div>  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-auto-credit"><span data-toggle="tooltip" title="<?php echo $help_auto_credit; ?>"><?php echo $entry_auto_credit; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_auto_credit" id="input-auto-credit" class="form-control">
                <?php if ($account_combine_auto_credit) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>    
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-customer-group"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
            <div class="col-sm-10">			
              <select name="account_combine_customer_group_id" id="input-customer-group" class="form-control">
				<option value="0"><?php echo $text_none;?></option>
				<?php foreach($customer_groups as $_cg) { ?>
				<option value="<?php echo $_cg['customer_group_id'];?>"<?php if(intval($_cg['customer_group_id']) === intval($account_combine_customer_group_id)) { ?> selected="selected"<?php } ?>><?php echo $_cg['name'];?></option>
				<?php }?>
              </select> 
			  <a href="javascript:;" id="customer-group-now"><?php echo $text_customer_group_now; ?></a>
			  <div class="text-success" id="cgn-result-success" style="display:none;"><?php echo $text_done; ?></div>			  
            </div>
          </div>	  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-force-required"><?php echo $entry_force_required; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_force_required" id="input-force-required" class="form-control">
                <?php if ($account_combine_force_required) { ?>
                <option value="1" selected="selected"><?php echo $text_no; ?></option>
                <option value="0"><?php echo $text_yes; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_no; ?></option>
                <option value="0" selected="selected"><?php echo $text_yes; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 	  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-aff-links-in-account"><span data-toggle="tooltip" title="<?php echo $help_aff_links_in_account; ?>"><?php echo $entry_aff_links_in_account; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_aff_links_in_account" id="input-aff-links-in-account" class="form-control">
                <?php if ($account_combine_aff_links_in_account) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div> 
	<fieldset>
		<legend><?php echo $heading_fields; ?></legend>	  
		<?php if ($tracking_input_info) {?>
		<div class="alert alert-info"><?php echo $tracking_input_info; ?></div>
		<?php } ?>
		<?php foreach($aff_fields as $field) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="f_<?php echo $field; ?>"><?php echo ${'entry_fields_' . $field}; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_fields[<?php echo $field; ?>]" id="f_<?php echo $field; ?>" class="aff_f triggers form-control">
				<option value="y"<?php if($account_combine_fields[$field] == 'y') { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
				<option value="r"<?php if($account_combine_fields[$field] == 'r') { ?> selected="selected"<?php } ?>><?php echo $text_option_required; ?></option>
				<option value="n"<?php if($account_combine_fields[$field] == 'n') { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
              </select>
            </div>
          </div>
		<?php } ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="f_payment_default"><?php echo $entry_fields_payment_default; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_fields[payment_default]" id="f_payment_default" class="form-control">
			<?php foreach($payment_methods as $method) { ?>			
				<option value="<?php echo $method;?>"<?php if($account_combine_fields['payment_default'] == $method) { ?> selected="selected"<?php } ?>><?php echo ucfirst($method); ?></option>
			<?php } ?>
              </select>
            </div>
          </div>
		<?php foreach($payment_methods as $method) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="f_<?php echo $method; ?>"><?php echo ${'entry_fields_use_' . $method}; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_fields[use_<?php echo $method; ?>]" id="f_<?php echo $method; ?>" class="f_payment triggers form-control">
				<?php if ($account_combine_fields['use_' . $method]) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>
              </select>
            </div>
          </div>
		<?php } ?>		
	  </fieldset>
	  <fieldset>
	    <legend><?php echo $entry_fields_bank; ?></legend>			  
		<?php foreach($bank_fields as $field) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="bank_fields_<?php echo $field; ?>"><?php echo ${'text_bank_' . $field}; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_fields[bank][<?php echo $field; ?>]" id="bank_fields_<?php echo $field; ?>" class="bank_fields form-control">
				<?php if ($account_combine_fields['bank'][$field]) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>	
              </select>
            </div>
          </div>
		<?php } ?>		
		</fieldset>		
		<fieldset>
		<legend><?php echo $heading_account_register; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="rform-affiliate"><?php echo $entry_form_affiliate_choice; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_rform[affiliate]" id="rform-affiliate" class="form-control">
				<option value="c"<?php if($account_combine_rform['affiliate'] == 'c') { ?> selected="selected"<?php } ?>><?php echo $text_option_affiliate_choice; ?></option>
				<option value="y"<?php if($account_combine_rform['affiliate'] == 'y') { ?> selected="selected"<?php } ?>><?php echo $text_option_affiliate_force; ?></option>
				<option value="n"<?php if($account_combine_rform['affiliate'] == 'n') { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>	
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="rform-website_textarea"><span data-toggle="tooltip" title="<?php echo $help_form_website_textarea; ?>"><?php echo $entry_form_website_textarea; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_rform[website_textarea]" id="rform-website_textarea" class="form-control">
				<?php if ($account_combine_rform['website_textarea']) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>		
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="rform-agreement"><?php echo $entry_form_agreement; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_rform[agreement]" id="rform-agreement" class="form-control">
				<?php if ($account_combine_rform['agreement']) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>		
              </select>
            </div>
          </div>
	  <?php foreach($aff_fields as $field) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="rform_f_<?php echo $field; ?>"><?php echo ${'entry_form_' . $field}; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_rform[show_<?php echo $field; ?>]" id="rform_f_<?php echo $field; ?>" class="form-control">
				<?php if ($account_combine_rform['show_' . $field]) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>		
              </select>
            </div>
          </div>
	  <?php } ?>
	  </fieldset>
		<fieldset>
		<legend><?php echo $heading_checkout_register; ?></legend>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="cform-affiliate"><?php echo $entry_form_affiliate_choice; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_cform[affiliate]" id="cform-affiliate" class="form-control">
				<option value="c"<?php if($account_combine_cform['affiliate'] == 'c') { ?> selected="selected"<?php } ?>><?php echo $text_option_affiliate_choice; ?></option>
				<option value="y"<?php if($account_combine_cform['affiliate'] == 'y') { ?> selected="selected"<?php } ?>><?php echo $text_option_affiliate_force; ?></option>
				<option value="n"<?php if($account_combine_cform['affiliate'] == 'n') { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>	
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="cform-website_textarea"><span data-toggle="tooltip" title="<?php echo $help_form_website_textarea; ?>"><?php echo $entry_form_website_textarea; ?></span></label>
            <div class="col-sm-10">
              <select name="account_combine_cform[website_textarea]" id="cform-website_textarea" class="form-control">
				<?php if ($account_combine_cform['website_textarea']) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>		
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="cform-agreement"><?php echo $entry_form_agreement; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_cform[agreement]" id="cform-agreement" class="form-control">
				<?php if ($account_combine_cform['agreement']) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>		
              </select>
            </div>
          </div>
	  <?php foreach($aff_fields as $field) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="cform_f_<?php echo $field; ?>"><?php echo ${'entry_form_' . $field}; ?></label>
            <div class="col-sm-10">
              <select name="account_combine_cform[show_<?php echo $field; ?>]" id="cform_f_<?php echo $field; ?>" class="form-control">
				<?php if ($account_combine_cform['show_' . $field]) { ?>
				<option value="1" selected="selected"><?php echo $text_yes; ?></option>
				<option value="0"><?php echo $text_no; ?></option>
				<?php } else { ?>
				<option value="1"><?php echo $text_yes; ?></option>
				<option value="0" selected="selected"><?php echo $text_no; ?></option>
				<?php } ?>		
              </select>
            </div>
          </div>
	  <?php } ?>
	  </fieldset>	  
     </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!-- 
$(document).ready(function() {
	var _error_class = 'text-danger';
	var _payment_methods = <?php echo $payment_methods_json; ?>;

	var toggle_select = function(_el, enable) {
		if($(_el).attr('disabled') && enable) {
			var _hid = $(_el).data('hid');
			$('#'+_hid).remove();
			$(_el).attr('disabled', false);
		}
		if(!$(_el).attr('disabled') && !enable) {
			var _hid = 'id'+parseInt(Math.random() * 10000000);
			$(_el).data('hid', _hid);
			$(_el).after('<input type="hidden" name="'+$(_el).attr('name')+'" value="'+$(_el).val()+'" id="'+_hid+'" />');
			$(_el).attr('disabled', true);
		}	
	}
	
	$(document).on('click', '#customer-group-now', function() {
		if(parseInt($('select[name="account_combine_customer_group_id"]').val()) < 1) {
			$('#cgn-result-success').after('<div class="'+_error_class+'" id="cgn-result-error"><?php echo $text_customer_group_now_select;?></div>');					
			$('#cgn-result-success').hide();
			return;
		}
		
		if(!confirm('<?php echo $text_customer_group_now_confirm;?>')) return;
		
		$.ajax({
			url: '<?php echo $link_customer_group_now;?>', 
			data: {customer_group_id : $('select[name="account_combine_customer_group_id"]').val()}, 
			type: 'post',
			cache: false,			
			beforeSend: function() {
				$('#customer-group-now').button('loading');
				$('#cgn-result-success').hide();
				$('#cgn-result-error').remove();				
			},
			complete: function() {
				$('#customer-group-now').button('reset');
			},
			success: function(_r) {			
				if(_r < 0) {				
					$('#cgn-result-success').after('<div class="'+_error_class+'" id="cgn-result-error"><?php echo $text_error;?></div>');									
				} else {				
					$('#cgn-result-success').show();
				}		
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}			
		});
	});
	
	$(document).on('change', '[name="account_combine_allow_own_aff"]', function() {
		if($(this).val() == '0') $('[name="account_combine_own_parent"]').val('0');
		toggle_select($('[name="account_combine_own_parent"]'), ($(this).val() == '0' ? false : true));
	});

	$(document).on('change', '[name="account_combine_own_parent"]', function() {
		if($(this).val() == '1') $('[name="account_combine_allow_own_aff"]').val('1');
		toggle_select($('[name="account_allow_own_aff"]'), ($(this).val() == '1' ? false : true));
	});
	
	$(document).on('change', '#f_payment,[name="account_combine_allow_funds_transfer"]', function() {
		if($('#f_payment').val() != 'n' || $('[name="account_combine_allow_funds_transfer"]').val() == '0') {
			$('[name="account_combine_auto_credit"]').val('0');
			toggle_select($('[name="account_combine_auto_credit"]'), false);
		} else {
			toggle_select($('[name="account_combine_auto_credit"]'), true);
		}
	});
	
	$(document).on('change', '.aff_f', function() {
		var _id1 = '#rform_'+$(this).attr('id');
		var _id2 = '#cform_'+$(this).attr('id');
		if($(this).val() == 'n') {
			$(_id1).val('0');
			$(_id2).val('0');
		}
		toggle_select($(_id1), ($(this).val() == 'n' ? false : true));
		toggle_select($(_id2), ($(this).val() == 'n' ? false : true));

		if($(this).attr('id') == 'f_payment') {
			var _val = $(this).val();
			if(_val == 'n') {
				$('.f_payment').val('0');
				$('.f_payment').trigger('change');				
			} 
			$('.f_payment').each(function(_i, _el) {
				toggle_select($(_el), (_val == 'n' ? false : true));
			});			
		}
	});	
	
	$(document).on('change', '.f_payment', function() {
		var _id = $(this).attr('id');
		if($(this).val() == '0') {
			if($('#f_payment').val() != 'n') {
				var _all_disabled = true;
				for(var _i = 0; _i < _payment_methods.length; _i++) {
					if($('#f_'+_payment_methods[_i]).val() == '1') {
						_all_disabled = false;
						break;
					}
				}
				if(_all_disabled === true) {
					$('#f_payment').val('n');
					$('#f_payment').trigger('change');
				} else {
					var _pm = _id.replace(/^f_/, '');
					if($('#f_payment_default').val() == _pm) {
						for(var _i = 0; _i < _payment_methods.length; _i++) {
							if($('#f_'+_payment_methods[_i]).val() == '1') {
								$('#f_payment_default').val(_payment_methods[_i]);
								break;
							}
						}
					}
				}
			}
		}
		
		if(_id == 'f_bank') {
			var _val = $(this).val();
			if(_val == '0')	$('.bank_fields').val('0');
			$('.bank_fields').each(function(_i, _el) {
				toggle_select($(_el), (_val == '0' ? false : true));
			});
		}
	});
		
	$('.triggers').trigger('change');		
});
//--></script></div>
<?php echo $footer; ?>