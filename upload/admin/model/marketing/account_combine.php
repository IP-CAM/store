<?php

class ModelMarketingAccountCombine extends Model {
	
	private $settings = array(
		'version' => 20141101,
		'status' => 1,
		'allow_own_aff' => 1,
		'allow_funds_transfer' => 0,
		'transfer_multiplier' => 1,
		'_fields' => array('website', 'tax', 'payment'),
		'_payment_methods' => array('paypal', 'cheque', 'bank'),
		'_payment_method_fields' => array(
			'bank' => array('name', 'branch_number', 'swift_code', 'account_name','account_number')		
		),		
		'fields' => array(
		),
		'rform' => array(
			'affiliate' => 'c',
			'website_textarea' => 0,
			'agreement' => 0,
		),
		'cform' => array(
			'affiliate' => 'n',
			'website_textarea' => 0,
			'agreement' => 0,
		),
		'customer_group_id' => 0,
		'force_required' => 0,
		'own_parent' => 0,
		'aff_links_in_account' => 1,
		'auto_credit' => 0		
	);
	
	private $_settings_preprocessed = false;
	private $name = 'account_combine';
	
	private $_has_mta = -1;

	public function addCustomerFromAffiliate($data, $add_link = true) {
		if(!is_array($data)) {
			if(preg_match("/^\d+$/", $data)) {
				$_q = "SELECT * FROM  " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int) $data . "'";
			} else {
				$_q = "SELECT * FROM  " . DB_PREFIX . "affiliate WHERE email = '" . $this->db->escape($data) . "'";
			}			
			$_res = $this->db->query($_q);
			if($_res->num_rows < 1) return false;
			$data = $_res->row;			
		} else if(!isset($data['email'])) {
			return false;
		}
		$data['customer_group_id'] = $this->config->get('config_customer_group_id');
		$data['status'] = '1';
		$data['safe'] = '1';
		$data['newsletter'] = '0';
		$data['address'] = array(
			array(
			'company_id' => '',
			'tax_id' => $data['tax'],
			'default' => true
			)
		);
		foreach(array('firstname', 'lastname', 'company', 'address_1', 'address_2', 'city', 'postcode', 'country_id', 'zone_id') as $_f) {
			$data['address'][0][$_f] = $data[$_f];
		}
		$this->load->model('sale/customer');
		$this->model_sale_customer->addCustomer($data);
		$customer = $this->model_sale_customer->getCustomerByEmail($data['email']);
		if(!$customer || !sizeof($customer)) return false;
		$this->db->query("update " . DB_PREFIX . "customer set password='" . $this->db->escape($data['password']) . "', salt='" . $this->db->escape($data['salt']) . "', approved='1' where customer_id='" . (int) $customer['customer_id'] . "'");
		if($add_link) $this->linkCustomerAffiliate($customer['customer_id'], $data['affiliate_id']);
		if($this->config->get($this->name . '_own_parent')) {
			if($this->_has_mta === -1) {
				$this->load->model('setting/setting');
				$this->_has_mta = $this->model_setting_setting->getSetting('mta_ypx') ? true : false;
			}
			if($this->_has_mta === true) {
				$this->db->query("update " . DB_PREFIX . "customer set affiliate_id = '" . (int)$data['affiliate_id'] . "' where customer_id = '" . (int) $customer['customer_id'] . "'");
			}			
		}		
		return $customer['customer_id'];
	}
	
	public function linkCustomerAffiliate($customer_id, $affiliate_id) {
		$this->db->query("INSERT IGNORE INTO " . DB_PREFIX . "accc_customer_affiliate (customer_id, affiliate_id) VALUES ('" . (int)$customer_id . "', '" . (int)$affiliate_id . "')");	
	}
	
	public function getAffiliateIdByCustomerId($customer_id) {
		$_res = $this->db->query("SELECT affiliate_id FROM " . DB_PREFIX . "accc_customer_affiliate WHERE customer_id = '" . (int)$customer_id . "'");
		if($_res->num_rows < 1) return false;
		return $_res->row['affiliate_id'];
	}
	
	public function getCustomerIdByAffiliateId($affiliate_id) {
		$_res = $this->db->query("SELECT customer_id FROM " . DB_PREFIX . "accc_customer_affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		if($_res->num_rows < 1) return false;
		return $_res->row['customer_id'];
	}	
	
	public function setAllCustomerGroup($customer_group_id) {
		$this->db->query("update " . DB_PREFIX . "customer set customer_group_id = '" . (int)$customer_group_id . "' where customer_id in (select customer_id from " . DB_PREFIX . "accc_customer_affiliate)");
		return $this->db->countAffected();
	}

	public function getCurrentVersion() {
		$_cv = $this->config->get($this->name . '_version');
		if(!$_cv) return 0;
		return intval($_cv);
	}
	
	public function syncAffiliateToCustomer($customer_id, $password = false) {
		$affiliate_id = $this->getAffiliateIdByCustomerId($customer_id);
		if(!$affiliate_id) return;
		$_res = $this->db->query("select firstname, lastname, email, telephone, fax, `password`, `salt` from " . DB_PREFIX . "customer where customer_id = '" . (int)$customer_id . "'");
		if($_res->num_rows > 0) {
			$this->db->query("update " . DB_PREFIX . "affiliate set firstname='" . $this->db->escape($_res->row['firstname']) . "', lastname='" . $this->db->escape($_res->row['lastname']) . "', email='" . $this->db->escape($_res->row['email']) . "', telephone='" . $this->db->escape($_res->row['telephone']) . "', fax='" . $this->db->escape($_res->row['fax']) . "' where affiliate_id = '" . (int)$affiliate_id . "'");
			if($password) $this->db->query("update " . DB_PREFIX . "affiliate set `password` = '" . $this->db->escape($_res->row['password']) . "', `salt` = '" . $this->db->escape($_res->row['salt']) . "' where affiliate_id = '" . (int)$affiliate_id . "'");
		}
	}
	
	public function syncCustomerToAffiliate($affiliate_id, $password = false) {
		$customer_id = $this->getCustomerIdByAffiliateId($affiliate_id);
		if(!$customer_id) return;
		$_res = $this->db->query("select firstname, lastname, email, telephone, fax, `password`, `salt` from " . DB_PREFIX . "affiliate where affiliate_id = '" . (int)$affiliate_id . "'");
		if($_res->num_rows > 0) {
			$this->db->query("update " . DB_PREFIX . "customer set firstname='" . $this->db->escape($_res->row['firstname']) . "', lastname='" . $this->db->escape($_res->row['lastname']) . "', email='" . $this->db->escape($_res->row['email']) . "', telephone='" . $this->db->escape($_res->row['telephone']) . "', fax='" . $this->db->escape($_res->row['fax']) . "' where customer_id = '" . (int)$customer_id . "'");
			if($password) $this->db->query("update " . DB_PREFIX . "customer set `password` = '" . $this->db->escape($_res->row['password']) . "', `salt` = '" . $this->db->escape($_res->row['salt']) . "' where customer_id = '" . (int)$customer_id . "'");
		}
	}
	
	public function fixVersion($force = false) {
		if($force === false && $this->getCurrentVersion() >= $this->settings['version']) return false;
		$this->load->model('setting/setting');
		$curset = $this->model_setting_setting->getSetting($this->name);
		$s = $this->getDefaultSettings();
		$len = strlen($this->name) + 1;
		foreach($curset as $k => $v) {
			$k = substr_replace($k, '', 0, $len);
			if(isset($s[$k]) && $k != 'version') $s[$k] = $v;
		}
		$_settings = array();
		foreach($s as $k => $v) {
			$_settings[$this->name . '_' . $k] = $v;				
		}
		$this->model_setting_setting->editSetting($this->name, $_settings);		
		return true;
	}
	
	public function getDefaultSettings() {
		if($this->_settings_preprocessed === false)  {
			foreach($this->settings['_fields'] as $f) {
				$this->settings['fields'][$f] = 'y';
				$this->settings['rform']['show_' . $f] = 1;
				$this->settings['cform']['show_' . $f] = 0;
			}
			foreach($this->settings['_payment_methods'] as $f) {
				$this->settings['fields']['use_' . $f] = 1;
			}
			$this->settings['fields']['payment_default'] = $this->settings['_payment_methods'][0];
			foreach($this->settings['_payment_method_fields'] as $method => $fields) {
				if(is_array($fields)) {
					$this->settings['fields'][$method] = array();
					foreach($fields as $f) {
						$this->settings['fields'][$method][$f] = 1;
					}
				} else if(!$fields) {
					$this->settings['fields'][$method] = 0;
				}
			}
			$this->_settings_preprocessed = true;
		}
		return $this->settings;	
	}
	
	public function getName() {
		return $this->name;
	}

	public function autoCredit() {
		if (!$this->config->get('account_combine_status') || !$this->config->get('account_combine_auto_credit') || !$this->config->get('account_combine_allow_funds_transfer')) return false;
		$fields = $this->config->get('account_combine_fields');
		if(!isset($fields['payment']) || $fields['payment'] != 'n') return false;
		return true;
	}	

	public function transferEarningsToCustomer($affiliate_id, $customer_id, $aff_amount, $cust_amount, $affiliate_transaction_description, $customer_transaction_description) {
		if($aff_amount > 0) $aff_amount = -$aff_amount;
		if($cust_amount < 0) $cust_amount = -$cust_amount;
		$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate_transaction SET affiliate_id = '" . (int)$affiliate_id . "', order_id = '0', description = '" . $this->db->escape($affiliate_transaction_description) . "', amount = '" . $aff_amount . "', date_added = NOW()");
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_transaction SET customer_id = '" . (int)$customer_id . "', order_id = '0', description = '" . $this->db->escape($customer_transaction_description) . "', amount = '" . $cust_amount . "', date_added = NOW()");		
	}
	
}
