<?php
// Heading
$_['heading_title']       = 'Tracking Input';
$_['heading_settings']    = 'Settings';
$_['heading_modules']     = 'Layout Modules (for Visitors)';
$_['heading_add_module']  = 'Add Layout Module';
$_['heading_templates']   = 'Templates for Layout Modules';
$_['heading_affiliate_registration'] = 'On Affiliate Registration Page:';
$_['heading_in_modules']  = 'In Layout Modules with the Code Input for Visitors:';

// Text
$_['text_module']         = 'Modules';
$_['text_success']        = 'Success: You have modified the Tracking Input module!';
$_['text_content_top']    = 'Content Top';
$_['text_content_bottom'] = 'Content Bottom';
$_['text_column_left']    = 'Column Left';
$_['text_column_right']   = 'Column Right';
$_['text_show_help']      = 'show help';
$_['text_edit_template']  = 'Edit';
$_['text_copy_to_new']    = 'Copy To New';
$_['text_tpl_name_req']   = 'New template name - use only letters, digits and space';
$_['button_save_template'] = 'Save Template';
$_['text_saved']          = 'Saved.';
$_['text_edit']           = 'Edit Tracking Input';
$_['text_in_use']         = 'In Use';

// Entry
$_['entry_status']        = 'Extension Status';
$_['entry_module_status'] = 'Module Status';
$_['entry_dir_template']  = 'Path to you template directory<br /><small>You can find it by looking in root <i>config.php</i> file, where it says something like:<br />define(\'DIR_TEMPLATE\', \'/path/to/directory/\');<br />Paste the part between quotes (/path/to/directory/ in the example).</small>';
$_['entry_choose_code']   = 'Allow affiliates to come up with their own tracking code';
$_['help_choose_code']    = 'Adds a Tracking Code input to the registration form';
$_['entry_choose_code_account']   = 'Allow affiliates to come up with their own tracking code in <i>account/register</i>';
$_['help_choose_code_account']    = 'Adds a Tracking Code input to the registration form';
$_['entry_choose_code_checkout']  = 'Allow affiliates to come up with their own tracking code in <i>checkout/register</i>';
$_['help_choose_code_checkout']   = 'Adds a Tracking Code input to the registration form';
$_['entry_choose_code_required'] = 'Require affiliates to come up with their own tracking code';
$_['help_choose_code_required']  = 'If set to <i>No</i> and they leave the code input blank when registering, the code will be generated with regular openCart method';
$_['entry_edit_code']     = 'Allow affiliates to change their tracking code';
$_['help_edit_code']      = 'If set to <i>Yes</i>, later after registration tracking code can be changed on Affiliate Tracking page</span>';
$_['entry_redirect']      = 'Redirect to URL with <i>?tracking=</i>';
$_['help_redirect']       = 'When tracking code is submitted, reload the page, but with the tracking code in the URL. Technically it is not needed, tracking code will be saved in cookies even without reloading anyway';
$_['entry_show_close_button']      = 'Show Close icon';
$_['help_show_close_button']       = 'Show icon or link, clicking it will hide the module';
$_['entry_no_cookie_only'] = 'Show modules only when there is no tracking code in cookies';
$_['entry_show'] = 'Show Module';
$_['help_show']  = '<i>Once</i> - only during the first visit, returning visitors will not see it.<br /><i>Once per session</i> - every time, but if during the session the user clicks <i>Close</i> icon, he will not see the module until next visit<br /><i>Always</i> - show on all pages during the session until the user submits tracking code. Clicking <i>Close</i> icon only hides the module on the page user is currently browsing';
$_['entry_allow_coupon'] = 'Allow typing Tracking Code into Coupon input';
$_['help_allow_coupon']  = 'Besides dedicated inputs, customers will be able to type tracking code into regular Coupon input field on the Cart page. This will not prevent or limit usage of regular coupons in any way, but also allow affiliates to pass their Tracking code as Coupon code. However, no customer discount is provided by this module, use Tracking Discount module for that.';
$_['entry_allow_marketing'] = 'Allow typing Marketing Campaign code';

$_['entry_name']          = 'Name';
$_['entry_language']      = 'Language';
$_['entry_head_text_heading']  = 'Heading Text:';
$_['entry_head_text']     = 'Texts';
$_['entry_head_template'] = 'Template';

$_['entry_text_heading'] = 'Heading:';
$_['entry_text'] = 'Form text:';
$_['entry_text_thankyou'] = '&quot;Thank you&quot; text:';
$_['entry_button'] = 'Send button text:';
$_['entry_error_message'] = 'Error message:';

$_['option_once'] = 'Once';
$_['option_session'] = 'Once per session';
$_['option_page'] = 'Always';

//
$_['text_explanation'] = '<b>Form text</b> is the content of the form, that will appear before the tracking code input box. E.g.:<div style="padding-left:10px;width:35%"><div style="font-size:110%;background:#ded;">Were you referred by a friend? Enter their tracking code here:</div><br /><div style="font-size:110%;background:#ded;">Do you have a referral code? Type it in and get a 5% discount!</div></div>HTML tags are allowed.<br /><br /><b>Heading</b> is optional.<br /><br /><b>Thank you text</b> is the text that appears when the tracking code is submitted successfully, while <b>Error message</b> appears when there is an error. <br /><br /><b>Send button text</b> is the label of the button that sends the code, something like <b>OK</b> or <b>Submit</b>.<br /><br />Add a module for every language you use, unless you don&apos;t want it to show up for some languages.<br /><br />When done, modules can be assigned to layouts on <i>System &gt; Design &gt; Layouts</i> page.';
// Error 
$_['warning_used_template'] = '<i>Used in a module, can not be deleted</i>';
$_['warning_default_template'] = '<i>Built-in template can not be deleted</i>';
$_['warning_delete_template'] = 'This is going to remove template file permanently, are you sure?';
$_['warning_edit_template'] = 'This is PHP and HTML source code for the template, please use this function carefully! Please pay extra attention to PHP code and element IDs, they have to be preserved!';
$_['error_permission']    = 'Warning: You do not have permission to modify the module!';
$_['error_dir_template']  = 'Error: Please provide correct template directory!';
$_['error_load_tpl'] = 'Error loading template file';
$_['error_create_tpl'] = 'Error creating template';
$_['error_save_tpl'] = 'Error saving template';
$_['error_delete_tpl'] = 'Error deleting template';
