<?php

// Heading
$_['heading_title']    = 'Tracking Discount';
$_['text_edit']        = 'Edit Tracking Discount';

// Text
$_['text_total']       = 'Order totals';
$_['text_success']     = 'Success: You have modified tracking discount!';
$_['text_percent']     = 'Percent (%)';
$_['text_fixed']       = 'Fixed (%s)';

$_['text_when_all']    = 'to All orders';
$_['text_when_first']  = 'to First order only';
$_['text_when_period'] = 'Periodically';

$_['text_what_total']   = 'Total';
$_['text_what_all_all'] = 'All products with quantities';
$_['text_what_all_one'] = 'All products, but only 1 item of each';
$_['text_what_min_all'] = 'Least expensive product with quantities';
$_['text_what_min_one'] = 'Least expensive product, only 1 item';
$_['text_what_max_all'] = 'Most expensive product with quantities';
$_['text_what_max_one'] = 'Most expensive product, only 1 item';

// Entry
$_['entry_amount']     = 'Discount Amount';
$_['entry_type']       = 'Discount Type';
$_['entry_fixed_max']  = 'Maximum discount for Fixed type (%)';
$_['help_fixed_max']   = 'if fixed discount amount is higher than this % of total, it will be reduced. E.g. total is 10, discount is 6 (60%), this value is set to 50% - discount will be reduced to 5 (50%).';

$_['entry_fixed_per_item'] = 'Apply Fixed Discount to each item';
$_['help_fixed_per_item']  = 'e.g. fixed discount is 2, order contains 2 items of one product and 1 item of another, total 3. If this is set to Yes, discount will be 2 * 3 = 6.';

$_['entry_when']       = 'Apply Discount';
$_['help_when']        = 'setting this to anything except <i>All orders</i> will also deny the discount to unregistered (guest) customers !';

$_['entry_period']     = 'Discount Period (days)';
$_['help_period']      = 'if &apos;Apply Discount to orders&apos; set to Periodically, indicate the period in days here, e.g. 3 means that the customer will get the discount once every 3 days.';

$_['entry_what']       = 'Apply % Discount';
$_['help_what']        = 'to products in the order. If set to Total, discount will be applied to Total value according to Sort order, e.g. if Sub Total has sort order 1, and tracking discount has sort order 2, discount will be applied to Sub Total value. It is possible to include shipping etc. If set to anything other than Total, discount will be applied to price.';

$_['entry_no_coupon']  = 'Apply discount when coupon is used';
$_['help_no_coupon']   = 'if set to No, coupon sort order must be lower than tracking discount&apos;s for the discount not to be applied.';

$_['entry_status']     = 'Status';
$_['entry_sort_order'] = 'Sort Order';

$_['entry_apply_to']   = 'Give Discount to users referred by affiliates, marketing campaigns, or both';
$_['text_affiliates']  = 'Affiliates';
$_['text_marketing_campaigns'] = 'Marketing Campaigns';
$_['text_both']        = 'Both';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify tracking discount!';
$_['error_amount']     = 'Error: Discount amount should be integer or floating point number, e.g. 10, 12.5 etc.';
$_['error_fixed_max']  = 'Error: Maximum discount for Fixed type should be integer or floating point number, e.g. 10, 12.5 etc.';
$_['error_period']     = 'Error: Discount period should be integer number, e.g. 2, 10 etc.';
$_['error_sort_order'] = 'Error: Sort order should be integer number, e.g. 2, 10 etc.';



