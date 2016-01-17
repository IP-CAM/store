<?php
//Headings
$_['heading_title']                 = 'Login and Pay with Amazon';

//Text
$_['text_success']                  = 'Login and Pay with Amazon module has been updated';
$_['text_ipn_url']					= 'URL du planificateur CRON';
$_['text_ipn_token']				= 'Jeton secret';
$_['text_us']						= 'US';
$_['text_germany']                  = 'Allemagne';
$_['text_uk']                       = 'Royaume-Uni';
$_['text_live']                     = 'Production';
$_['text_sandbox']                  = 'Bac à sable';
$_['text_auth']						= 'Autorisation';
$_['text_payment']                  = 'Paiement';
$_['text_no_capture']               = '--- No Automatic Capture ---';
$_['text_all_geo_zones']            = 'Toutes les zones géographiques';
$_['text_button_settings']          = 'Paramètres du bouton Payer';
$_['text_colour']                   = 'Couleur';
$_['text_orange']                   = 'Orange';
$_['text_tan']                      = 'Brun';
$_['text_white']                    = 'Blanc';
$_['text_light']                    = 'Clair';
$_['text_dark']                     = 'Foncé';
$_['text_size']                     = 'Taille';
$_['text_medium']                   = 'Moyen';
$_['text_large']                    = 'Grand';
$_['text_x_large']                  = 'Très grand';
$_['text_background']               = 'Arrière-plan';
$_['text_edit']						= 'Edit Login and Pay with Amazon';
$_['text_amazon_login_pay']         = '<a href="http://go.amazonservices.com/opencart.html" target="_blank" title="Sign-up to Login and Pay with Amazon"><img src="view/image/payment/amazon.png" alt="Login and Pay with Amazon" title="Login and Pay with Amazon" style="border: 1px solid #EEEEEE;" /></a>';
$_['text_amazon_join']              = '<a href="http://go.amazonservices.com/opencart.html" target="_blank" title="Sign-up to Login and Pay with Amazon"><u>Sign-up to Login and Pay with Amazon</u></a>';
$_['entry_login_pay_test']          = 'Test mode';
$_['entry_login_pay_mode']          = 'Payment mode';
$_['text_payment_info']				= 'Informations de paiement';
$_['text_capture_ok']				= 'La réception du paiement a réussi';
$_['text_capture_ok_order']			= 'Capture was successful, authorization has been fully captured';
$_['text_refund_ok']				= 'Refund was successfully requested';
$_['text_refund_ok_order']			= 'Refund was successfully requested, amount fully refunded';
$_['text_cancel_ok']				= 'Cancel was successful, order status updated to canceled';
$_['text_capture_status']			= 'Paiement reçu';
$_['text_cancel_status']			= 'Payment canceled';
$_['text_refund_status']			= 'Paiement remboursé';
$_['text_order_ref']				= 'Référence de la commande';
$_['text_order_total']				= 'Total authorized';
$_['text_total_captured']			= 'Total capturé';
$_['text_transactions']				= 'Transactions';
$_['text_column_authorization_id']	= 'Amazon Authorization ID';
$_['text_column_capture_id']		= 'Amazon Capture ID';
$_['text_column_refund_id']			= 'Amazon Refund ID';
$_['text_column_amount']			= 'Montant';
$_['text_column_type']				= 'Type';
$_['text_column_status']			= 'Statut';
$_['text_column_date_added']		= 'Date d\'ajout';
$_['text_confirm_cancel']			= 'Are you sure you want to cancel the payment?';
$_['text_confirm_capture']			= 'Êtes-vous certain de vouloir réceptionner le paiement ?';
$_['text_confirm_refund']			= 'Êtes-vous sûr de vouloir effectuer un remboursement du paiement?';
$_['text_minimum_total']            = 'Minimum Order Total';
$_['text_geo_zone']                 = 'Zone géographique';
$_['text_status']                   = 'Statut';
$_['text_declined_codes']           = 'Test Decline Codes';
$_['text_sort_order']               = 'Ordre de présentation';
$_['text_amazon_invalid']           = 'InvalidPaymentMethod';
$_['text_amazon_rejected']          = 'AmazonRejected';
$_['text_amazon_timeout']           = 'TransactionTimedOut';
$_['text_amazon_no_declined']       = '--- No Automatic Declined Authorization ---';

// Columns
$_['column_status']                 = 'Statut';

//entry
$_['entry_merchant_id']             = 'ID marchand';
$_['entry_access_key']              = 'Clef d\'accès';
$_['entry_access_secret']           = 'Clef secrète';
$_['entry_client_id']               = 'Identifiant';
$_['entry_client_secret']           = 'Client Secret';
$_['entry_marketplace']             = 'Places de marché';
$_['entry_capture_status']          = 'Automatic capture status';
$_['entry_pending_status']          = 'Pending Order Status';
$_['entry_ipn_url']					= 'IPN\'s URL';
$_['entry_ipn_token']				= 'Jeton secret';
$_['entry_debug']					= 'Enregistrement de débogage';


// Help
$_['help_pay_mode']					= 'Payment is only available for US marketplace';
$_['help_capture_status']			= 'Choose order staus that will trigger automatic capture of an authorized payment';
$_['help_ipn_url']					= 'Set this as you merhcant URL in Amazon Seller Central';
$_['help_ipn_token']				= 'Utilisez une valeur longue et difficile à deviner';
$_['help_debug']					= 'En activant le débogage, vous autorisez l\'écriture de données sensibles dans un fichier journal. Vous devriez toujours désactiver cette fonction sauf avis contraire.';
$_['help_declined_codes']			= 'This is for testing purposes only';

// Order Info
$_['tab_order_adjustment']          = 'Configuration de la commande';

// Errors
$_['error_permission']              = 'Vous n\'êtes pas autorisé à modifier ce module';
$_['error_merchant_id']			    = 'L\'identifiant marchand est requis.';
$_['error_access_key']			    = 'La clef d\'accès rapide est requise.';
$_['error_access_secret']		    = 'La clef secrète est requise.';
$_['error_client_id']			    = 'Client ID is required';
$_['error_client_secret']			= 'Client Key is required';
$_['error_pay_mode']				= 'Payment is only available for US marketplace';
$_['error_curreny']                 = 'Votre boutique doit avoir la devise %s installée et activée.';
$_['error_upload']                  = 'Le téléchargement a échoué';
$_['error_data_missing'] 			= 'Les données requises sont manquantes.';

// Buttons
$_['button_capture']				= 'Capture';
$_['button_refund']					= 'Remboursement';
$_['button_cancel']					= 'Annuler';
