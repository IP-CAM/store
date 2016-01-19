<?php
// Heading
$_['heading_title'] 				= 'Nuevo listado Amazon';
$_['text_title_advanced'] 			= 'Listado avanzado';
$_['text_openbay'] 					= 'OpenBay Pro';
$_['text_amazon'] 					= 'Amazon US';

// Buttons
$_['button_new'] 					= 'Crear producto nuevo';
$_['button_amazon_price'] 			= 'Obtener precio de Amazon';
$_['button_list'] 					= 'Listar en Amazon';
$_['button_remove_error'] 			= 'Quitar mensajes de error';
$_['button_save_upload'] 			= 'Guardar y subir';
$_['button_browse'] 				= 'Examinar';
$_['button_saved_listings'] 		= 'Ver listados guardados';
$_['button_remove_links'] 			= 'Eliminar enlaces';
$_['button_create_new_listing'] 	= 'Crear nuevos listados';

// Help
$_['help_sku'] 						= 'Unique product ID assigned by the merchant';
$_['help_restock_date'] 			= 'Esta es la fecha que usted será capaz de enviar cualquier artículo devuelto a un cliente. Esta fecha debe no ser mayor a 30 días desde la fecha listada o los pedidos recibidos pueden ser cancelados automáticamente.';
$_['help_sale_price'] 				= 'El precio de venta debe tener una fecha de inicio y fin';

//Text
$_['text_products_sent'] 			= 'Los productos fueron enviados para su procesamiento';
$_['button_view_on_amazon'] 		= 'Ver en Amazon';
$_['text_list'] 					= 'Listar en Amazon';
$_['text_new'] 						= 'Nuevo';
$_['text_used_like_new'] 			= 'Usado - Como nuevo';
$_['text_used_very_good'] 			= 'Usado - Muy bueno';
$_['text_used_good'] 				= 'Usado - Bueno';
$_['text_used_acceptable'] 			= 'Usado - Aceptable';
$_['text_collectible_like_new'] 	= 'Coleccionables - Como nuevo';
$_['text_collectible_very_good'] 	= 'Coleccionables - Muy bueno';
$_['text_collectible_good'] 		= 'Coleccionables - Bueno';
$_['text_collectible_acceptable'] 	= 'Coleccionables - Aceptable';
$_['text_refurbished'] 				= 'Restaurado';
$_['text_product_not_sent'] 		= 'El producto no fue enviado a Amazon. Razón: %s';
$_['text_not_in_catalog'] 			= 'O, si no está en el catálogo&nbsp;&nbsp;&nbsp;';
$_['text_placeholder_search'] 		= 'Introduzca el nombre del producto, UPC, EAN, ISBN o ASIN';
$_['text_placeholder_condition'] 	= 'Utilice este cuadro para describir el estado de sus productos.';
$_['text_characters'] 				= 'carácteres';
$_['text_uploaded'] 				= '¡Listado(s) guardados han sido subidos!';
$_['text_saved_local'] 				= 'Listado salvado pero no subido todavía';
$_['text_product_sent'] 			= 'Producto fue enviado con éxito a Amazon.';
$_['text_links_removed'] 			= 'Enlaces de productos de Amazon eliminado';
$_['text_product_links'] 			= 'Enlaces de productos';
$_['text_has_saved_listings'] 		= 'Este producto tiene uno o más listados guardados que no está(n) cargado(s)';
$_['text_edit_heading'] 			= 'Editar listado';

// Columns
$_['column_image'] 					= 'Imagen';
$_['column_asin'] 					= 'ASIN (Amazon Standard Identification Number)';
$_['column_price'] 					= 'Precio';
$_['column_action'] 				= 'Acción';
$_['column_name'] 					= 'Nombre del Producto';
$_['column_model'] 					= 'Modelo';
$_['column_combination'] 			= 'Variant Combination';
$_['column_sku_variant'] 			= 'Variant SKU';
$_['column_sku'] 					= 'Product SKU';
$_['column_amazon_sku'] 			= 'SKU de Amazon';

// Entry
$_['entry_sku'] 					= 'SKU';
$_['entry_condition'] 				= 'Estado';
$_['entry_condition_note'] 			= 'Estado';
$_['entry_price'] 					= 'Precio';
$_['entry_sale_price'] 				= 'Precio de venta';
$_['entry_sale_date'] 				= 'Rango de fechas de venta';
$_['entry_quantity'] 				= 'Cantidad';
$_['entry_start_selling'] 			= 'Disponible a partir de la fecha';
$_['entry_restock_date'] 			= 'Fecha de reposición';
$_['entry_country_of_origin'] 		= 'País de origen';
$_['entry_release_date'] 			= 'Fecha de publicación';
$_['entry_from'] 					= 'Desde la fecha';
$_['entry_to'] 						= 'Hasta la fecha';
$_['entry_product'] 				= 'Listado de productos';
$_['entry_category'] 				= 'Categoría de Amazon';

//Tabs
$_['tab_main'] 						= 'Principal';
$_['tab_required'] 					= 'Información necesaria';
$_['tab_additional'] 				= 'Opciones adicionales';

//Errors
$_['error_text_missing'] 			= 'Debe introducir algunos detalles de la búsqueda';
$_['error_data_missing'] 			= 'Faltan datos requeridos';
$_['error_missing_asin'] 			= 'Falta ASIN';
$_['error_marketplace_missing'] 	= 'Por favor seleccione marketplace';
$_['error_condition_missing'] 		= 'Por favor, seleccione la condición';
$_['error_fetch'] 					= 'No se pudo obtener los datos';
$_['error_amazonus_price'] 			= 'No se pudo obtener el precio de Amazon';
$_['error_stock'] 					= 'Usted no puede enumerar un elemento con menos de 1 artículo en stock';
$_['error_sku'] 					= 'Debe introducir un SKU para el elemento';
$_['error_price'] 					= 'Debe especificar un precio para el elemento';
$_['error_connecting'] 				= 'Hubo problema al conectar a la API. Por favor, compruebe su configuración de extensión Amazon Pro OpenBay. Si el problema persiste, póngase en contacto con el soporte.';
$_['error_required'] 				= '¡Este campo es obligatorio!';
$_['error_not_saved'] 				= 'El Listado no se salvó. Compruebe su entrada.';
$_['error_char_limit'] 				= 'Demasiados caracteres.';
$_['error_length'] 					= 'Longitud mínima es';
$_['error_upload_failed'] 			= 'Error cargando producto con SKU: "%s". Motivo: "%s" Proceso de carga cancelado.';
$_['error_load_nodes'] 				= 'No se pueden cargar nodos de navegación';
$_['error_not_searched'] 			= 'Buscar artículos coincidentes antes de intentar listarlos. Los artículos deben coincidir con un elemento del catálogo de Amazon.';