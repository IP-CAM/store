<?php
// Heading  
$_['heading_title']       = 'MultiTier Affiliate System';
$_['heading_title_insert']       = 'MultiTier Affiliate System - Create Scheme';
$_['heading_title_update']       = 'MultiTier Affiliate System - Edit Scheme';

$_['tab_general_settings']       = 'General Settings';
$_['tab_schemes']                = 'Schemes';

// Entry
$_['entry_name']          = 'Affiliate Scheme Name';
$_['entry_is_default']          = 'Default';
$_['help_is_default']          = 'Use this scheme by default';
$_['entry_before_shipping'] = 'No Shipping';
$_['help_before_shipping'] = 'Use the value according to <i>No Shipping</i> setting instead of the total price for calculating commission';
$_['entry_autoadd'] = '<span class="help"></strong>Add Commission</strong> - add commissions to affiliate balance automatically</span>';
$_['entry_autoapprove'] = 'Auto Approve';
$_['help_autoapprove'] = 'Approve new affiliates automatically';
$_['entry_tiers'] = 'Tiers';
$_['entry_tier'] = 'Tier';
$_['entry_level'] = 'Level';
$_['entry_add_tier'] = 'Add Tier';
$_['entry_remove_tier'] = 'remove';
$_['entry_eternal'] = 'Always Include in Commission';
$_['entry_commission_type'] = 'Commission Type';
$_['entry_description'] = 'Description';
$_['entry_new_name'] = 'New name';

// Column
$_['column_commission'] = 'Commission';
$_['column_autoadd'] = 'Add Commission';
$_['column_autoapprove'] = 'Auto Approve';
$_['column_action']       = 'Action';
$_['column_name']         = 'Scheme';
$_['column_code']         = 'Signup Code';

// Text
$_['text_success']        = 'Success: You have modified affiliate schemes!';
$_['text_default_value'] = 'Default';
$_['text_percent']        = 'Percentage';
$_['text_amount']         = 'Fixed Amount';
$_['text_eternal_description'] = 'Normally when current sale&apos;s affiliate level is higher than the number of tiers, affiliates at lower level don&apos;t get any commission. E.g. if you have 4 tier setup, and the affiliate is at 6th level, affiliates at level 6,5,4,3 will get commission, and affiliates at level 2 and 1 will not get anything. However, if you set <strong>Always Include in Commission</strong> to 2, in the same situation commission will be distributed  between 6,5,2,1, while 4 and 3 will not get commission.';
$_['text_unconverted_affiliates'] = 'Affiliates not yet converted to mulitier system';
$_['text_convert_affiliates'] = 'Click here to convert';
$_['text_convert_success'] = 'Affiliates converted successfully !';
$_['text_hide'] = 'Hide';
$_['text_show_usage'] = 'Show Usage';
$_['text_delete_scheme_warning'] = 'Are you really going to delete this affiliate scheme? It is not recommended!';
$_['text_copy_scheme'] = 'Copy to New Scheme';
$_['text_move_users'] = 'Move selected to another scheme:';
$_['text_move'] = 'Move';
$_['text_select_scheme'] = 'Select Scheme';
$_['text_no_fixed_for_affs'] = 'This scheme is used as custom for some affiliates, its commission type can not be Fixed amount';
$_['text_order_id']           = 'Order ID:';
$_['text_link_downline'] = 'Complete Affiliate Downline';
$_['text_add_scheme']    = 'Create New Scheme';
$_['text_edit_scheme']   = 'Edit Scheme';
$_['text_edit'] = 'Edit';

// Error
$_['error_permission']    = 'Warning: You do not have permission to modify affiliate schemes!';
$_['error_name']          = 'Affiliate Scheme Name must be between 3 and 100 characters!';
$_['error_duplicate_name']          = 'Affiliate Scheme with this Name already exists, please choose another name';
$_['error_invalid_percent'] = 'Total percentage must not exceed 100% or be negative!';
$_['error_invalid_commission'] = 'Some commission values are incorrect';
$_['error_invalid_request'] = 'Invalid request';
$_['error_unknown'] = 'Unknown error';
$_['error_database'] = 'Database error';
$_['error_all'] = 'The following errors have occured:';
$_['error_validation'] = 'Validation Error!';
$_['error_no_default'] = 'Please create Default Scheme !';
$_['error_no_default_unconverted'] = 'Please create Default Scheme to be able to convert affiliates !';
$_['error_fixed_aff_commission'] = 'Product-unrelated (affiliate) commission can not be fixed amount!';

// Settings
$_['text_settings'] = 'General Settings';
$_['button_save_settings'] = 'Save Settings';
$_['column_settings_tracking'] = 'Associate customer account with parent affiliate';
$_['column_settings_db_permit'] = 'Permit parent affiliate changing or adding after customer account is created';
$_['column_settings_no_shipping'] = 'No Shipping';
$_['help_settings_no_shipping']   = 'How exactly the price value for commission will be calculated for schemes with <b>No Shipping</b> set to <b>Yes</b>';
$_['column_settings_autoadd_statuses'] = '<b>Add Commission automatically</b> function will be triggered when the order reaches any of these statuses';
$_['help_settings_autoadd_statuses']   = 'Unchecking all checkboxes will effectively turn the function off for all schemes';
$_['column_settings_llaff_priority']   = 'Conflicting Schemes';
$_['help_settings_llaff_priority']     = 'If two or more affiliates in the order have different schemes assigned to them, use the scheme from lower or higher level affiliate. Higher level is closer to the buyer.';
$_['column_settings_explicit_default'] = 'Permanently assign default scheme';
$_['help_settings_explicit_default']   = 'If set to Yes, current Default scheme will be assigned to new affiliates as if <i>&amp;mta=</i> signup code was used, see ReadMe for more details.';
$_['column_settings_downline'] = 'Show Affiliates their downline';
$_['help_settings_downline']   = 'Affiliates will be able to see their sub-affiliate&#039;s name, optionally email and phone number, and also their earnings';
$_['column_settings_recurring'] = 'Pay commissions from PayPal Express Recurring payments';
$_['column_settings_downline_limit']     = 'Number of downline levels affiliates can see';
$_['help_settings_downline_limit']       = 'Enter 0 or leave blank for unlimited';
$_['text_show_downline'] = '';
$_['text_show_downline_email'] = ' including Emails';
$_['text_show_downline_phone'] = ' including Phone numbers';
$_['text_show_downline_earnings'] = ' including Earnings';
$_['error_downline_limit'] = 'Enter positive integer number, or leave blank';
$_['text_settings_llaff_higher'] = 'Higher level';
$_['text_settings_llaff_lower'] = 'Lower level';
$_['text_settings_tracking_permanent'] = 'Permanently in the database';
$_['text_settings_tracking_cookies'] = 'In cookies only <small>(regular openCart behavior)</small>';
$_['text_settings_no_shipping_default'] = 'Subtract shipping, handling &amp; taxes from total price';
$_['text_settings_no_shipping_any'] = 'Ignore all price-increasing modifiers';
$_['text_settings_no_shipping_subtotal'] = 'Use subtotal';
