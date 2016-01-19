<?php
// Heading
$_['heading_title']        			= 'Configuración del mercado';
$_['text_openbay']					= 'OpenBay Pro';
$_['text_ebay']						= 'eBay';

// Text
$_['text_developer']				= 'Desarrollador / soporte';
$_['text_app_settings']				= 'Configuración de la aplicación';
$_['text_default_import']			= 'Importar configuración predeterminada';
$_['text_payments']					= 'Pagos';
$_['text_notify_settings']			= 'Configuración de notificaciones';
$_['text_listing']					= 'Valores predeterminados de listados';
$_['text_token_register']			= 'Register for your eBay token';
$_['text_token_renew']				= 'Renew your eBay token';
$_['text_application_settings']		= 'La configuración de la aplicación permite configurar la forma de OpenBay Pro funciona y se integra con su sistema.';
$_['text_import_description']		= 'Personaliza el estado de un pedido durante las diferentes etapas. Se puede utilizar un estado de un pedido de eBay que no existe en esta lista.';
$_['text_payments_description']		= 'Pre populate your payment options for new listings, this will save you entering them for every new listing you create.';
$_['text_allocate_1']				= 'Cuando el cliente compra';
$_['text_allocate_2']				= 'When customer had paid';
$_['text_developer_description']	= 'You should not use this area unless instructed to do so';
$_['text_payment_paypal']			= 'PayPal aceptado';
$_['text_payment_paypal_add']		= 'Dirección de email de Paypal';
$_['text_payment_cheque']			= 'Cheque aceptado';
$_['text_payment_card']				= 'Tarjetas aceptadas';
$_['text_payment_desc']				= 'Ver Descripción (por ejemplo, transferencia bancaria)';
$_['text_tax_use_listing'] 			= 'Use tax rate set in eBay listing';
$_['text_tax_use_value']			= 'Use a set value for everything';
$_['text_action_warning']			= 'This action is dangerous so is password protected.';
$_['text_notifications']			= 'Control when customers receive notifications from the application. Enabling update emails can improve your DSR ratings as the user will get updates about their order.';
$_['text_listing_1day']             = 'un día';
$_['text_listing_3day']             = '3 días';
$_['text_listing_5day']             = '5 días';
$_['text_listing_7day']             = '7 días';
$_['text_listing_10day']            = '10 días';
$_['text_listing_30day']            = '30 días';
$_['text_listing_gtc']              = 'Bueno hasta cancelar';
$_['text_api_status']               = 'Estado de la conexión del API';
$_['text_api_ok']                   = 'Connection OK, token expires';
$_['text_api_failed']               = 'Validation failed';
$_['text_api_other']        		= 'Otras acciones';
$_['text_create_date_0']            = 'When added to OpenCart';
$_['text_create_date_1']            = 'Cuando fue creado en eBay';
$_['text_obp_detail_update']        = 'Update your store URL &amp; contact email';
$_['text_success']					= 'Su configuración ha sido guardada';

// Entry
$_['entry_status']					= 'Estado';
$_['entry_token']					= 'Token';
$_['entry_secret']					= 'Secreto';
$_['entry_string1']					= 'Encryption string 1';
$_['entry_string2']					= 'Encryption string 2';
$_['entry_end_items']				= '¿Finalizar artículos?';
$_['entry_relist_items']			= '¿Relistar cuando esté disponible?';
$_['entry_disable_soldout']			= '¿Desactivar el producto cuando no esté disponible?';
$_['entry_debug']					= 'Enable logging';
$_['entry_currency']				= 'Moneda por defecto';
$_['entry_customer_group']			= 'Customer group';
$_['entry_stock_allocate']			= 'Allocate stock';
$_['entry_created_hours']			= 'New order age limit';
$_['entry_empty_data']				= 'Empty ALL data?';
$_['entry_developer_locks']			= 'Remove order locks?';
$_['entry_payment_instruction']		= 'Instrucciones de pago';
$_['entry_payment_immediate']		= 'Immediate payment required';
$_['entry_payment_types']			= 'Payment types';
$_['entry_brand_disable']			= 'Disable brand link';
$_['entry_duration']				= 'Default listing duration';
$_['entry_measurement']				= 'Measurement system';
$_['entry_address_format']			= 'Default address format';
$_['entry_timezone_offset']			= 'Timezone offset';
$_['entry_tax_listing']				= 'Product tax';
$_['entry_tax']						= 'Tax % used for everything';
$_['entry_create_date']				= 'Created date for new orders';
$_['entry_password_prompt']			= 'Please enter your admin password';
$_['entry_notify_order_update']		= 'Order updates';
$_['entry_notify_buyer']			= 'New order - buyer';
$_['entry_notify_admin']			= 'Nueva orden - Administrador';
$_['entry_import_pending']			= 'Import unpaid orders:';
$_['entry_import_def_id']			= 'Import default status:';
$_['entry_import_paid_id']			= 'Status pagado:';
$_['entry_import_shipped_id']		= 'Status del envío:';
$_['entry_import_cancelled_id']		= 'Status de cancelado:';
$_['entry_import_refund_id']		= 'Refunded status:';
$_['entry_import_part_refund_id']	= 'Partially refunded status:';

// Tabs
$_['tab_api_info']					= 'Detalles de la API';
$_['tab_setup']						= 'Configuración';
$_['tab_defaults']					= 'Valores predeterminados de listados';

// Help
$_['help_disable_soldout']			= 'When the item sells out it then disables the product in OpenCart';
$_['help_relist_items'] 			= 'If an item link existed before it will relist previous item if back in stock';
$_['help_end_items']    			= 'If items sell out, should the listing be ended on eBay?';
$_['help_currency']     			= 'Based on currencies from your store';
$_['help_created_hours']   			= 'Orders are new when younger than this limit (in hours). Default is 72';
$_['help_stock_allocate'] 			= 'When should stock be allocated from the store?';
$_['help_payment_instruction']  	= 'Be as descriptive as possible. Do you require payment within a certain time? Do they call to pay by card? Do you have any special payment terms?';
$_['help_payment_immediate'] 		= 'Immediate payment stops unpaid buyers, as an item is not sold until they pay.';
$_['help_listing_tax']     			= 'If you use the rate from listings ensure your items have the correct tax in eBay';
$_['help_tax']             			= 'Used when you import items or orders';
$_['help_duration']    				= 'GTC is only available is you have an eBay shop.';
$_['help_address_format']      		= 'Only used if the country does not have an address format set-up already.';
$_['help_create_date']         		= 'Choose which created time will appear on an order when it is imported';
$_['help_timezone_offset']     		= 'Based on hours. 0 is GMT timezone. Only works if eBay time is used for order creation.';
$_['help_notify_admin']   			= 'Notify the store admin with the default new order email';
$_['help_notify_order_update']		= 'Esto es para las actualizaciones automatizadas, por ejemplo, si actualiza un pedido en eBay, el nuevo estado se actualiza automáticamente en tu tienda.';
$_['help_notify_buyer']        		= 'Notify the user with the default new order email';
$_['help_measurement']        		= 'Elegir qué sistema de medición que desea utilizar para los listados';

// Buttons
$_['button_update']             	= 'Actualizar';
$_['button_repair_links']    		= 'Reparar enlaces del artículo';

// Error
$_['error_api_connect']         	= 'Error al conectar a la API';