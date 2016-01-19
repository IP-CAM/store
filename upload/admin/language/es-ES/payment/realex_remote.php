<?php
// Heading
$_['heading_title']					 = 'Realex Redirect';

// Text
$_['text_payment']				  	 = 'Pagar';
$_['text_success']					 = 'Success: You have modified Realex account details!';
$_['text_edit']                      = 'Editar Realex Remote';
$_['text_live']						 = 'En vivo';
$_['text_demo']						 = 'Demo';
$_['text_card_type']				 = 'Tipo de tarjeta';
$_['text_enabled']					 = 'Activado';
$_['text_use_default']				 = 'Valor por defecto';
$_['text_merchant_id']				 = 'ID comerciante';
$_['text_subaccount']				 = 'Subcuenta';
$_['text_secret']					 = 'Secreto compartido';
$_['text_card_visa']				 = 'Visa';
$_['text_card_master']				 = 'Mastercard';
$_['text_card_amex']				 = 'American Express';
$_['text_card_switch']				 = 'Switch/Maestro';
$_['text_card_laser']				 = 'Láser';
$_['text_card_diners']				 = 'Diners';
$_['text_capture_ok']				 = 'Capture was successful';
$_['text_capture_ok_order']			 = 'Capture was successful, order status updated to success - settled';
$_['text_rebate_ok']				 = 'Descontado con éxito';
$_['text_rebate_ok_order']			 = 'Rebate was successful, order status updated to rebated';
$_['text_void_ok']					 = 'Void was successful, order status updated to voided';
$_['text_settle_auto']				 = 'Auto';
$_['text_settle_delayed']			 = 'Retrasado';
$_['text_settle_multi']				 = 'Multi';
$_['text_url_message']				 = 'You must supply the store URL to your Realex account manager before going live';
$_['text_payment_info']				 = 'Información de pago';
$_['text_capture_status']			 = 'Payment captured';
$_['text_void_status']				 = 'Pago anulado';
$_['text_rebate_status']			 = 'Pago reembolsado';
$_['text_order_ref']				 = 'Ref. de pedido';
$_['text_order_total']				 = 'Total autorizado';
$_['text_total_captured']			 = 'Total captured';
$_['text_transactions']				 = 'Transacciones';
$_['text_column_amount']			 = 'Importe';
$_['text_column_type']				 = 'Tipo';
$_['text_column_date_added']		 = 'Creado';
$_['text_confirm_void']				 = '¿Está seguro de que quiere invalidar el pago?';
$_['text_confirm_capture']			 = 'Are you sure you want to capture the payment?';
$_['text_confirm_rebate']			 = '¿Está seguro que desea reembolso el pago?';
$_['text_realex']					 = '<a target="_blank" href="http://www.realexpayments.co.uk/partner-refer?id=opencart"><img src="view/image/payment/realex.png" alt="Realex" title="Realex" style="border: 1px solid #EEEEEE;" /></a>';

// Entry
$_['entry_merchant_id']				 = 'ID comerciante';
$_['entry_secret']					 = 'Secreto compartido';
$_['entry_rebate_password']			 = 'Rebate password';
$_['entry_total']					 = 'Total ';
$_['entry_sort_order']				 = 'Orden de clasificación';
$_['entry_geo_zone']				 = 'Zona geográfica';
$_['entry_status']					 = 'Estado';
$_['entry_debug']					 = 'Depurar registro';
$_['entry_live_demo']				 = 'Live / Demo';
$_['entry_auto_settle']				 = 'Settlement type';
$_['entry_card_select']				 = 'Seleccione tarjeta';
$_['entry_tss_check']				 = 'TSS checks';
$_['entry_live_url']				 = 'Live connection URL';
$_['entry_demo_url']				 = 'Demo connection URL';
$_['entry_status_success_settled']	 = 'Success - settled';
$_['entry_status_success_unsettled'] = 'Success - not settled';
$_['entry_status_decline']			 = 'Rechazar';
$_['entry_status_decline_pending']	 = 'Decline - offline auth';
$_['entry_status_decline_stolen']	 = 'Decline - lost or stolen card';
$_['entry_status_decline_bank']		 = 'Decline - bank error';
$_['entry_status_void']				 = 'Anuladas';
$_['entry_status_rebate']			 = 'Reembolsado';
$_['entry_notification_url']		 = 'URL de notificación';

// Help
$_['help_total']					 = 'El total a pagar que el pedido debe alcanzar para que este método se active';
$_['help_card_select']				 = 'Ask the user to choose their card type before they are redirected';
$_['help_notification']				 = 'You need to supply this URL to Realex to get payment notifications';
$_['help_debug']					 = 'Debug permite escribir datos en un archivo de registro. Siempre deberá estar desactivado si no se indica lo contrario.';
$_['help_dcc_settle']				 = 'If your subaccount is DCC enabled you must use Autosettle';

// Tab
$_['tab_api']					     = 'API Details';
$_['tab_account']		     		 = 'Cuentas';
$_['tab_order_status']				 = 'Estado del pedido';
$_['tab_payment']					 = 'Opciones de pago';
$_['tab_advanced']					 = 'Avanzado';

// Button
$_['button_capture']				 = 'Captura';
$_['button_rebate']					 = 'Reembolso / devolución';
$_['button_void']					 = 'Vacío';

// Error
$_['error_merchant_id']				 = 'Merchant ID is required';
$_['error_secret']					 = 'Shared secret is required';
$_['error_live_url']				 = 'Live URL is required';
$_['error_demo_url']				 = 'Demo URL is required';
$_['error_data_missing']			 = 'Faltan datos';
$_['error_use_select_card']			 = 'You must have "Select Card" enabled for subaccount routing by card type to work';