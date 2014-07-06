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
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/mail.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="location = '<?php echo $module_settings; ?>';" class="button"><span><?php echo $button_module_settings; ?></span></a><a onclick="$('#form').submit();" class="button"><span><?php echo $button_send; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
    </div>
    <div class="content">
	<div id="tabs" class="htabs"><a id="tab_general" href="#tab-general"><?php echo $tab_novinpayamak_general; ?></a><a id="tab_report" href="#tab-report"><?php echo $tab_novinpayamak_report; ?></a></div>
	<div id="tab-general">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		  <table id="mail" class="form">
		    <tr>
			<td><?php echo $entry_novinpayamak_balance; ?></td>
			<td><?php echo $novinpayamak_balance; ?></td>
		    </tr>
		    <tr>
			<td><?php echo $entry_to; ?></td>
			<td><select name="to">
			    <?php if ($to == 'customer_all') { ?>
			    <option value="customer_all" selected="selected"><?php echo $text_customer_all; ?></option>
			    <?php } else { ?>
			    <option value="customer_all"><?php echo $text_customer_all; ?></option>
			    <?php } ?>
			    <?php if ($to == 'customer_group') { ?>
			    <option value="customer_group" selected="selected"><?php echo $text_customer_group; ?></option>
			    <?php } else { ?>
			    <option value="customer_group"><?php echo $text_customer_group; ?></option>
			    <?php } ?>
			    <?php if ($to == 'customer') { ?>
			    <option value="customer" selected="selected"><?php echo $text_customer; ?></option>
			    <?php } else { ?>
			    <option value="customer"><?php echo $text_customer; ?></option>
			    <?php } ?>
			  </select></td>
		    </tr>
		    <tbody id="to-customer-group" class="to">
			<tr>
			  <td><?php echo $entry_customer_group; ?></td>
			  <td><select name="customer_group_id">
				<?php foreach ($customer_groups as $customer_group) { ?>
				<?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
				<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
				<?php } ?>
				<?php } ?>
			    </select></td>
			</tr>
		    </tbody>
		    <tbody id="to-customer" class="to">
			<tr>
			  <td><?php echo $entry_customer; ?></td>
			  <td><input type="text" name="customers" value="" /></td>
			</tr>
			<tr>
			  <td>&nbsp;</td>
			  <td><div class="scrollbox" id="customer">
				<?php $class = 'odd'; ?>
				<?php foreach ($customers as $customer) { ?>
				<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
				<div id="customer<?php echo $customer['customer_id']; ?>" class="<?php echo $class; ?>"><?php echo $customer['name']; ?><img src="view/image/delete.png" />
				  <input type="hidden" name="customer[]" value="<?php echo $customer['customer_id']; ?>" />
				</div>
				<?php } ?>
			    </div></td>
			</tr>
		    </tbody>
		    <tr>
			<td><?php echo $entry_message_type; ?></td>
			<td><input type="radio" name="novinpayamak_message_type" value="0" <?php echo ($novinpayamak_message_type==0?'checked':''); ?>> Normal  <input type="radio" name="novinpayamak_message_type" value="1" <?php echo($novinpayamak_message_type==1?'checked':''); ?>> Flash </td>
		    </tr>
		    <tr>
			<td><span class="required">*</span> <?php echo $entry_message; ?><div id="charNum">0 character(s)</div></td>
			<td><textarea name="message" rows="10" cols="100"><?php echo $message; ?></textarea>
			  <?php if ($error_message) { ?>
			  <span class="error"><?php echo $error_message; ?></span>
			  <?php } ?></td>
		    </tr>
		    <tr>
			<td colspan="2"><?php echo $text_novinpayamak_edit; ?></td>
		    </tr>
		  </table>
		</form>
      </div>
      <div id="tab-report">
        <table class="list">
          <thead>
            <tr>
              <td class="left"><?php if ($sort == 'novinpayamak_report_id') { ?>
                <a href="<?php echo $sort_id; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_id; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_id; ?>"><?php echo $column_id; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'novinpayamak_source') { ?>
                <a href="<?php echo $sort_source; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_source; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_source; ?>"><?php echo $column_source; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'novinpayamak_destination') { ?>
                <a href="<?php echo $sort_destination; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_destination; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_destination; ?>"><?php echo $column_destination; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'novinpayamak_message') { ?>
                <a href="<?php echo $sort_message; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_message; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_message; ?>"><?php echo $column_message; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'novinpayamak_message_type') { ?>
                <a href="<?php echo $sort_message_type; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_message_type; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_message_type; ?>"><?php echo $column_message_type; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'novinpayamak_server_status') { ?>
                <a href="<?php echo $sort_server_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_server_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_server_status; ?>"><?php echo $column_server_status; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'novinpayamak_sent_on') { ?>
                <a href="<?php echo $sort_sent_on; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sent_on; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_sent_on; ?>"><?php echo $column_sent_on; ?></a>
                <?php } ?></td>
                <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td><input type="text" name="filter_id" value="<?php echo $filter_id; ?>" /></td>
              <td><input type="text" name="filter_source" value="<?php echo $filter_source; ?>" /></td>
              <td><input type="text" name="filter_destination" value="<?php echo $filter_destination; ?>" /></td>
              <td><input type="text" name="filter_message" value="<?php echo $filter_message; ?>" /></td>
              <td><select name="filter_message_type">
                  <option value="*"></option>
                  <?php if ($filter_message_type == "1") { ?>
                  <option value="1" selected="selected"><?php echo $text_ascii; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_ascii; ?></option>
                  <?php } ?>
                  <?php if ($filter_message_type == "2") { ?>
                  <option value="2" selected="selected"><?php echo $text_unicode; ?></option>
                  <?php } else { ?>
                  <option value="2"><?php echo $text_unicode; ?></option>
                  <?php } ?>
                </select></td>
              <td><input type="text" name="filter_server_status" value="<?php echo $filter_server_status; ?>" /></td>
              <td><input type="text" name="filter_sent_on" value="<?php echo $filter_sent_on; ?>" size="12" id="date" /></td>
              <td align="right"><a onclick="filter();" class="button"><span><?php echo $button_filter; ?></span></a></td>
            </tr>
            <?php if ($novinpayamak_reports) { ?>
            <?php foreach ($novinpayamak_reports as $report) { ?>
            <tr>
              <td class="left"><?php echo $report['novinpayamak_report_id']; ?></td>
              <td class="left"><?php echo $report['novinpayamak_source']; ?></td>
              <td class="left"><?php echo $report['novinpayamak_destination']; ?></td>
              <td class="left"><?php echo $report['novinpayamak_message']; ?></td>
              <td class="left"><?php echo $report['novinpayamak_message_type']; ?></td>
              <td class="left"><?php echo $report['novinpayamak_server_status']; ?></td>
              <td class="left"><?php echo $report['novinpayamak_sent_on']; ?></td>
              <td class="right">&nbsp;</td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--	
$('textarea[name=\'message\']').keyup(function () {
	
	if($('input[name=\'novinpayamak_message_type\']:checked').val() == 1) var max = 159;
	else if($('input[name=\'novinpayamak_message_type\']:checked').val() == 2) var max = 69;
	
	var len = $(this).val().length; //alert(len);
	if (len >= max) {
		$(this).val($(this).val().substr(0, max));
		$('#charNum').text($(this).val().length + ' character(s), you have reached the limit');
	} else {
		//var char = max - len;
		$('#charNum').text(len + ' character(s)');
	}
});

$('input[name=\'novinpayamak_message_type\']').change(function () {
	
	if($(this).val()==1) var max = 159;
	else if($(this).val()==2) var max = 69;
	
	var len = $('textarea[name=\'message\']').val().length; //alert(len);
	if (len >= max) {
		$('textarea[name=\'message\']').val($('textarea[name=\'message\']').val().substr(0, max));
		$('#charNum').text($('textarea[name=\'message\']').val().length + ' character(s), you have reached the limit');
	} else {
		//var char = max - len;
		$('#charNum').text(len + ' character(s)');
	}
});

$('select[name=\'to\']').bind('change', function() {
	$('#mail .to').hide();
	
	$('#mail #to-' + $(this).attr('value').replace('_', '-')).show();
});

$('select[name=\'to\']').trigger('change');
//--></script>
<script type="text/javascript"><!--
$.widget('custom.catcomplete', $.ui.autocomplete, {
	_renderMenu: function(ul, items) {
		var self = this, currentCategory = '';
		
		$.each(items, function(index, item) {
			if (item.category != currentCategory) {
				ul.append('<li class="ui-autocomplete-category">' + item.category + '</li>');
				
				currentCategory = item.category;
			}
			
			self._renderItem(ul, item);
		});
	}
});

$('input[name=\'customers\']').catcomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {	
				response($.map(json, function(item) {
					return {
						category: item.customer_group,
						label: item.name,
						value: item.customer_id
					}
				}));
			}
		});
		
	}, 
	select: function(event, ui) {
		$('#customer' + ui.item.value).remove();
		
		$('#customer').append('<div id="customer' + ui.item.value + '">' + ui.item.label + '<img src="view/image/delete.png" alt="" /><input type="hidden" name="customer[]" value="' + ui.item.value + '" /></div>');

		$('#customer div:odd').attr('class', 'odd');
		$('#customer div:even').attr('class', 'even');
				
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('#customer div img').live('click', function() {
	$(this).parent().remove();
	
	$('#customer div:odd').attr('class', 'odd');
	$('#customer div:even').attr('class', 'even');	
});
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#<?php echo $filter_tab; ?>').trigger('click');
//--></script> 
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=sale/novinpayamak&token=<?php echo $token; ?>';
	
	var filter_id = $('input[name=\'filter_id\']').attr('value');
	
	if (filter_id) {
		url += '&filter_id=' + encodeURIComponent(filter_id);
	}
	
	var filter_source = $('input[name=\'filter_source\']').attr('value');
	
	if (filter_source) {
		url += '&filter_source=' + encodeURIComponent(filter_source);
	}
	
	var filter_destination = $('input[name=\'filter_destination\']').attr('value');
	
	if (filter_destination) {
		url += '&filter_destination=' + encodeURIComponent(filter_destination);
	}
	
	var filter_message = $('input[name=\'filter_message\']').attr('value');
	
	if (filter_message) {
		url += '&filter_message=' + encodeURIComponent(filter_message);
	}
	
	var filter_message_type = $('select[name=\'filter_message_type\']').attr('value');
	
	if (filter_message_type != '*') {
		url += '&filter_message_type=' + encodeURIComponent(filter_message_type);
	}	
	
	var filter_server_status = $('input[name=\'filter_server_status\']').attr('value');
	
	if (filter_server_status) {
		url += '&filter_server_status=' + encodeURIComponent(filter_server_status);
	}
		
	var filter_sent_on = $('input[name=\'filter_sent_on\']').attr('value');
	
	if (filter_sent_on) {
		url += '&filter_sent_on=' + encodeURIComponent(filter_sent_on);
	}
	
	url += '&filter_tab=' + encodeURIComponent("tab_report");
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?>