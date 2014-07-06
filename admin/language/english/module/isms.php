<?php
################################################################################################
#  DIY Module Builder for Opencart 1.5.1.x From HostJars http://opencart.hostjars.com   	   #
################################################################################################

/*
 * This file contains the english version of any static text required by your module in the admin area.
 * If you want to translate your module to another language, the idea is that you can just replace the
 * right hand column below with the changed language, rather than modifying every file in your module.
 * 
 * We will call these language strings through in the controller to make them available in the view. 
 * 
 * For your module, think about any text that you want to display and add it in here. Also replace all the
 * "NovinPayamak" text for the name of your module.
 * 
 */

// Example field added (see related part in admin/controller/module/novinpayamak.php)
$_['novinpayamak_example'] = 'Example Extra Text';



// Heading Goes here:
$_['heading_title']    = 'NovinPayamak';


// Text
$_['text_module']     = 'Modules';
$_['text_success']     = 'Success: You have modified module NovinPayamak!';
$_['text_novinpayamak_balance']   = 'Please set your username and password';
$_['text_start_novinpayamak']   = 'Click <a href="%s">here</a> to start sending SMS with NovinPayamak.';
$_['text_contact_example']   = 'Country Code + Phone Number (e.g. 60123456789 for Malaysia)';
$_['text_admin_alert_register']   = 'Alert admin when customer registers an account';
$_['text_admin_alert_checkout']   = 'Alert admin when customer checkouts';
$_['text_customer_alert_ckeckout']   = 'Alert customer when customer successfully checkouts';
$_['text_customer_alert_order_status']   = 'Alert customer when order status is updated';
$_['text_admin_alert_additional_settings']   = 'Additional Alert Settings: ';
$_['text_admin_alert_include_items']    = 'Include ordered items in SMS';
$_['text_admin_alert_allow_long_message']    = 'Allow long message if message length exceeds 159 characters for ASCII or 69 for Unicode';

// Button
$_['button_send_sms']   = 'Send SMS';

// Entry
$_['entry_novinpayamak_balance']   = 'NovinPayamak Balance:';
$_['entry_novinpayamak_username']    = 'NovinPayamak Username:'; // this will be pulled through to the controller, then made available to be displayed in the view.
$_['entry_novinpayamak_password']    = 'NovinPayamak Password:';
$_['entry_novinpayamak_admin_contact']    = 'Admin Contact:';
$_['entry_novinpayamak_message_type']    = 'Message Type:';
$_['entry_novinpayamak_admin_alert']    = 'Admin Alert:';
$_['entry_novinpayamak_customer_alert']    = 'Customer Alert:';

// Error
$_['error_permission'] = 'Warning: You do not have permission to modify module NovinPayamak!';
?>