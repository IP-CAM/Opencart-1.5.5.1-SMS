<?php
################################################################################################
#  DIY Module Builder for Opencart 1.5.1.x From HostJars http://opencart.hostjars.com    	   #
################################################################################################
class ModelModuleNovinPayamak extends Model {
	
	/*
	 * Most modules do not require their own database access. If you do want to store some new data that doesn't fit into the existing
	 * database tables, you could create them here like the example function below.
	 * 
	 * This file is basically just included for completeness of the DIY module. There are some uses for it, but these are more advanced and
	 * by the time you get to those I doubt you'll be needing my help :)
	 */
	
	// This function is how my blog module creates it's tables to store blog entries. You would call this function in your controller in a
	// function called install(). The install() function is called automatically by OC versions 1.4.9.x, and maybe 1.4.8.x when a module is
	// installed in admin.
	public function createNovinPayamakTables() {
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "novinpayamak_report` (                                    
               `novinpayamak_report_id` bigint(20) NOT NULL AUTO_INCREMENT,          
               `novinpayamak_source` varchar(100) DEFAULT NULL,                      
               `novinpayamak_destination` varchar(100) DEFAULT NULL,                 
               `novinpayamak_message` text CHARACTER SET utf8,                       
               `novinpayamak_message_type` varchar(10) DEFAULT NULL,                 
               `novinpayamak_server_status` varchar(100) DEFAULT NULL,               
               `novinpayamak_sent_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,  
               PRIMARY KEY (`novinpayamak_report_id`)                                
             )");
	}	
	
	public function deleteNovinPayamakTables() {
		$query = $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "novinpayamak_report");
	}
}
?>