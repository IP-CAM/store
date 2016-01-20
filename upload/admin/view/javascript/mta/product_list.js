$(document).ready(function() {
	
	$('.mta_schemes').on('click', function() {
		$(this).parent().find('.mta_schemes_div').show();
		$(this).hide();
		$(this).parent().find('.mta_schemes_hide').show();		
	});

	$('.mta_schemes_hide').on('click', function() {
		$(this).parent().find('.mta_schemes_div').hide();
		$(this).hide();
		$(this).parent().find('.mta_schemes').show();		
	});		
});

