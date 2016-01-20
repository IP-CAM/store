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
      <div class="pull-right">
        <button type="button" id="form_submit_button" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title_insert; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="alert alert-danger" style="display:none;"><i class="fa fa-exclamation-circle"></i> <span id="error"></span>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_add_scheme; ?></h3>
      </div>
      <div class="panel-body">      
	  <form action="<?php echo $add; ?>" method="post" enctype="multipart/form-data" id="form-mta-insert" class="form-horizontal" onsubmit="javascript:return false;">

		<div class="form-group required">
			<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
				<input type="text" name="name" value="" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
            <div class="col-sm-10">
				<textarea name="description" id="input-description" class="form-control" placeholder="<?php echo $entry_description; ?>"></textarea>
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_is_default; ?>"><?php echo $entry_is_default; ?></span></label>
            <div class="col-sm-10">
			  <label class="radio-inline">
                <input type="radio" name="is_default" value="1" />
                <?php echo $text_yes; ?>
			  </label>
			  <label class="radio-inline">
                <input type="radio" name="is_default" value="0" checked="checked" />
                <?php echo $text_no; ?>
			  </label>
            </div>
        </div>	  
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-tiers"><?php echo $entry_tiers; ?></label>
            <div class="col-sm-10">
              	<select name="max_levels" id="input-tiers" class="form-control">
              		<option value="1" selected="selected">1</option>
              		<?php for($__i = 2; $__i <= 50; $__i++) { ?>
              		<option value="<?php echo $__i; ?>"><?php echo $__i; ?></option>
              	<?php } ?>
              	</select>	
            </div>
        </div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><?php echo $entry_commission_type; ?></label>
            <div class="col-sm-10">
			  <label class="radio-inline">
                <input type="radio" name="commission_type" value="percentage" checked="checked" />
                <?php echo $text_percent; ?>
			  </label>				
			  <label class="radio-inline">
                <input type="radio" name="commission_type" value="fixed" />
                <?php echo $text_amount; ?>
			  </label>
            </div>
        </div>	  
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_before_shipping; ?>"><?php echo $entry_before_shipping; ?></span></label>
            <div class="col-sm-10">
			  <label class="radio-inline">
                <input type="radio" name="before_shipping" value="1" checked="checked" />
                <?php echo $text_yes; ?>
			  </label>				
			  <label class="radio-inline">
                <input type="radio" name="before_shipping" value="0" />
                <?php echo $text_no; ?>
			  </label>
            </div>
        </div>	
		<div class="form-group">
			<label class="col-sm-2 control-label" for="input-eternal"><span data-toggle="tooltip" title="<?php echo $text_eternal_description; ?>"><?php echo $entry_eternal; ?></span></label>
            <div class="col-sm-10">              	
              	<select name="eternal" id="input-eternal" class="form-control">
              		<option value="0" selected="selected"><?php echo $text_no; ?></option>
              		<?php for($__i = 1; $__i <= 50; $__i++) { ?>
              		<option value="<?php echo $__i; ?>"><?php echo $__i; ?></option>
					<?php } ?>
              	</select>					
            </div>
        </div>		
		<h2><?php echo $column_commission; ?></h2>
		<div class="help"><?php echo $entry_autoadd; ?></div>
        <div class="table-responsive">
          <table class="table table-bordered table-hover" id="commission_table">
            <thead>
				<tr>
					<td>&nbsp;</td>
					<td class="text-left" id="tier_level_td_1"><?php echo $entry_level; ?> 1</td>
				</tr>
			</thead>            		
			<tbody>
				<tr class="tier_tr" id="tier_tr_1">
					<td class="text-right">1-<?php echo $entry_tier; ?>
						<div id="total_div_1">10.00%</div>
					</td>
					<td class="text-left" id="tier_td_1_1">
						<?php echo $column_commission; ?>:<br />
						<input type="text" name="tiers1_level1_commission" value="10.00" class="form-control" /><br />
						<?php echo $column_autoadd; ?>:<br />
						<input type="radio" name="tiers1_level1_autoadd" value="1" checked="checked" /><?php echo $text_yes;?>
						<input type="radio" name="tiers1_level1_autoadd" value="0"><?php echo $text_no; ?>
					</td>
				</tr>
			</tbody>
		  </table>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_autoapprove; ?>"><?php echo $entry_autoapprove; ?></span></label>
            <div class="table-responsive">
              <table class="table table-striped" id="autoapprove_table">
            	<tbody>
					<tr id="autoapprove_tr_1">
            			<td class="text-right" style="width:50px;"><?php echo $entry_level; ?> 1</td>
            			<td class="text-left">
						  <label class="radio-inline">
							<input type="radio" name="level1_autoapprove" value="1" checked="checked" /><?php echo $text_yes; ?>
						  </label>
						  <label class="radio-inline">						  
							<input type="radio" name="level1_autoapprove" value="0" /><?php echo $text_no; ?>
						  </label>							
            			</td>
            		</tr>
            	</tbody>
			</table>
          </div>
        </div>               
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
	
$(document).ready(function () { 
	
	var _num_levels = 1;
	var _waiting = false;
	
	var failform = function(msg) {
		$('#error').html(msg);
		$('#error').parent().show();
		_waiting = false;
		return false;
	}
	
	var get_num_levels = function() {
		_num_levels = parseInt($('select[name="max_levels"]').find('option:selected').val());
		return _num_levels;
	}
	
	_num_levels = get_num_levels();
	
	var tpl = {
		empty_td : $('<td style="background-color:#dedede;">&nbsp;</td>'),
		tier_level_td : $('#tier_level_td_1').clone(),
		tier_tr : $('#tier_tr_1').clone(),
		tier_td : $('#tier_td_1_1').clone(),		
		autoapprove_tr : $('#autoapprove_tr_1').clone()		
	}	
	$(tpl.tier_tr).find('td:last').remove();
	
	var sprintf04f = MTA_UTIL.sprintf04f;
	
	var calc_total = function(tier) {
		var _total = 0;
		$('input[name^="tiers'+tier+'_"][type="text"]').each(function() {
			var _v = parseFloat($(this).val());			
			if(_v) _total += _v;			
		});		
		return sprintf04f(_total);
	}	
	
	var set_total = function(tier) {
		var _txt = $('div[id="total_div_'+tier+'"]').text();
		$('div[id="total_div_'+tier+'"]').text(_txt.replace(/\d+\.\d+/, calc_total(tier)));
	}
	
	var change_tl = function() {
			$(this).val(sprintf04f($(this).val()));
			var _tier = $(this).attr('name').match(/^tiers(\d+)/)[1];			
			set_total(_tier);
	}		
	
		$('#form_submit_button').on('click', function() {
			$('#error').parent().hide();
			if(_waiting === true) return;
			_waiting = true;
			
			$('input[name="name"]').val($('input[name="name"]').val().replace(/^\s+/, '').replace(/\s+$/, ''));
			var _nl  = $('input[name="name"]').val().length;
			if(_nl < 3 || _nl > 100) return failform('<?php echo mta_jsstr($error_name);?>');			
			
			var _cms = $('input[name^="tiers"][type="text"]');
			for(var i = 0;i < _cms.length; i++) {
				if(!(/^\d+(\.\d{1,4})?$/.test($(_cms[i]).val()))) return failform('<?php echo mta_jsstr($error_invalid_commission);?>');				
			}			
			
      if($('input[name="commission_type"]:checked').val() == 'percentage') {      	
      	_num_levels = get_num_levels();
      	for(var _i = 1; _i <= _num_levels; _i++) {
      		if(calc_total(_i) > 100 || calc_total(_i) < 0) return failform('<?php echo mta_jsstr($entry_tier);?> '+_i+': <?php echo mta_jsstr($error_invalid_percent);?>');    	  	
      	}
      }
      
      $.get(document.location.href.replace('add', 'check_scheme_name')+'&name='+encodeURIComponent($('input[name="name"]').val()), function(r) {
		$('#error').parent().hide();
      	if(!(parseInt(r))) return failform('<?php echo mta_jsstr($error_duplicate_name);?>');

      	jQuery.post(
      		document.location.href+'&',      		
      		$('#form-mta-insert').serialize(),
      		function(d) {
      			if(d == '1') {
      				document.location.href = document.location.href.replace('/add', '');
      				return;
      			}
      			return failform(d);
      		},
      		'text'
      	);      	
      });      
		});		

		$('input[name^="tiers"][type="text"]').on('change', change_tl);
		
		$('select[name="max_levels"]').on('change', function() {
			var _old_num_levels = _num_levels;
			_num_levels = get_num_levels();
			if(_num_levels > _old_num_levels) {				
								
				for(var i = (_old_num_levels + 1); i <= _num_levels; i++) {
					var _tltd = tpl.tier_level_td.clone();
					_tltd.attr('id', 'tier_level_td_'+i);
					_tltd.text(_tltd.text().replace(/\d+$/, i));
					$('#commission_table thead tr').append(_tltd);
					
					var _ttr = tpl.tier_tr.clone();
					_ttr.attr('id', 'tier_tr_'+i);
					$($(_ttr).find('td')).html($($(_ttr).find('td')).html().replace(/\d+/, i));					
					if($('input[name="commission_type"]:checked').val() != 'percentage') $($(_ttr).find('#total_div_1')).text($($(_ttr).find('#total_div_1')).text().replace('%', ''));
					$($(_ttr).find('#total_div_1')).attr('id', 'total_div_'+i);
					
					
					$('#commission_table tbody').append(_ttr);
					for(var ii = 1; ii <= i; ii++) {						
						var _ttd = tpl.tier_td.clone();
						_ttd.attr('id', 'tier_td_'+i+'_'+ii);
						$($(_ttd).find('input[name^="tiers"]')).each(function() {
							$(this).attr('name', $(this).attr('name').replace(/^tiers\d+_level\d+/, 'tiers'+i+'_level'+ii));
						});
						$('#tier_tr_'+i).append(_ttd);
					}
					
					for(var i2 = 1; i2 < i; i2++) {						
						$('#tier_tr_'+i2).append(tpl.empty_td.clone());
					}
					
					var _atr = tpl.autoapprove_tr.clone();
					var _atr_td = $(_atr.find('td:first'));
					_atr_td.text(_atr_td.text().replace(/ \d+$/, ' '+i));
					$(_atr.find('input[name^="level"]')).attr('name', 'level'+i+'_autoapprove');
					_atr.attr('id', 'autoapprove_tr_'+i);
					$('#autoapprove_table').append(_atr);
					set_total(i);
				}	
				$('input[name^="tiers"][type="text"]').on('change', change_tl);
							
			} else if(_num_levels < _old_num_levels) {
				for(var i = _old_num_levels; i > _num_levels; i--) {
					$('#autoapprove_tr_'+i).remove();
					$('#tier_tr_'+i).remove();					
					$('#tier_level_td_'+i).remove();
					$($('tr[id^="tier_tr"]').find('td:last')).remove();
				}
				var _s = $('select[name="eternal"]').find('option:selected');
				if(_s.val() > _num_levels) {
					_s.prop('selected', false);
					$('select[name="eternal"]').find('option[value="0"]').prop('selected', true);
				}
			}			
		});
		
		$('select[name="eternal"]').on('change', function() {
			if($(this).find('option:selected').val() > _num_levels) {
				$(this).find('option:selected').prop('selected', false);
				$(this).find('option[value="0"]').prop('selected', true);
			}
		});
		
		$('input[name="commission_type"]').on('change', function(){			
			if($('input[name="commission_type"]:checked').val() == 'percentage') {
				$('input[name="is_default"]').parent().parent().show();
				$('input[name="before_shipping"]').parent().parent().show();				
				$('div[id^="total_div_"]').each(function() {
					$(this).text($(this).text()+'%');
				});
			} else {
				$('input[name="is_default"]').parent().parent().show();
				$('input[name="before_shipping"]').parent().parent().show();								
				$('div[id^="total_div_"]').each(function() {
					$(this).text($(this).text().replace('%', ''));
				});
			}			
		});		
});	
//--></script>	
<?php echo $footer; ?></div>