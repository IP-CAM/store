$(document).ready(function () {
    $('#affiliate_dt').dataTable( {
        'bProcessing': true,
        'bServerSide': true,
        'sAjaxSource': document.location.href.replace(/(?:sale|customer)\/customer(?:\/\w*)/, 'mta/mta_affiliate_dt'),
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
              var _name = $($(this).find('td')[1]).text();
              $('#affiliate_td span').empty();
			  var _href = document.location.href.replace(/customer_id=\d+/, 'affiliate_id='+_id).replace('customer', 'affiliate');
			  if(_href.indexOf('affiliate_id') == -1) _href += '&affiliate_id='+_id;
              var _a = $('<a/>').attr('href', _href).attr('target', '_blank').text(_name).appendTo($('#affiliate_td span'));
              $('input[name="affiliate_id"]').val(_id);  
              $('input[name="affiliate_name"]').val(_name);                            
            });
        }        
    } );
    
$('#affiliate_set_none').on('click', function() {
	$('#affiliate_td span').html(TEXT_NONE_MTA);
	$('input[name="affiliate_id"]').val('0');
	$('input[name="affiliate_name"]').val('');
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
