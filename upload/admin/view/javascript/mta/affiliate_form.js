$(document).ready(function () { 
    $('#affiliate_dt').dataTable( {
        'bProcessing': true,
        'bServerSide': true,
        'sAjaxSource': document.location.href.replace(/marketing\/affiliate(?:\/\w*)/, 'mta/mta_affiliate_dt'),
        'sServerMethod' : 'POST',
        'sPaginationType' : 'full_numbers',
        'iDisplayLength' : 10,
        'aoColumns': [
        		{ 'mDataProp': 'id', 'bSearchable' : false, 'bSortable' : false },
            { 'mDataProp': 'name' },
            { 'mDataProp': 'email' },
            { 'mDataProp': 'scheme', 'bSearchable' : false, 'bSortable' : false },            
            { 'mDataProp': 'level', 'bSearchable' : false},
            { 'mDataProp': 'balance', 'bSearchable' : false, 'bSortable' : false},
            { 'mDataProp': 'date_added', 'bSearchable' : false  }
        ],

        'fnDrawCallback': function(){            
            $('.affiliate_dt_row').css({'cursor' : 'pointer'});
            $('.affiliate_dt_row').on('click', function () {
              $('#affiliate_dt_overlay_open').overlay().close();
              var _id = $(this).attr('id').split('-')[1];
			  var _aff_id = document.location.href.match(/affiliate_id=(\d+)/);
			  if(_aff_id && _aff_id.length > 1) {
				_aff_id = _aff_id[1];              
				if(_id == _aff_id) return;
			  }
              var _name = $($(this).find('td')[1]).text();
              $('#parent_affiliate_span').empty();
			  var _href = document.location.href.replace(/affiliate_id=\d+/, 'affiliate_id='+_id);
			  if(_href.indexOf('affiliate_id') == -1) _href += '&affiliate_id='+_id;
              var _a = $('<a/>').attr('href', _href).attr('target', '_blank').text(_name).appendTo($('#parent_affiliate_span')); 
              $('input[name="parent_affiliate_id"]').val(_id);  
              $('input[name="parent_affiliate_name"]').val(_name);  
              $('#level_span').text($('#level_span').text().replace(/\d+/g, (parseInt($($(this).find('td')[4]).text()) + 1)+'')); 
            });
        }        
    } );
    
$('#affiliate_set_none').on('click', function() {
	$('#parent_affiliate_span').html(TEXT_NONE_MTA);
	$('input[name="parent_affiliate_id"]').val('0');
	$('input[name="parent_affiliate_name"]').val('');
	$('#level_span').text($('#level_span').text().replace(/\d+/g, '1'));
});             	
    
$('#affiliate_dt_overlay_open').overlay({
        	mask: {
        		color: '#efefef',
            loadSpeed: 200,
            zIndex: '999999959',
        		opacity: 0.9
        	},
		top: 10,
        	closeOnClick: false
      });
$('.overlay_close').on('click', function() {
  	$('#affiliate_dt_overlay_open').overlay().close();
});      
});