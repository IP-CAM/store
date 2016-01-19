<?php
// Heading
$_['heading_title']					= 'Globalpay Remote';

// Text
$_['text_payment']					= 'Pago';
$_['text_success']					= 'Success: You have modified Globalpay account details!';
$_['text_edit']                     = 'Edit Globalpay Remote';
$_['text_card_type']				= 'Tipo de tarjeta';
$_['text_enabled']					= 'Activado';
$_['text_use_default']				= 'Valor por defecto';
$_['text_merchant_id']				= 'ID comerciante';
$_['text_subaccount']				= 'Subcuenta';
$_['text_secret']					= 'Secreto compartido';
$_['text_card_visa']				= 'Visa';
$_['text_card_master']				= 'Mastercard';
$_['text_card_amex']				= 'American Express';
$_['text_card_switch']				= 'Switch/Maestro';
$_['text_card_laser']				= 'Láser';
$_['text_card_diners']				= 'Diners';
$_['text_capture_ok']				= 'Capture was successful';
$_['text_capture_ok_order']			= 'Capture was successful, order status updated to success - settled';
$_['text_rebate_ok']				= 'Rebate was successful';
$_['text_rebate_ok_order']			= 'Rebate was successful, order status updated to rebated';
$_['text_void_ok']					= 'Void was successful, order status updated to voided';
$_['text_settle_auto']				= 'Auto';
$_['text_settle_delayed']			= 'Retrasado';
$_['text_settle_multi']				= 'Multi';
$_['text_ip_message']				= 'You must supply your server IP address to your Globalpay account manager before going live';
$_['text_payment_info']				= 'Información de pago';
$_['text_capture_status']			= 'Payment captured';
$_['text_void_status']				= 'Pago anulado';
$_['text_rebate_status']			= 'Pago reembolsado';
$_['text_order_ref']				= 'Ref. de pedido';
$_['text_order_total']				= 'Total autorizado';
$_['text_total_captured']			= 'Total captured';
$_['text_transactions']				= 'Transacciones';
$_['text_confirm_void']				= '¿Está seguro de que quiere invalidar el pago?';
$_['text_confirm_capture']			= 'Are you sure you want to capture the payment?';
$_['text_confirm_rebate']			= '¿Está seguro que desea reembolso el pago?';
$_['text_globalpay_remote']			= '<a target="_blank" href="https://resourcecentre.globaliris.com/getting-started.php?id=OpenCart"><img src="view/image/payment/globalpay.png" alt="Globalpay" title="Globalpay" style="border: 1px solid #EEEEEE;" /></a>';

// Column
$_['text_column_amount']			= 'Importe';
$_['text_column_type']				= 'Tipo';
$_['text_column_date_added']		= 'Creado';

// Entry
$_['entry_merchant_id']				= 'ID comerciante';
$_['entry_secret']					= 'Secreto compartido';
$_['entry_rebate_password']			= 'Rebate password';
$_['entry_total']					= 'Total ';
$_['entry_sort_order']				= 'Orden de clasificación';
$_['entry_geo_zone']				= 'Zona geográfica';
$_['entry_status']					= 'Estado';
$_['entry_debug']					= 'Depurar registro';
$_['entry_auto_settle']				= 'Settlement type';
$_['entry_tss_check']				= 'TSS checks';
$_['entry_card_data_status']		= 'Card info logging';
$_['entry_3d']						= 'Enable 3D secure';
$_['entry_liability_shift']			= 'Accept non-liability shifting scenarios';
$_['entry_status_success_settled']	= 'Success - settled';
$_['entry_status_success_unsettled'] = 'Success - not settled';
$_['entry_status_decline']			= 'Rechazar';
$_['entry_status_decline_pending']	= 'Decline - offline auth';
$_['entry_status_decline_stolen']	= 'Decline - lost or stolen card';
$_['entry_status_decline_bank']		= 'Decline - bank error';
$_['entry_status_void']				= 'Anuladas';
$_['entry_status_rebate']			= 'Reembolsado';

// Help
$_['help_total']					= 'El total a pagar que el pedido debe alcanzar para que este método se active';
$_['help_card_select']				= 'Ask the user to choose thier card type before they are redirected';
$_['help_notification']				= 'You need to supply this URL to Globalpay to get payment notifications';
$_['help_debug']					= 'Debug permite escribir datos en un archivo de registro. Siempre deberá estar desactivado si no se indica lo contrario.';
$_['help_liability']				= 'Accepting liability means you will still accept payments when a user fails 3D secure.';
$_['help_card_data_status']			= 'Logs last 4 cards digits, expire, name, type and issuing bank information';

// Tab
$_['tab_api']					    = 'API Details';
$_['tab_account']				    = 'Cuentas';
$_['tab_order_status']				= 'Estado del pedido';
$_['tab_payment']					= 'Opciones de pago';

// Button
$_['button_capture']				= 'Captura';
$_['button_rebate']					= 'Reembolso / devolución';
$_['button_void']					= 'Vacío';

// Error
$_['error_merchant_id']				= 'Merchant ID is required';
$_['error_secret']					= 'Shared secret is required';