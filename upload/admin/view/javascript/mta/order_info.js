$(document).on('click', '[id^="commission-add-"]', function() {
	var _id = $(this).attr('id').replace(/[^\d]+/g, '');
	$.ajax({
		type: 'POST',
		url: 'index.php?route=sale/order/addcommission&token='+TOKEN_MTA+'&order_id='+ORDER_ID_MTA+'&affiliate_id='+_id,
		dataType: 'json',
		beforeSend: function() {
			$('#commission-add-'+_id).button('loading');
		},
		complete: function() {
			$('#commission-add-'+_id).button('reset');
		},			
		success: function(json) {
			$('.alert').remove();
						
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                $('#commission-add-'+_id).hide();
				$('#commission-remove-'+_id).show();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$(document).on('click', '[id^="commission-remove-"]', function() {
	var _id = $(this).attr('id').replace(/[^\d]+/g, '');
	$.ajax({
		type: 'POST',
		url: 'index.php?route=sale/order/removecommission&token='+TOKEN_MTA+'&order_id='+ORDER_ID_MTA+'&affiliate_id='+_id,
		dataType: 'json',
		beforeSend: function() {
			$('#commission-remove-'+_id).button('loading');
		},
		complete: function() {
			$('#commission-remove-'+_id).button('reset');
		},			
		success: function(json) {
			$('.alert').remove();
						
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
                $('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                $('#commission-remove-'+_id).hide();
				$('#commission-add-'+_id).show();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});
