(function() {
		var _loaded = {};
		var _loading = false;
		var _ovl_params = {
      mask: {
      	color: '#efefef',
        loadSpeed: 250,
        zIndex: '999999959',
      	opacity: 0.9
      },
      top: 10,
      closeOnClick: false
    }
    
	$.fn._make_aff_table = function() {
		return this.each(function() {
		var pfx = $(this).attr('id').replace(/_link$/, '');
		var _str = '<?php 
		
		$_str = '<table class="list" id="^^^+pfx+^^^_table" style="display:none;width:50%;"> 
						<thead> 
							<td class="right">' . $column_mta_scheme . '</td> 
							<td class="left">' . $column_affiliates . '</td>							
						</thead> 
						<tbody>'; 
		foreach($schemes as $_sid => $_sname) {
			$_str .= '
							<tr>
								<td class="right">' . $_sname . '
								</td>
								<td class="left">
									<div>
										<span id="^^^+pfx+^^^_total_' . $_sid . '" style="font-weight:bold;">0</span> 										<a id="^^^+pfx+^^^_edit_' . $_sid . '" href="javascript:;" style="display:none;" rel="#affiliate_dt_overlay_div">' . $text_edit . '</a>
									</div>
									<div>
										<a id="^^^+pfx+^^^_add_' . $_sid . '" href="javascript:;" rel="#affiliate_dt_overlay_div">' . $text_add . '</a>																
									</div>
								</td>
							</tr>';
		}
		$_str .= '</tbody>
					</table>';
		$_str = mta_esqq(str_replace(array("\r", "\n"), array('', ''), $_str));
		$_str = str_replace('^^^', "'", $_str);
		echo $_str;
		?>';
		$(this).parent().after(_str);
		});
	}    

		var _dataTable = function(filter_ids, input_sel, total_sel, pfx, _this) {
			var _ids = $(input_sel).val();
			if(filter_ids == 'exclude') {
				var _all_ids = [];
				$('input[id^="'+pfx+'_"]').each(function() {
					if($(this).val().length > 0) _all_ids.push($(this).val());
				});
				_all_ids = _all_ids.join(',');
			} else {
				var _all_ids = _ids;
			}
			//console.log('input: '+input_sel);//-tmp
			//console.log('total: '+total_sel);//-tmp
			
    	$('#affiliate_dt').dataTable({
    		'bDestroy' : true,
        'bProcessing': true,
        'bServerSide': true,
        'sAjaxSource': document.location.href.replace(/catalog\/product(?:\/\w*)/, 'mta/mta_affiliate_dt'),
        'sServerMethod' : 'POST',
        'sPaginationType' : 'full_numbers',
        'iDisplayLength' : 25,
        'aoColumns': [
        		{ 'mDataProp': 'id', 'bSearchable' : false, 'bSortable' : false },
            { 'mDataProp': 'name' },
            { 'mDataProp': 'email' },
            { 'mDataProp': 'scheme', 'bSearchable' : false, 'bSortable' : false },            
            { 'mDataProp': 'level', 'bSearchable' : false},
            { 'mDataProp': 'balance', 'bSearchable' : false, 'bSortable' : false},
            { 'mDataProp': 'date_added', 'bSearchable' : false  }
        ],

    			'fnServerParams': function (aoData) {
      			aoData.push({'name' : 'filter_ids', 'value' : filter_ids});
      			aoData.push({'name' : 'ids', 'value' : _all_ids});
    			},
    			
      	  'fnDrawCallback': function() { 
      	  	$('.affiliate_dt_row').each(function() {  
      	  		var _chbv = $(this).find('td:first').text();
            	$($(this).find('td:first')).prepend('<input type="checkbox" value="'+_chbv+'" />');
            });
						$('.overlay_close').click(function() {
							$(_this).overlay().close();					
						});            
            $('#affiliate_dt_save_button').click(function () {
            	var _ids_ar = _ids.length > 0 ? _ids.split(',') : [];
            	var _preselected_ids = [];
            	var _selected_ids = [];
            	$('.affiliate_dt_row :checked').each(function() {
            		_preselected_ids.push($(this).val());
            	});							
            	//console.log('pre ids: '+_preselected_ids);//-tmp
            	if(filter_ids == 'include') {
        				for(var _i = 0; _i < _ids_ar.length; _i++) {
        					if($.inArray(_ids_ar[_i], _preselected_ids) == -1) _selected_ids.push(_ids_ar[_i]);
        				}
            	} else {
            		_selected_ids = _ids_ar;
        				for(var _i = 0; _i < _preselected_ids.length; _i++) {
        					if($.inArray(_preselected_ids[_i], _ids_ar) == -1) _selected_ids.push(_preselected_ids[_i]);
        				}            		
            	}            	            	
							$(total_sel).text(_selected_ids.length);
							var _scheme_id = $(_this).attr('id').match(/\d+$/)[0];
							//console.log('scheme id: '+_scheme_id);//-tmp
							//console.log('sel ids: '+_selected_ids);//-tmp
							if(_selected_ids.length > 0) {
								$('#'+pfx+'_edit_'+_scheme_id).show();								
							} else {
								$('#'+pfx+'_edit_'+_scheme_id).hide();								
							}
							$(input_sel).val(_selected_ids.join(','));
              $(_this).overlay().close();              
            });
        	}        
    	});
    }
		
		$('a[id$="_affiliates_link"]')._make_aff_table();
		$(document).on('click', 'a[id$="_affiliates_link"]', function() {
			if(_loading) return;
			_loading = true;
			var pfx = $(this).attr('id').replace(/_link$/, '');
			$('input[id^="'+pfx+'_"]').each(function() {
				$(this).attr('name', $(this).attr('name').replace(/^_/, ''));
			})
			if(_loaded[pfx]) {
				$('#'+pfx+'_table').toggle();
				_loading = false;
				return;
			}
			var _pfxar = pfx.split('_');
			if(_pfxar.length == 2) {
				var _pmt = '';
				var _pmid = 0;
			} else {
				var _pmt = _pfxar[1];
				var _pmid = _pfxar[2];
			}
			var _loc = document.location.href.replace('/product/edit', '/product/get_affiliates');
			if(_pmt != '') _loc += '&mod_type='+_pmt;
			if(_pmid) _loc += '&mod_id='+_pmid;
			
			$.getJSON(_loc, function(r) {
				for(var _scheme_id in r) {
					if(!$.isArray(r[_scheme_id])) continue;
					$('#'+pfx+'_'+_scheme_id).val(r[_scheme_id].join(','));					
					$('#'+pfx+'_total_'+_scheme_id).text(r[_scheme_id].length);
					$('#'+pfx+'_edit_'+_scheme_id).show();
				}
				$('a[id^="'+pfx+'_edit_"]').overlay(_ovl_params);
				$('a[id^="'+pfx+'_edit_"]').click(function() {					
					$('.overlay_close').unbind();
					$('#affiliate_dt_save_button').unbind();
					var _this = this;					
					var _scheme_id = $(this).attr('id').match(/\d+$/)[0];
					$('#affiliate_dt_save_button').val('<?php echo mta_jsstr($button_remove_selected);?>');
					_dataTable('include', '#'+pfx+'_'+_scheme_id, '#'+pfx+'_total_'+_scheme_id, pfx, _this);					
				});
				
				$('a[id^="'+pfx+'_add_"]').overlay(_ovl_params);
				$('a[id^="'+pfx+'_add_"]').click(function() {
					$('.overlay_close').unbind();
					$('#affiliate_dt_save_button').unbind();
					var _this = this;
					var _scheme_id = $(this).attr('id').match(/\d+$/)[0];
					$('#affiliate_dt_save_button').val('<?php echo mta_jsstr($button_add_selected);?>');
					_dataTable('exclude', '#'+pfx+'_'+_scheme_id, '#'+pfx+'_total_'+_scheme_id, pfx, _this);
				});
				_loaded[pfx] = true;
				$('#'+pfx+'_table').toggle();				
				_loading = false;
			});
		});			

})();
