<?php
final class NovinPayamak {
	protected $novinpayamak_username;
	protected $novinpayamak_password;

	
	private function setUsername($novinpayamak_username){
		$this->novinpayamak_username = $novinpayamak_username;
	}
	
	private function setPassword($novinpayamak_password){
		$this->novinpayamak_password = $novinpayamak_password;
	}
	
	private function NovinPayamakcURL($link){
		$http = curl_init($link);
		// do your curl thing here
		curl_setopt($http, CURLOPT_RETURNTRANSFER, TRUE); 
		$http_result = curl_exec($http);
		$http_status = curl_getinfo($http, CURLINFO_HTTP_CODE);
		curl_close($http);
		
		return $http_result;
	}
	
	public function setNovinPayamak($novinpayamak_username, $novinpayamak_password){
		$this->setUsername($novinpayamak_username);
		$this->setPassword($novinpayamak_password);
	}
	
	public function getBalance(){
		
		if (!$this->novinpayamak_username || !$this->novinpayamak_password) {
			exit('Please set your NovinPayamak username and password');
		}
		
		$client = new SoapClient('http://www.novinpayamak.com/services/SMSBox/wsdl', array('encoding' => 'UTF-8'));

		$result = $client->CheckCredit(
							array(
									'Auth' 	=> array('number' => $novinpayamak_username,'pass' => $novinpayamak_password)
								)
		);

		//Redirect to URL You can do it also by creating a form
		if($result->Status == 1000)
		{
			$balance = $result->Credit;
		} else {
			$balance = $result->Status;
		}

		return $balance;
	}

	public function send($senderid, $destination, $messagetype, $message, $db) {
		
		if (!$this->novinpayamak_username || !$this->novinpayamak_password) {
			exit('Please set your NovinPayamak username and password');
		}

		
		$novinpayamak_username = $this->novinpayamak_username;
		$novinpayamak_password = $this->novinpayamak_password;
		/*
		$link = $novinpayamak_send_api.'?';
		$link .= "un=".urlencode($novinpayamak_username);
		$link .= "&pwd=".urlencode($novinpayamak_password);
		$link .= "&dstno=".urlencode($destination);
		$link .= "&msg=".urlencode($message);
		$link .= "&type=".urlencode($messagetype);
		$link .= "&sendid=".urlencode($senderid);
		
		$result = $this->NovinPayamakcURL($link);
		*/
		
		$client = new SoapClient('http://www.novinpayamak.com/services/SMSBox/wsdl', array('encoding' => 'UTF-8'));

		$result = $client->Send(
							array(
									'Auth' 	=> array('number' => $novinpayamak_username,'pass' => $novinpayamak_password),
									'Recipients' => array($destination),
									'Message' => array($message),
									'Flash' => false
								)
		);

		//Redirect to URL You can do it also by creating a form
		if($result->Status == 1000)
		{
			$status = $result->MessageId;
		} else {
			$status = $result->Status;
		}
		
	
		
		$novinpayamak_query = $db->query("INSERT INTO " . DB_PREFIX . "novinpayamak_report(novinpayamak_source, novinpayamak_destination, novinpayamak_message, novinpayamak_message_type, novinpayamak_server_status) VALUES('" . $db->escape($senderid) . "', '" . $db->escape($destination) . "', '" . $db->escape($message) . "', '" . $db->escape($messagetype) . "', '" . $db->escape($status) . "')");
		return $status;
	}
}
?>