<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
      <p><?php echo $text_description; ?></p>
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?></label>
          <div class="col-sm-10">
            <textarea cols="40" rows="5" placeholder="<?php echo $entry_code; ?>" id="input-code" class="form-control"><?php echo $code; ?></textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-generator"><span data-toggle="tooltip" title="<?php echo $help_generator; ?>"><?php echo $entry_generator; ?></span></label>
          <div class="col-sm-10">
            <input type="text" name="product" value="" placeholder="<?php echo $entry_generator; ?>" id="input-generator" class="form-control" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-link"><?php echo $entry_link; ?></label>
          <div class="col-sm-10">
            <textarea name="link" cols="40" rows="5" placeholder="<?php echo $entry_link; ?>" id="input-link" class="form-control"></textarea>
          </div>
        </div>
      </form>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=affiliate/tracking/autocomplete&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['link']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val(item['label']);
		$('textarea[name=\'link\']').val(item['value']);
	}
});
//--></script>


<?php //+mod by yp start 
	if($do_edit_code) {?>
<script type="text/javascript"><!--
$(document).ready(function() {
var _t;
for(var _i = 0; _i < $('textarea').length; _i++) {
    if($($('textarea')[_i]).val() == '<?php echo $code; ?>') {
        _t = $('textarea')[_i];
		$(_t).after('<input type="text" id="__edit_code" value="<?php echo $code; ?>" class="form-control" /> <button class="btn btn-default" type="button" id="__edit_code_button" data-loading-text="<?php echo $text_loading; ?>" value="<?php echo $button_edit_code;?>"><?php echo $button_edit_code;?></button>');
		$(_t).hide();		
        break;
    }
}

$(document).on('click', '#__edit_code_button', function() {
	$('#__edit_code_error').remove();
	var node = this;
	var _code = $('#__edit_code').val();
	if(_code == '<?php echo $code; ?>') return;
	if(_code.length < 1) {
		$(node).parent().find('input').after('<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_required; ?></div>');		
		return;
	}
	
	if(_code.length > 20) {
		$(node).parent().find('input').after('<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_long; ?></div>');
		return;
	}	
	
	if(!/^[a-z0-9_\-]+$/.test(_code)) {
		$(node).parent().find('input').after('<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_invalid; ?></div>');
		return;
	}
	if(confirm('<?php echo $warning_edit_code;?>')) {
		
		$.ajax({
			url: '<?php echo $edit_code_link; ?>',
			type: 'post',			
			data: {tracking_input : _code},
			cache: false,
			beforeSend: function() {
				$(node).button('loading');
			},
			complete: function() {
				$(node).button('reset');
			},
			success: function(_r) {
				if(!_r || _r == '0') {
					$(node).parent().find('input').after('<div class="text-danger" id="__edit_code_error"><?php echo $error_tracking_code_exists; ?></div>');
					return;
				}
				document.location.reload();
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});		
	}
});

});
//--></script>
<?php }
	//+mod by yp end 
?>
			
			
<?php echo $footer; ?>