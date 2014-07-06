<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="location = '<?php echo $send_sms; ?>';" class="button"><span><?php echo $button_send_sms; ?></span></a><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <table class="form">
        <tr>
          <td><?php echo $entry_novinpayamak_balance; ?></td>
          <td><?php echo $novinpayamak_balance; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_novinpayamak_username; ?></td>
          <td><input type="text" name="novinpayamak_username" value="<?php echo $novinpayamak_username; ?>"></td>
        </tr>
        <tr>
          <td><?php echo $entry_novinpayamak_password; ?></td>
          <td><input type="password" name="novinpayamak_password" value="<?php echo $novinpayamak_password; ?>"></td>
        </tr>
        <tr>
          <td><?php echo $entry_novinpayamak_message_type; ?></td>
          <td><input type="radio" name="novinpayamak_message_type" value="1" <?php echo ($novinpayamak_message_type==1?'checked':''); ?>> Normal (Eg. English, B. Melayu, etc) <input type="radio" name="novinpayamak_message_type" value="2" <?php echo ($novinpayamak_message_type==2?'checked':''); ?>> Unicode (Eg. Chinese, Japanese, etc)</td>
        </tr>
        <tr>
          <td><?php echo $entry_novinpayamak_admin_contact; ?></td>
          <td><input type="text" name="novinpayamak_admin_contact" value="<?php echo $novinpayamak_admin_contact; ?>"> <?php echo $text_contact_example; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_novinpayamak_admin_alert; ?></td>
          <td>
		<input type="checkbox" name="novinpayamak_admin_alert_register" value="1" <?php echo ($novinpayamak_admin_alert_register==1?'checked':''); ?>> <?php echo $text_admin_alert_register; ?> <br>
		<input type="checkbox" name="novinpayamak_admin_alert_checkout" value="1" <?php echo ($novinpayamak_admin_alert_checkout==1?'checked':''); ?>> <?php echo $text_admin_alert_checkout; ?> <br>
		<div style="padding-left: 23px">
			<?php echo $text_admin_alert_additional_settings; ?> <br>
			<input type="checkbox" name="novinpayamak_admin_alert_include_items" value="1" <?php echo ($novinpayamak_admin_alert_include_items==1?'checked':''); ?>>  <?php echo $text_admin_alert_include_items; ?> <br>
			<input type="checkbox" name="novinpayamak_admin_alert_allow_long_message" value="1" <?php echo ($novinpayamak_admin_alert_allow_long_message==1?'checked':''); ?>>  <?php echo $text_admin_alert_allow_long_message; ?> <br>
		</div>
          </td>
        </tr>
        <tr>
          <td><?php echo $entry_novinpayamak_customer_alert; ?></td>
          <td>
		<input type="checkbox" name="novinpayamak_customer_alert_ckeckout" value="1" <?php echo ($novinpayamak_customer_alert_ckeckout==1?'checked':''); ?>> <?php echo $text_customer_alert_ckeckout; ?> <br>
		<input type="checkbox" name="novinpayamak_customer_alert_order_status" value="1" <?php echo ($novinpayamak_customer_alert_order_status==1?'checked':''); ?>> <?php echo $text_customer_alert_order_status; ?> <br>
          </td>
        </tr>
        <?php if($novinpayamak_username != "" && $novinpayamak_password != ""){ ?>
        <tr>
          <td colspan="2"><?php echo $text_start_novinpayamak; ?></td>
        </tr>
        <?php } ?>
      </table>
    </form>
  </div>
</div>
<?php echo $footer; ?>