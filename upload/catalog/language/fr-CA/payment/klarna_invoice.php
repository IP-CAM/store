<?php
// Text
$_['text_title']				= 'Facturation Klarna - Paiement dans les 14 jours';
$_['text_terms_fee']			= '<span id="klarna_invoice_toc"></span> (+%s)<script type="text/javascript">var terms = new Klarna.Terms.Invoice({el: \'klarna_invoice_toc\', eid: \'%s\', country: \'%s\', charge: %s});</script>';
$_['text_terms_no_fee']			= '<span id="klarna_invoice_toc"></span><script type="text/javascript">var terms = new Klarna.Terms.Invoice({el: \'klarna_invoice_toc\', eid: \'%s\', country: \'%s\'});</script>';
$_['text_additional']			= 'La facturation Klarna requiert des informations complémentaires pour pouvoir procéder à votre commande.';
$_['text_male']					= 'Homme';
$_['text_female']				= 'Femme';
$_['text_year']					= 'Année';
$_['text_month']				= 'Mois';
$_['text_day']					= 'Jour';
$_['text_comment']				= 'Klarna\'s Invoice ID: %s. ' . "\n" . '%s/%s: %.4f';

// Entry
$_['entry_gender']				= 'Genre';
$_['entry_pno']					= 'Numéro personnel';
$_['entry_dob']					= 'Date de naissance';
$_['entry_phone_no']			= 'Numéro de téléphone';
$_['entry_street']				= 'Rue';
$_['entry_house_no']			= 'Numéro de rue';
$_['entry_house_ext']			= 'Supplément au numéro de rue';
$_['entry_company']				= 'Numéro d\'enregistrement de la société';

// Help
$_['help_pno']					= 'Veuillez saisir votre numéro de sécurité sociale ici.';
$_['help_phone_no']				= 'Veuillez saisir votre numéro de téléphone.';
$_['help_street']				= 'Veuillez prendre note que la livraison ne pourra se faire qu\'à l\'adresse enregistrée avec Klarna.';
$_['help_house_no']				= 'Veuillez saisir un numéro de rue.';
$_['help_house_ext']			= 'Veuillez saisir le supplément au numéro de rue, par exemple: a, B, C, etc.';
$_['help_company']				= 'Veuillez saisir le numéro d\'enregistrement de votre société';

// Error
$_['error_deu_terms']			= 'Attention: vous devez accepter la politique de confidentialité de Klarna (Datenschutz)';
$_['error_address_match']		= 'Attention: les adresses de facturation et de livraison doivent concorder si vous souhaitez utiliser la facturation Klarna';
$_['error_network']				= 'Attention: une erreur est survenue lors de la connexion à Klarna. Veuillez essayer à nouveau plus tard.';