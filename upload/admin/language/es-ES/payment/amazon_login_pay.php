<?php
//Headings
$_['heading_title']                 = 'Login and Pay with Amazon';

//Text
$_['text_success']                  = 'Login and Pay with Amazon module has been updated';
$_['text_ipn_url']					= 'URL de cronjob';
$_['text_ipn_token']				= 'Token secreto';
$_['text_us']						= 'US';
$_['text_germany']                  = 'Alemania';
$_['text_uk']                       = 'Reino Unido';
$_['text_live']                     = 'En vivo';
$_['text_sandbox']                  = 'Sandbox';
$_['text_auth']						= 'Autorización';
$_['text_payment']                  = 'Pago';
$_['text_no_capture']               = '--- No Automatic Capture ---';
$_['text_all_geo_zones']            = 'Todas las Geo zonas';
$_['text_button_settings']          = 'Configuración de botón de pago';
$_['text_colour']                   = 'Color';
$_['text_orange']                   = 'Naranja';
$_['text_tan']                      = 'Tan';
$_['text_white']                    = 'Blanco';
$_['text_light']                    = 'Light';
$_['text_dark']                     = 'Oscuro';
$_['text_size']                     = 'Tamaño';
$_['text_medium']                   = 'Mediano';
$_['text_large']                    = 'Grande';
$_['text_x_large']                  = 'Extra grande';
$_['text_background']               = 'Fondo';
$_['text_edit']						= 'Edit Login and Pay with Amazon';
$_['text_amazon_login_pay']         = '<a href="http://go.amazonservices.com/opencart.html" target="_blank" title="Sign-up to Login and Pay with Amazon"><img src="view/image/payment/amazon.png" alt="Login and Pay with Amazon" title="Login and Pay with Amazon" style="border: 1px solid #EEEEEE;" /></a>';
$_['text_amazon_join']              = '<a href="http://go.amazonservices.com/opencart.html" target="_blank" title="Sign-up to Login and Pay with Amazon"><u>Sign-up to Login and Pay with Amazon</u></a>';
$_['entry_login_pay_test']          = 'Test mode';
$_['entry_login_pay_mode']          = 'Payment mode';
$_['text_payment_info']				= 'Información de pago';
$_['text_capture_ok']				= 'Capture was successful';
$_['text_capture_ok_order']			= 'Capture was successful, authorization has been fully captured';
$_['text_refund_ok']				= 'Refund was successfully requested';
$_['text_refund_ok_order']			= 'Refund was successfully requested, amount fully refunded';
$_['text_cancel_ok']				= 'Cancel was successful, order status updated to canceled';
$_['text_capture_status']			= 'Payment captured';
$_['text_cancel_status']			= 'Payment canceled';
$_['text_refund_status']			= 'Pago reembolsado';
$_['text_order_ref']				= 'Ref. de pedido';
$_['text_order_total']				= 'Total authorized';
$_['text_total_captured']			= 'Total captured';
$_['text_transactions']				= 'Transacciones';
$_['text_column_authorization_id']	= 'Amazon Authorization ID';
$_['text_column_capture_id']		= 'Amazon Capture ID';
$_['text_column_refund_id']			= 'Amazon Refund ID';
$_['text_column_amount']			= 'Importe';
$_['text_column_type']				= 'Tipo';
$_['text_column_status']			= 'Estado';
$_['text_column_date_added']		= 'Fecha creación';
$_['text_confirm_cancel']			= 'Are you sure you want to cancel the payment?';
$_['text_confirm_capture']			= 'Are you sure you want to capture the payment?';
$_['text_confirm_refund']			= '¿Está seguro que desea reembolso el pago?';
$_['text_minimum_total']            = 'Minimum Order Total';
$_['text_geo_zone']                 = 'Zona geográfica';
$_['text_status']                   = 'Estado';
$_['text_declined_codes']           = 'Test Decline Codes';
$_['text_sort_order']               = 'Ordenar por';
$_['text_amazon_invalid']           = 'InvalidPaymentMethod';
$_['text_amazon_rejected']          = 'AmazonRejected';
$_['text_amazon_timeout']           = 'TransactionTimedOut';
$_['text_amazon_no_declined']       = '--- No Automatic Declined Authorization ---';

// Columns
$_['column_status']                 = 'Estado';

//entry
$_['entry_merchant_id']             = 'ID comerciante';
$_['entry_access_key']              = 'Tecla de acceso';
$_['entry_access_secret']           = 'Clave secreta';
$_['entry_client_id']               = 'Client ID';
$_['entry_client_secret']           = 'Client Secret';
$_['entry_marketplace']             = 'Marketplace';
$_['entry_capture_status']          = 'Automatic capture status';
$_['entry_pending_status']          = 'Pending Order Status';
$_['entry_ipn_url']					= 'IPN\'s URL';
$_['entry_ipn_token']				= 'Token secreto';
$_['entry_debug']					= 'Depurar registro';


// Help
$_['help_pay_mode']					= 'Payment is only available for US marketplace';
$_['help_capture_status']			= 'Choose order staus that will trigger automatic capture of an authorized payment';
$_['help_ipn_url']					= 'Set this as you merhcant URL in Amazon Seller Central';
$_['help_ipn_token']				= 'Make this long and hard to guess';
$_['help_debug']					= 'Enabling debug will write sensitive data to a log file. You should always disable unless instructed otherwise';
$_['help_declined_codes']			= 'This is for testing purposes only';

// Order Info
$_['tab_order_adjustment']          = 'Order Adjustment';

// Errors
$_['error_permission']              = 'No tiene permisos para modificar este módulo';
$_['error_merchant_id']			    = 'Merchant ID is required';
$_['error_access_key']			    = 'Se requiere una clave de acceso';
$_['error_access_secret']		    = 'Clave secreta es requerida';
$_['error_client_id']			    = 'Client ID is required';
$_['error_client_secret']			= 'Client Key is required';
$_['error_pay_mode']				= 'Payment is only available for US marketplace';
$_['error_curreny']                 = 'Your shop must have %s currency installed and enabled';
$_['error_upload']                  = 'Fallo en la subida';
$_['error_data_missing'] 			= 'Faltan datos requeridos';

// Buttons
$_['button_capture']				= 'Captura';
$_['button_refund']					= 'Reembolso';
$_['button_cancel']					= 'Cancelar';
