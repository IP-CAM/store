<?php echo $header; ?>
<style>
.help {
	color: #999;
	font-size: 10px;
	font-weight: normal;
	font-family: Verdana, Geneva, sans-serif;
	display: block;
}
</style>
<?php echo $column_left; ?>
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
  <?php if ($unconverted_affiliates || $error_no_default || $error_warning) { 
  ?>  
  <div class="alert alert-danger" id="warning"><i class="fa fa-exclamation-circle"></i>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  	<?php	if ($unconverted_affiliates) {?>
  	<div id="unconverted_div">
  	<?php
  		echo $text_unconverted_affiliates;?> - <strong><?php echo $unconverted_affiliates;?></strong><br />
  	<?php 
  		if($error_no_default_unconverted) {
  			echo $error_no_default_unconverted;
  		} else {?>
  		<a id="convert_affiliates"><?php echo $text_convert_affiliates;?></a>
  	<?php
  		}?>
  	</div>
  	<?php
  	}
  	if(!$error_no_default_unconverted || $error_no_default) echo $error_no_default . '<br />';
  	if($error_warning) echo $error_warning;?>  	      
    </div>
  <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-schemes" data-toggle="tab"><?php echo $tab_schemes; ?></a></li>		  
            <li><a href="#tab-general-settings" data-toggle="tab"><?php echo $tab_general_settings; ?></a></li>
          </ul>
          <div class="tab-content">
			<div class="tab-pane active" id="tab-schemes">			
				<div class="text-right" style="padding-bottom:10px"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>			
				</div>			
<?php	
	if(!sizeof($schemes)) { ?>
<div class="alert alert-info"><?php echo $text_no_results; ?></div>    	
<?php } else { ?>          
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
            	  <td class="text-left"><?php echo $column_name; ?></td>
            	  <td class="text-left"><?php echo $column_commission; ?></td>
            	  <td class="text0left"><?php echo $column_code; ?></td>   
                  <td class="text-right"><?php echo $column_action; ?></td>
				</tr>
			  </thead>
			  <tbody>
            <?php foreach ($schemes as $s) { ?>
              <tr>
				<td class="text-left">
				<?php if($s['is_default']) { ?>
					<div class="pull-right"><small><?php echo $text_default; ?></small></div>
				<?php } ?>
				<div><?php echo $s['name']; ?></div>
				<div class="help"><?php echo $s['description']; ?></div>
				<?php if($s['user_total']) { ?>
				<div>
					<a class="show_usage_link"><?php echo $text_show_usage; ?> (<?php echo $s['user_total']; ?>)</a>
					<a class="hide_usage_link" style="display:none;"><?php echo $text_hide; ?></a>
					<div class="usage" style="display:none">
					<?php foreach($user_types as $_k => $_v) {
						if($s['user_count'][$_k]) { ?>
						<input type="checkbox" value="<?php echo $_v; ?>" /><?php echo $user_types_lng[$_k]; ?> :  <strong><?php echo $s['user_count'][$_k]; ?></strong><br />				
					<?php }
						}
						if($num_schemes > 1) {
							echo $text_move_users;?><br />
						<select class="move_select_scheme">
							<option value=""><?php echo $text_select_scheme; ?> ...</option>
							<?php
								for($__i = 0; $__i < sizeof($s_opts); $__i++) { ?>
							<option value="<?php echo $s_opts[$__i]['id']; ?>"><?php echo $s_opts[$__i]['name']; ?></option>
							<?php } ?>
						</select><br />
						<input type="hidden" class="this_scheme_id" value="<?php echo $s['id']; ?>" />
						<input type="hidden" class="move_id_input" value="" />
						<div class="move_name_div" style="display:none;">
							<input type="text" class="move_name_input" size="20" value="" readonly="readonly" />
						</div>
						<input type="button" class="move_button" id="mb_<?php echo $s['id']; ?>" value="<?php echo $text_move; ?>" />
						<?php } ?>
					</div>
				</div>
				<?php } ?>
				</td>
				<td class="text-left">
					<?php echo $s['max_levels']; ?>-<?php echo $entry_tier; ?>, <?php echo ($s['commission_type'] == 'fixed' ? $text_amount : $text_percent); ?><hr />
					<?php echo $s['commissions']; ?>
				</td>
				<td class="text-left">
					<input type="text" size="20" value="<?php echo $s['signup_code']; ?>" readonly="readonly" /><br />
					<small>add </small><strong>&amp;mta=<?php echo $s['signup_code'];?></strong><small> to any shop URL&#039;s query part to get new affiliate signed under this scheme</small>
				</td>
				<td class="text-left">
					<a href="javascript:;" class="copy_scheme_link"><?php echo $text_copy_scheme;?></a>
					<div style="padding-left:50px;display:none;">
					<?php echo $entry_new_name;?>:<br />
						<input type="hidden" class="this_scheme_id" value="<?php echo $s['id']; ?>" />
						<input type="text" class="new_scheme_name" value="" size="30" /><br />
						<button type="button" class="btn btn-default copy_scheme_button"><?php echo $text_copy_scheme;?></button>
					</div><br />
					<a href="<?php echo $s['edit_link']['href']; ?>"><?php echo $s['edit_link']['text']; ?></a>
					<?php if(!$s['is_default']) { ?>
						<br />
						<a class="delete_link" id="dl_<?php echo $s['id']; ?>"><?php echo $button_delete; ?></a>
					<?php } ?>
				</td>
			</tr>
            <?php } ?>			  
			  </tbody>
			</table>
		  </div>		   
<?php } ?>		   
			</div>
			<div class="tab-pane form-horizontal" id="tab-general-settings">
			  <div class="text-right" style="padding-bottom:15px">
				<button type="button" class="btn btn-primary" id="button_save_settings" data-toggle="tooltip" data-loading-text="<?php echo $text_loading; ?>" title="<?php echo $button_save_settings; ?>"><i class="fa fa-save"></i></button>
			  </div>			
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-settings-tracking"><?php echo $column_settings_tracking; ?></label>
                <div class="col-sm-10">
					<select name="mta_ypx_no_aff_in_cust_acc" onchange="javascript:if($(this).val() == '1') {$('[name=\'mta_ypx_db_perm\']').val('0');};" class="form-control" id="input-settings-tracking">
						<option value="0"<?php if(!$config->get('mta_ypx_no_aff_in_cust_acc')) { ?> selected="selected"<?php } ?>><?php echo $text_settings_tracking_permanent; ?></option>
						<option value="1"<?php if($config->get('mta_ypx_no_aff_in_cust_acc')) { ?> selected="selected"<?php } ?>><?php echo $text_settings_tracking_cookies; ?></option>
					</select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-settings-db-permit"><?php echo $column_settings_db_permit; ?></label>
                <div class="col-sm-10">
					<select name="mta_ypx_db_perm" onchange="javascript:if($(this).val() == '1') {$('[name=\'mta_ypx_no_aff_in_cust_acc\']').val('0');};" class="form-control" id="input-settings-db-permit">
						<option value="0"<?php if(!$config->get('mta_ypx_db_perm')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
						<option value="1"<?php if($config->get('mta_ypx_db_perm')) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>				  
					</select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general-settings" title="<?php echo $help_settings_no_shipping; ?>"><?php echo $column_settings_no_shipping; ?></span></label>
                <div class="col-sm-10">
				  <label class="radio-inline">
					<input type="radio" name="mta_ypx_no_shipping" value="0"<?php if(!$config->get('mta_ypx_no_shipping')) { ?> checked="checked"<?php } ?> /> <?php echo $text_settings_no_shipping_default; ?>
				  </label>
				  <label class="radio-inline">
					<input type="radio" name="mta_ypx_no_shipping" value="any"<?php if($config->get('mta_ypx_no_shipping') && $config->get('mta_ypx_no_shipping') == 'any') { ?> checked="checked"<?php } ?> /> <?php echo $text_settings_no_shipping_any; ?>
				  </label>
				  <label class="radio-inline">
					<input type="radio" name="mta_ypx_no_shipping" value="subtotal"<?php if($config->get('mta_ypx_no_shipping') && $config->get('mta_ypx_no_shipping') == 'subtotal') { ?> checked="checked"<?php } ?> /> <?php echo $text_settings_no_shipping_subtotal; ?>
				  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general-settings" title="<?php echo $help_settings_autoadd_statuses; ?>"><?php echo $column_settings_autoadd_statuses; ?></span></label>
                <div class="col-sm-10">
				<?php
				  foreach($order_statuses as $_i => $_order_status) { ?>
				  <div class="checkbox">
				    <label>
					  <input type="checkbox" name="mta_ypx_autoadd_statuses[<?php echo $_i; ?>]" value="<?php echo $_order_status['order_status_id']; ?>"<?php if(in_array($_order_status['order_status_id'], $autoadd_statuses)) { ?> checked="checked"<?php }?> /><?php echo $_order_status['name']; ?><br />
					</label>
			      </div>
				<?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-settings-explicit-default"><span data-toggle="tooltip" data-container="#tab-general-settings" title="<?php echo $help_settings_explicit_default; ?>"><?php echo $column_settings_explicit_default; ?></span></label>
                <div class="col-sm-10">
					<select name="mta_ypx_explicit_default" class="form-control" id="input-settings-explicit-default">
						<option value="0"><?php echo $text_no; ?></option>
						<option value="1"<?php if($config->get('mta_ypx_explicit_default')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
					</select>					
                </div>
              </div>			  
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general-settings" title="<?php echo $help_settings_llaff_priority; ?>"><?php echo $column_settings_llaff_priority; ?></span></label>
                <div class="col-sm-10">
				  <label class="radio-inline">
					<input type="radio" name="mta_ypx_llaff_priority" value="0"<?php if(!$config->get('mta_ypx_llaff_priority')) { ?> checked="checked"<?php } ?> /> <?php echo $text_settings_llaff_higher; ?>
				  </label>
				  <label class="radio-inline">
					<input type="radio" name="mta_ypx_llaff_priority" value="1"<?php if($config->get('mta_ypx_llaff_priority')) { ?> checked="checked"<?php } ?> /> <?php echo $text_settings_llaff_lower; ?>
				  </label>
                </div>
              </div>			  
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-settings-recurring"><?php echo $column_settings_recurring; ?></label>
                <div class="col-sm-10">
					<select name="mta_ypx_pay_recur" class="form-control" id="input-settings-recurring">
						<option value="0"><?php echo $text_no; ?></option>
						<option value="1"<?php if($config->get('mta_ypx_pay_recur')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>
					</select>
                </div>
              </div>			  
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general-settings" title="<?php echo $help_settings_downline; ?>"><?php echo $column_settings_downline; ?></span></label>
                <div class="col-sm-10">	
					<div class="input-group">				
					<select name="mta_ypx_downline" id="downline_select" class="form-control">
					  <option value="0"<?php if(!$config->get('mta_ypx_downline')) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
					  <option value="1"<?php if($config->get('mta_ypx_downline')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>				
					</select><div class="input-group-addon"><?php echo $text_show_downline; ?></div></div>
					<div class="input-group">
					<select name="mta_ypx_downline_email" class="form-control downline_item">
					  <option value="0"<?php if(!$config->get('mta_ypx_downline_email')) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
					  <option value="1"<?php if($config->get('mta_ypx_downline_email')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>				
					</select><div class="input-group-addon"><?php echo $text_show_downline_email; ?></div></div>
					<div class="input-group">
					<select name="mta_ypx_downline_phone" class="form-control downline_item">
					  <option value="0"<?php if(!$config->get('mta_ypx_downline_phone')) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
					  <option value="1"<?php if($config->get('mta_ypx_downline_phone')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>				
					</select><div class="input-group-addon"><?php echo $text_show_downline_phone; ?></div></div>
					<div class="input-group">
					<select name="mta_ypx_downline_earnings" class="form-control downline_item">
					  <option value="0"<?php if(!$config->get('mta_ypx_downline_earnings')) { ?> selected="selected"<?php } ?>><?php echo $text_no; ?></option>
					  <option value="1"<?php if($config->get('mta_ypx_downline_earnings')) { ?> selected="selected"<?php } ?>><?php echo $text_yes; ?></option>				
					</select><div class="input-group-addon"><?php echo $text_show_downline_earnings; ?></div>
				  </div>
                </div>
              </div>			  
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-downline-limit"><span data-toggle="tooltip" data-container="#tab-general-settings" title="<?php echo $help_settings_downline_limit; ?>"><?php echo $column_settings_downline_limit; ?></span></label>
                <div class="col-sm-10">	
					<input type="text" name="mta_ypx_downline_limit" size="3" value="<?php echo ($config->get('mta_ypx_downline_limit') ? intval($config->get('mta_ypx_downline_limit')) : ''); ?>" onchange="javascript:if($('[name=\'mta_ypx_downline_limit\']').val() != '' && !/^\d+$/.test($('[name=\'mta_ypx_downline_limit\']').val())) {$('#error_downline_limit').addClass('text-danger').show(); $('[name=\'mta_ypx_downline_limit\']').val('');} else {$('#error_downline_limit').removeClass('text-danger').hide();};" class="form-control" id="input-downline-limit" />
					<div style="display:none;" id="error_downline_limit"><?php echo $error_downline_limit; ?></div>
				</div>
			  </div>			  
			  <div><a href="<?php echo $link_downline; ?>" target="_blank"><?php echo $text_link_downline;?></a></div>			
			</div>
		  </div>
		 </div>
		</div>
<script type="text/javascript"><!--
	
$(document).ready(function () { 

	var _all_fixed = <?php echo $all_fixed;?>;

	var _cb = function(r) {
		//standard response callback
		r = parseInt(r);
		if(r) {
			alert('<?php echo mta_esqq($text_success); ?>');
			document.location.reload();
		} else {
			alert('<?php echo mta_jsstr($error_invalid_request); ?>');
		}		
	}
	
	$('.show_usage_link').on('click', function() {
		$(this).hide();
		$($(this).parent().find('.usage')).show();
		$($(this).parent().find('.hide_usage_link')).show();
	});
	
	$('.hide_usage_link').on('click', function() {
		$(this).hide();
		$($(this).parent().find('.usage')).hide();
		$($(this).parent().find('.show_usage_link')).show();
	});
	
	$('#convert_affiliates').on('click', function() {
		$.get(document.location.href.replace('mta/mta', 'mta/mta/convert_affiliates'), function(r) {
			r = parseInt(r);
			if(r) {
				$('#unconverted_div').hide();
				$('#success').text('<?php echo mta_jsstr($text_convert_success); ?>');
				$('#success').parent().show();
				$('#warning').hide();
			} else {
				alert('<?php echo mta_jsstr($error_invalid_request); ?>');
			}
		});		
	});
	
	$('.delete_link').on('click', function() {
		if(!confirm('<?php echo mta_jsstr($text_delete_scheme_warning); ?>')) return;
		var _id = $(this).attr('id');
		_id = _id.split('_')[1];
		$.post(document.location.href.replace('mta/mta', 'mta/mta/delete'), {'id' : _id, 'really_do_delete' : (parseInt(_id) * 3 + 517)}, _cb);
	});
	
	$('.copy_scheme_link').on('click', function() {
		$(this).parent().find('div:first').toggle();
	});
	
	$('.copy_scheme_button').on('click', function() {
		var _name = $(this).parent().find('.new_scheme_name').val();
		if(!_name) return;
		var _id = $(this).parent().find('.this_scheme_id').val();
		$.post(document.location.href.replace('mta/mta', 'mta/mta/copy'), {'id' : _id, 'name' : _name}, _cb);
	});
	
	$('.move_button').on('click', function() {
		var _new_id = $(this).parent().find('.move_id_input').val();
		if(!_new_id) return;
		_types = [];
		$($(this).parent().find('input:checked')).each(function() {
			_types.push($(this).val());
		});
		if(!_types.length) return;
		$.post(document.location.href.replace('mta/mta', 'mta/mta_set_scheme/move'), {
			'from' : $(this).attr('id').split('_')[1],
			'to' : _new_id,
			'types' : _types.join(',')		
		}, _cb);		
	});
	
	$('.move_select_scheme').on('change', function() {
		var _id	= $(this).find('option:selected').val();
		if(_id == $($(this).parent().find('.this_scheme_id')).val()) {
			$(this).find('option[value="'+_id+'"]').prop('selected', false);
			$(this).find('option[value="0"]').prop('selected', true);
			return;
		}
		var _name = $(this).find('option:selected').text();
		$(this).parent().find('.move_id_input').val(_id);
		$(this).parent().find('.move_name_input').val(_id ? _name : '');
		$(this).parent().find('.move_name_div').show();
		return true;
	});
	
	var _saving_settings = false;
	$('#button_save_settings').on('click', function() {
		if(_saving_settings) return;
		_saving_settings = true;
		$('#button_save_settings').button('loading');	
		var _data = {};
		$('input[name^="mta_ypx_"]:checked').each(function() {
			_data[$(this).attr('name')] = $(this).attr('value');
		});
		$('select[name^="mta_ypx_"]').each(function() {
			_data[$(this).attr('name')] = $(this).find('option:selected').val();
		});		
		_data['mta_ypx_downline_limit'] = $('[name="mta_ypx_downline_limit"]').val();
		$.post(document.location.href.replace('mta/mta', 'mta/mta/save_settings'), _data, function() {
			_saving_settings = false;
			$('#button_save_settings').button('reset');
		});	
	});
	
	var _check_downline = function() {
		if($('#downline_select').val() == '0') {
			$('.downline_item').val('0');
			$('.downline_item').attr('disabled', true);
		} else {
			$('.downline_item').attr('disabled', false);
		}
	}
	
	$('#downline_select').on('change', _check_downline);
	_check_downline();
});

//--></script>
<?php echo $footer; ?></div>