<?php
################################################################################################
#  DIY Module Builder for Opencart 1.5.1.x From HostJars http://opencart.hostjars.com  		   #
################################################################################################
class ControllerModuleNovinPayamak extends Controller {
	
	private $error = array(); 
	
	public function index() {   
		//Load the language file for this module
		$this->load->language('module/novinpayamak');

		//Set the title from the language file $_['heading_title'] string
		$this->document->setTitle($this->language->get('heading_title'));
		
		//Load the settings model. You can also add any other models you want to load here.
		$this->load->model('setting/setting');
		
		//Save the settings if the user has submitted the admin form (ie if someone has pressed save).
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('novinpayamak', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		//This is how the language gets pulled through from the language file.
		//
		// If you want to use any extra language items - ie extra text on your admin page for any reason,
		// then just add an extra line to the $text_strings array with the name you want to call the extra text,
		// then add the same named item to the $_[] array in the language file.
		//
		// 'novinpayamak_example' is added here as an example of how to add - see admin/language/english/module/novinpayamak.php for the
		// other required part.
		
		$text_strings = array(
				'heading_title',
				'text_novinpayamak_balance',
				'text_contact_example',
				'text_start_novinpayamak',
				'text_send_sms',
				'text_admin_alert_register',
				'text_admin_alert_checkout',
				'text_customer_alert_ckeckout',
				'text_customer_alert_order_status',
				'text_admin_alert_additional_settings',
				'text_admin_alert_include_items',
				'text_admin_alert_allow_long_message',
				'button_save',
				'button_cancel',
				'button_send_sms',
				'entry_novinpayamak_balance',
				'entry_novinpayamak_admin_contact',
				'entry_novinpayamak_message_type',
				'entry_novinpayamak_username',
				'entry_novinpayamak_admin_alert',
				'entry_novinpayamak_customer_alert',
				'entry_novinpayamak_password' //this is an example extra field added
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}
		//END LANGUAGE
		
		//The following code pulls in the required data from either config files or user
		//submitted data (when the user presses save in admin). Add any extra config data
		// you want to store.
		//
		// NOTE: These must have the same names as the form data in your novinpayamak.tpl file
		//
		$config_data = array(
				'novinpayamak_admin_contact',
				'novinpayamak_message_type',
				'novinpayamak_username',
				'novinpayamak_admin_alert_register',
				'novinpayamak_admin_alert_checkout',
				'novinpayamak_admin_alert_include_items',
				'novinpayamak_admin_alert_allow_long_message',
				'novinpayamak_customer_alert_ckeckout',
				'novinpayamak_customer_alert_order_status',
				'novinpayamak_password' //this becomes available in our view by the foreach loop just below.
		);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$this->data[$conf] = $this->request->post[$conf];
			} else {
				$this->data[$conf] = $this->config->get($conf);
			}
		}
		
		if($this->data['novinpayamak_username'] == "" || $this->data['novinpayamak_password'] == ""){
			$this->data['novinpayamak_balance'] = $this->data['text_novinpayamak_balance'];
		}
		else{
			$novinpayamak = new NovinPayamak;
			$novinpayamak->setNovinPayamak($this->data['novinpayamak_username'], $this->data['novinpayamak_password']);
			$this->data['novinpayamak_balance'] = $novinpayamak->getBalance();
		}
		
		if($this->data['novinpayamak_message_type'] == ""){
			$this->data['novinpayamak_message_type'] = 1;
		}
		
		//This creates an error message. The error['warning'] variable is set by the call to function validate() in this controller (below)
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		//SET UP BREADCRUMB TRAIL. YOU WILL NOT NEED TO MODIFY THIS UNLESS YOU CHANGE YOUR MODULE NAME.
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/novinpayamak', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/novinpayamak', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['text_start_novinpayamak'] = sprintf($this->data['text_start_novinpayamak'], $this->url->link('sale/novinpayamak', 'token=' . $this->session->data['token'], 'SSL'));
		$this->data['send_sms'] = $this->url->link('sale/novinpayamak', 'token=' . $this->session->data['token'], 'SSL');
	
		//This code handles the situation where you have multiple instances of this module, for different layouts.
		$this->data['modules'] = array();
		
		if (isset($this->request->post['novinpayamak_module'])) {
			$this->data['modules'] = $this->request->post['novinpayamak_module'];
		} elseif ($this->config->get('novinpayamak_module')) { 
			$this->data['modules'] = $this->config->get('novinpayamak_module');
		}		

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		//Choose which template file will be used to display this request.
		$this->template = 'module/novinpayamak.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		//Send the output.
		$this->response->setOutput($this->render());
	}
	
	public function install() {
		
		$this->load->model('module/novinpayamak');
		
		$this->model_module_novinpayamak->createNovinPayamakTables();
	}
	
	public function uninstall() {
		
		$this->load->model('module/novinpayamak');
		
		$this->model_module_novinpayamak->deleteNovinPayamakTables();
	}
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/novinpayamak')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}


}
?>