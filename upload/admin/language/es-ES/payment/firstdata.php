<?php
// Heading
$_['heading_title']					 = 'First Data EMEA Connect (3DSecure enabled)';

// Text
$_['text_payment']					 = 'Pago';
$_['text_success']					 = 'Success: You have modified First Data account details!';
$_['text_edit']                      = 'Edit First Data EMEA Connect (3DSecure enabled)';
$_['text_notification_url']			 = 'URL de notificación';
$_['text_live']						 = 'En vivo';
$_['text_demo']						 = 'Demo';
$_['text_enabled']					 = 'Activado';
$_['text_merchant_id']				 = 'Identificación de la tienda';
$_['text_secret']					 = 'Secreto compartido';
$_['text_capture_ok']				 = 'Capture was successful';
$_['text_capture_ok_order']			 = 'Capture was successful, order status updated to success - settled';
$_['text_void_ok']					 = 'Void was successful, order status updated to voided';
$_['text_settle_auto']				 = 'Rebajas';
$_['text_settle_delayed']			 = 'Pre auth';
$_['text_success_void']				 = 'La operación ha sido anulada';
$_['text_success_capture']			 = 'Transaction has been captured';
$_['text_firstdata']				 = '<img src="view/image/payment/firstdata.png" alt="First Data" title="First Data" style="border: 1px solid #EEEEEE;" />';
$_['text_payment_info']				 = 'Información de pago';
$_['text_capture_status']			 = 'Payment captured';
$_['text_void_status']				 = 'Pago anulado';
$_['text_order_ref']				 = 'Ref. de pedido';
$_['text_order_total']				 = 'Total autorizado';
$_['text_total_captured']			 = 'Total captured';
$_['text_transactions']				 = 'Transacciones';
$_['text_column_amount']			 = 'Importe';
$_['text_column_type']				 = 'Tipo';
$_['text_column_date_added']		 = 'Creado';
$_['text_confirm_void']				 = '¿Está seguro de que quiere invalidar el pago?';
$_['text_confirm_capture']			 = 'Are you sure you want to capture the payment?';

// Entry
$_['entry_merchant_id']				 = 'ID Tienda';
$_['entry_secret']					 = 'Secreto compartido';
$_['entry_total']					 = 'Total ';
$_['entry_sort_order']				 = 'Orden de clasificación';
$_['entry_geo_zone']				 = 'Zona geográfica';
$_['entry_status']					 = 'Estado';
$_['entry_debug']					 = 'Depurar registro';
$_['entry_live_demo']				 = 'Live / Demo';
$_['entry_auto_settle']			  	 = 'Settlement type';
$_['entry_card_select']				 = 'Seleccione tarjeta';
$_['entry_tss_check']				 = 'TSS checks';
$_['entry_live_url']				 = 'Live connection URL';
$_['entry_demo_url']				 = 'Demo connection URL';
$_['entry_status_success_settled']	 = 'Success - settled';
$_['entry_status_success_unsettled'] = 'Success - not settled';
$_['entry_status_decline']		 	 = 'Rechazar';
$_['entry_status_void']				 = 'Anuladas';
$_['entry_enable_card_store']		 = 'Enable card storage tokens';

// Help
$_['help_total']					 = 'El total a pagar que el pedido debe alcanzar para que este método se active';
$_['help_notification']				 = 'You need to supply this URL to First Data to get payment notifications';
$_['help_debug']					 = 'Enabling debug will write sensitive data to a log file. You should always disable unless instructed otherwise';
$_['help_settle']					 = 'If you use pre-auth you must complete a post-auth action within 3-5 days otherwise your transaction will be dropped'; 

// Tab
$_['tab_account']					 = 'Información de la API';
$_['tab_order_status']				 = 'Estado del pedido';
$_['tab_payment']					 = 'Opciones de pago';
$_['tab_advanced']					 = 'Avanzado';

// Button
$_['button_capture']				 = 'Captura';
$_['button_void']					 = 'Vacío';

// Error
$_['error_merchant_id']				 = 'Store ID is required';
$_['error_secret']					 = 'Shared secret is required';
$_['error_live_url']				 = 'Live URL is required';
$_['error_demo_url']				 = 'Demo URL is required';
$_['error_data_missing']			 = 'Faltan datos';
$_['error_void_error']				 = 'Unable to void transaction';
$_['error_capture_error']			 = 'Unable to capture transaction';