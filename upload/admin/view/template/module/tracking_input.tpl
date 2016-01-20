<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-tracking-input" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tracking-input" class="form-horizontal">
		<?php if($tracking_input_dir_template) {?>			
		<input type="hidden" name="tracking_input_dir_template" value="<?php echo $tracking_input_dir_template;?>" />
		<?php } else { ?>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-dir-template"><?php echo $entry_dir_template; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_dir_template" id="tracking-input-dir-template" class="form-control" />
            </div>
          </div>
		<?php } ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="tracking_input_status" id="input-status" class="form-control">
                <?php if ($tracking_input_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>		
		<?php if ($accc) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-choose-code"><span data-toggle="tooltip" title="<?php echo $help_choose_code_account; ?>"><?php echo $entry_choose_code_account; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_choose_code" id="input-choose-code" class="form-control">
                <?php if ($tracking_input_choose_code) { ?>
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
            <label class="col-sm-2 control-label" for="input-choose-code-checkout"><span data-toggle="tooltip" title="<?php echo $help_choose_code_checkout; ?>"><?php echo $entry_choose_code_checkout; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_choose_code_checkout" id="input-choose-code-checkout" class="form-control">
                <?php if ($tracking_input_choose_code_checkout) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>				
		<?php } else  { ?>
          <div class="form-group">
			<input type="hidden" name="tracking_input_choose_code_checkout" value="<?php echo $tracking_input_choose_code_checkout; ?>" />
            <label class="col-sm-2 control-label" for="input-choose-code"><span data-toggle="tooltip" title="<?php echo $help_choose_code; ?>"><?php echo $entry_choose_code; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_choose_code" id="input-choose-code" class="form-control">
                <?php if ($tracking_input_choose_code) { ?>
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
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-require-code"><span data-toggle="tooltip" title="<?php echo $help_choose_code_required; ?>"><?php echo $entry_choose_code_required; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_require_code" id="input-require-code" class="form-control">
                <?php if ($tracking_input_require_code) { ?>
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
            <label class="col-sm-2 control-label" for="input-edit-code"><span data-toggle="tooltip" title="<?php echo $help_edit_code; ?>"><?php echo $entry_edit_code; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_edit_code" id="input-edit-code" class="form-control">
                <?php if ($tracking_input_edit_code) { ?>
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
            <label class="col-sm-2 control-label" for="input-show-close-button"><span data-toggle="tooltip" title="<?php echo $help_show_close_button; ?>"><?php echo $entry_show_close_button; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_show_close_button" id="input-show-close-button" class="form-control">
                <?php if ($tracking_input_show_close_button) { ?>
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
            <label class="col-sm-2 control-label" for="input-no-cookie-only"><?php echo $entry_no_cookie_only; ?></label>
            <div class="col-sm-10">
              <select name="tracking_input_no_cookie_only" id="input-no-cookie-only" class="form-control">
                <?php if ($tracking_input_no_cookie_only) { ?>
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
            <label class="col-sm-2 control-label" for="input-show"><span data-toggle="tooltip" title="<?php echo $help_show; ?>"><?php echo $entry_show; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_show" id="input-show" class="form-control">
					<?php if($tracking_input_show == 'session') {?>
					<option value="session" selected="selected"><?php echo $option_session;?></option>
					<?php } else {?>
					<option value="session"><?php echo $option_session;?></option>
					<?php }?>
					<?php if($tracking_input_show == 'page') {?>
					<option value="page" selected="selected"><?php echo $option_page;?></option>
					<?php } else {?>
					<option value="page"><?php echo $option_page;?></option>
					<?php }?>
					<?php if($tracking_input_show == 'once') {?>
					<option value="once" selected="selected"><?php echo $option_once;?></option>
					<?php } else {?>
					<option value="once"><?php echo $option_once;?></option>
					<?php }?>
              </select>
            </div>
          </div>			  		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-redirect"><span data-toggle="tooltip" title="<?php echo $help_redirect; ?>"><?php echo $entry_redirect; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_redirect" id="input-redirect" class="form-control">
                <?php if ($tracking_input_redirect) { ?>
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
            <label class="col-sm-2 control-label" for="input-allow-coupon"><span data-toggle="tooltip" title="<?php echo $help_allow_coupon; ?>"><?php echo $entry_allow_coupon; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_input_allow_coupon" id="input-allow-coupon" class="form-control">
                <?php if ($tracking_input_allow_coupon) { ?>
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
            <label class="col-sm-2 control-label" for="input-allow-marketing"><?php echo $entry_allow_marketing; ?></label>
            <div class="col-sm-10">
              <select name="tracking_input_allow_marketing" id="input-allow-marketing" class="form-control">
                <?php if ($tracking_input_allow_marketing) { ?>
                <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                <option value="0"><?php echo $text_no; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_yes; ?></option>
                <option value="0" selected="selected"><?php echo $text_no; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>				  
		<h2><?php echo $heading_add_module;?></h2>
		<div class="container-fluid text-info"><a href="javascript:;" onclick="javascript:$(this).parent().find('.help').toggle();"><?php echo $text_show_help;?></a><br /><span class="help" style="display:none;"><?php echo $text_explanation;?></span></div>  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[name]" value="" placeholder="<?php echo $entry_name; ?>" id="input-module-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-language"><?php echo $entry_language; ?></label>
            <div class="col-sm-10">
				<select name="tracking_input_module[language_id]" class="form-control" id="input-module-language">
				 <?php foreach($languages as $language) { ?>
					<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name'];?></option>
                  <?php } ?>
                </select>
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-text"><?php echo $entry_text; ?></label>
            <div class="col-sm-10">				
              <textarea name="tracking_input_module[text]" placeholder="<?php echo $entry_text; ?>" id="input-module-text" class="form-control"></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-text-heading"><?php echo $entry_text_heading; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[text_heading]" value="" placeholder="<?php echo $entry_text_heading; ?>" id="input-module-text-heading" class="form-control" />
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-text-thankyou"><?php echo $entry_text_thankyou; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[text_thankyou]" value="" placeholder="<?php echo $entry_text_thankyou; ?>" id="input-module-text-thankyou" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-button"><?php echo $entry_button; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[button]" value="" placeholder="<?php echo $entry_button; ?>" id="input-module-button" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-error-message"><?php echo $entry_error_message; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[error_message]" value="" placeholder="<?php echo $entry_error_message; ?>" id="input-module-error-message" class="form-control" />
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-template"><?php echo $entry_head_template; ?></label>
            <div class="col-sm-10">
				<select name="tracking_input_module[template]" class="form-control" id="input-module-template">				 
				 <?php foreach($templates as $tpl) { ?>
					<option value="<?php echo $tpl; ?>"><?php echo $templates_display[$tpl]; ?></option>
                  <?php } ?>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-status"><?php echo $entry_module_status; ?></label>
            <div class="col-sm-10">
              <select name="tracking_input_module[status]" id="input-module-status" class="form-control">
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
              </select>
            </div>
          </div>			  
        </form>
		<h3><?php echo $heading_templates;?></h3>
		<div class="form-group">			
			<div class="col-sm-4">
				<table class="table table-striped">
					<?php foreach($templates as $tpl) {?>						
					<tr>
						<td><b><?php echo $templates_display[$tpl];?></b></td>
						<td>[ <a href="javascript:;" class="edit_tpl" rel="<?php echo $tpl;?>"><?php echo $text_edit_template;?></a> ]<br />
						<?php
							if(in_array($tpl, $used_templates)) {
								echo $warning_used_template;
							} else if(in_array($tpl, array('default_row', 'default_column'))) {
								echo $warning_default_template;
							} else {?>
						[ <a href="javascript:;" class="delete_tpl" rel="<?php echo $tpl;?>"><?php echo $button_delete;?></a> ]
						<?php }?><br />
						[ <a href="javascript:;" class="new_tpl" rel="<?php echo $tpl;?>"><?php echo $text_copy_to_new;?></a> ]
						<div id="new_tpl_<?php echo $tpl;?>" style="display:none;">
						<input type="text" id="new_tpl_name_<?php echo $tpl;?>" /><br />
						<span class="help"><?php echo $text_tpl_name_req;?></span><br />
						<input type="button" value="<?php echo $text_copy_to_new;?>" id="new_tpl_save_<?php echo $tpl;?>" class="new_tpl_save" rel="<?php echo $tpl;?>" />
						</div>
						</td>
					</tr>
					<?php }?>
				</table>
			</div>			
			<div class="col-sm-4">
			<div id="tpl_edit_div" style="display:none;">
				<div class="alert alert-warning"><?php echo $warning_edit_template;?></div>
				<button type="button" data-loading-text="<?php echo $text_loading;?>" class="save_tpl" disabled="disabled" /><?php echo $button_save_template;?></button>
				<textarea id="tpl_edit_textarea" rows="20" cols="70"></textarea><br />
				<button type="button" data-loading-text="<?php echo $text_loading;?>" class="save_tpl" disabled="disabled" /><?php echo $button_save_template;?></button>
				<input type="hidden" id="save_tpl_name" value="" />
				<span style="color:red;display:none" class="span_saved"><?php echo $text_saved;?></span>				
			</div>
			</div>		
		</div>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--

$('.edit_tpl').click(function() {
	$('#tpl_edit_div').show();
	$('.span_saved').hide();
	$('#tpl_edit_textarea').val('');
	$('#save_tpl_name').val($(this).attr('rel'));
	$('.save_tpl').button('loading');
	$('.save_tpl').attr('disabled', true);

	$.get(document.location.href.replace('module/tracking_input', 'module/tracking_input/tpl_read&tpl='+$(this).attr('rel')), function(_r) {
		if(_r) {
			$('#tpl_edit_textarea').val(_r);
			$('.save_tpl').attr('disabled', false);			
		} else {
			alert('<?php echo $error_load_tpl;?>');
		}			
		$('.save_tpl').button('reset');
	})
});

$('.save_tpl').click(function() {
	$('.save_tpl').button('loading');
	var _this = this;
	$(_this).attr('disabled', true);
	$.post(document.location.href.replace('module/tracking_input', 'module/tracking_input/tpl_update'), {tpl : $('#save_tpl_name').val(), content : $('#tpl_edit_textarea').val()}, function(_r) {
		$('.save_tpl').button('reset');
		$(_this).attr('disabled', false);		
		if(_r == '1') {			
			$('.span_saved').show();		
		} else {
			alert((_r == '0' ? '<?php echo $error_save_tpl;?>' : _r));
		}
	});
});

$('.new_tpl').click(function() {
	$('#new_tpl_'+$(this).attr('rel')).show();
});

$('.new_tpl_save').click(function() {
	var _tpl = $(this).attr('rel');
	var _n = $('#new_tpl_name_'+_tpl);
	if(/[^a-zA-Z0-9 ]+/.test(_n.val())) {
		$(this).parent().find('.help').attr('style', 'font-weight:bold;color:#f00;');
		return;
	}
	_n.val(_n.val().toLowerCase());
	$.get(document.location.href.replace('module/tracking_input', 'module/tracking_input/tpl_create&tpl='+$(this).attr('rel')+'&name='+_n.val().replace(/\s+/g, '_')), function(_r) {
		if(_r == '1') {
			document.location.reload();
		} else {
			alert((_r == '0' ? '<?php echo $error_create_tpl;?>' : _r));
		}
	})	
});

$('.delete_tpl').click(function() {
	if(!confirm('<?php echo $warning_delete_template;?>')) return;
	var _this = this;
	$.get(document.location.href.replace('module/tracking_input', 'module/tracking_input/tpl_delete&tpl='+$(this).attr('rel')), function(_r) {
		if(_r =='1') {
			$(_this).parent().parent().remove();
			document.location.reload();
		} else {
			alert((_r == '0' ? '<?php echo $error_delete_tpl;?>' : _r));
		}
	})
});

//--></script></div>
<?php echo $footer; ?>