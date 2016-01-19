<?php
// Heading
$_['heading_title']					 = 'First Data EMEA Web Service API';

// Text
$_['text_firstdata_remote']			 = '<img src="view/image/payment/firstdata.png" alt="First Data" title="First Data" style="border: 1px solid #EEEEEE;" />';
$_['text_payment']					 = 'Pago';
$_['text_success']					 = 'Success: You have modified First Data account details!';
$_['text_edit']                      = 'Edit First Data EMEA Web Service API';
$_['text_card_type']				 = 'Tipo de tarjeta';
$_['text_enabled']					 = 'Activado';
$_['text_merchant_id']				 = 'ID Tienda';
$_['text_subaccount']				 = 'Subcuenta';
$_['text_user_id']					 = 'ID de usuario';
$_['text_capture_ok']				 = 'Capture was successful';
$_['text_capture_ok_order']			 = 'Capture was successful, order status updated to success - settled';
$_['text_refund_ok']				 = 'Refund was successful';
$_['text_refund_ok_order']			 = 'Refund was successful, order status updated to refunded';
$_['text_void_ok']					 = 'Void was successful, order status updated to voided';
$_['text_settle_auto']				 = 'Rebajas';
$_['text_settle_delayed']			 = 'Pre auth';
$_['text_mastercard']				 = 'Mastercard';
$_['text_visa']						 = 'Visa';
$_['text_diners']					 = 'Diners';
$_['text_amex']						 = 'American Express';
$_['text_maestro']					 = 'Maestro';
$_['text_payment_info']				 = 'Información de pago';
$_['text_capture_status']			 = 'Payment captured';
$_['text_void_status']				 = 'Pago anulado';
$_['text_refund_status']			 = 'Pago reembolsado';
$_['text_order_ref']				 = 'Ref. de pedido';
$_['text_order_total']				 = 'Total autorizado';
$_['text_total_captured']			 = 'Total captured';
$_['text_transactions']				 = 'Transacciones';
$_['text_column_amount']			 = 'Importe';
$_['text_column_type']				 = 'Tipo';
$_['text_column_date_added']		 = 'Creado';
$_['text_confirm_void']				 = '¿Está seguro de que quiere invalidar el pago?';
$_['text_confirm_capture']			 = 'Are you sure you want to capture the payment?';
$_['text_confirm_refund']			 = '¿Está seguro que desea reembolso el pago?';

// Entry
$_['entry_certificate_path']		 = 'Ruta del certificado';
$_['entry_certificate_key_path']	 = 'Private key path';
$_['entry_certificate_key_pw']		 = 'Contraseña de clave privada';
$_['entry_certificate_ca_path']		 = 'CA path';
$_['entry_merchant_id']				 = 'ID Tienda';
$_['entry_user_id']					 = 'ID de usuario';
$_['entry_password']				 = 'Contraseña';
$_['entry_total']					 = 'Total ';
$_['entry_sort_order']				 = 'Ordenar por';
$_['entry_geo_zone']				 = 'Zona geográfica';
$_['entry_status']					 = 'Estado';
$_['entry_debug']					 = 'Depurar registro';
$_['entry_auto_settle']				 = 'Settlement type';
$_['entry_status_success_settled']	 = 'Success - settled';
$_['entry_status_success_unsettled'] = 'Success - not settled';
$_['entry_status_decline']			 = 'Rechazar';
$_['entry_status_void']				 = 'Anuladas';
$_['entry_status_refund']			 = 'Reembolsado';
$_['entry_enable_card_store']		 = 'Enable card storage tokens';
$_['entry_cards_accepted']			 = 'Card types accepted';

// Help
$_['help_total']					 = 'El total a pagar que el pedido debe alcanzar para que este método se active';
$_['help_certificate']				 = 'Certificates and private keys should be stored outside of your public web folders';
$_['help_card_select']				 = 'Ask the user to choose thier card type before they are redirected';
$_['help_notification']				 = 'You need to supply this URL to First Data to get payment notifications';
$_['help_debug']					 = 'Debug permite escribir datos en un archivo de registro. Siempre deberá estar desactivado si no se indica lo contrario.';
$_['help_settle']					 = 'If you use pre-auth you must complete a post-auth action within 3-5 days otherwise your transaction will be dropped';

// Tab
$_['tab_account']					 = 'Información de la API';
$_['tab_order_status']				 = 'Estado del pedido';
$_['tab_payment']					 = 'Opciones de pago';

// Button
$_['button_capture']				= 'Captura';
$_['button_refund']					= 'Reembolso';
$_['button_void']					= 'Vacío';

// Error
$_['error_merchant_id']				= 'Store ID is required';
$_['error_user_id']					= 'User ID is required';
$_['error_password']				= 'Se requiere una contraseña';
$_['error_certificate']				= 'Certificate path is required';
$_['error_key']						= 'Certificate key is required';
$_['error_key_pw']					= 'Certificate key password is required';
$_['error_ca']						= 'Certificate Authority (CA) is required';