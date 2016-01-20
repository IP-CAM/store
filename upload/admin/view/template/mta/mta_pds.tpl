<?php
	if($error_warning) { ?>
<script type="text/javascript">alert('<?php echo $error_warning; ?>');</script>
<?php }
		else { ?>
	<?php foreach($types as $type) { ?>
       <div class="form-group">
		 <label class="control-label" for="mta-<?php echo $type; ?>-set"><?php echo $entries_set[$type]; ?></label>
         <div class="input-group">
			<select id="mta-<?php echo $type; ?>-set" class="form-control">
				<option value="-1"><?php echo $option_select; ?></option>
				<option value="0"><?php echo $option_default; ?></option>
				<?php 
					foreach($schemes as $_id => $_name) { ?>
				<option value="<?php echo $_id; ?>"><?php echo $_name; ?></option>
				<?php } ?>
			</select>
            <span class="input-group-btn">
				<button type="button" class="btn btn-default mta_set_save_button" data-loading-text="<?php echo $text_saving; ?>"><?php echo $button_set; ?></button>
            </span></div>
       </div>
       <div class="form-group">
		 <label class="control-label" for="mta-<?php echo $type; ?>-save_default"><?php echo $entries_save_default[$type]; ?></label>
         <div class="input-group">
			<select id="mta-<?php echo $type; ?>-save_default" class="form-control">
				<option value="-1"><?php echo $option_select; ?></option>
				<option value="0"><?php echo $option_default; ?></option>
				<?php 
					foreach($schemes as $_id => $_name) {
						if(isset($schemes_default[$type]) && $schemes_default[$type] == $_id) { ?>
				<option value="<?php echo $_id; ?>" selected="selected"><?php echo $_name; ?></option>
				<?php } else { ?>
				<option value="<?php echo $_id; ?>"><?php echo $_name; ?></option>
				<?php }
					} ?>
			</select>
            <span class="input-group-btn">
				<button type="button" class="btn btn-default mta_set_save_button" data-loading-text="<?php echo $text_saving; ?>"><?php echo $button_save_default; ?></button>
            </span></div>
       </div>
<?php } ?>
<script type="text/javascript">
	$('.mta_set_save_button').on('click', function() {
		var _this = this;
		var _p = $(_this).parent().parent();
		var _s = $(_p).find('select[id^="mta-"]');
		if($(_s).val() < 0) return;
		var _s_id = $(_s).attr('id').split('-');
		var _type = _s_id[1];
		var _action = _s_id[2];
		if(!confirm(_action == 'set' ? '<?php echo $text_confirm_set;?>' : '<?php echo $text_confirm_save_default;?>')) return;		
		$(_this).button('loading');		
		var _url = _action == 'set' ? '<?php echo $url_set;?>' : '<?php echo $url_save_default;?>';
		$.post(_url, {type : _type, scheme_id : $(_s).val()}, function(_r) {
			$(_this).button('reset');		
			if(parseInt(_r) > 0) {				
				if(_action == 'set' || $(_s).val() == '0') $(_s).val('-1');
			} else {
				alert('<?php echo $alert_error;?>');
			}			
		});
	});	
</script>	
<?php } ?>		