<?php

class ControllerModuleAccountCombine extends Controller {
	private $error = array();
	private $name = 'account_combine';
	private $settings;

	public function install() {			
		if (!$this->user->hasPermission('modify', 'extension/module')) return;	
		ignore_user_abort(1);
		$this->load->model('marketing/account_combine');
		$this->settings = $this->model_marketing_account_combine->getDefaultSettings();
		$this->db->query("CREATE TABLE if not exists " . DB_PREFIX . "accc_customer_affiliate (                                  
                          `accc_customer_affiliate_id` int(11) unsigned NOT NULL AUTO_INCREMENT,  
                          `customer_id` int(11) unsigned NOT NULL DEFAULT '0',                   
                          `affiliate_id` int(11) unsigned NOT NULL DEFAULT '0',                          
                          PRIMARY KEY (`accc_customer_affiliate_id`),                             
                          UNIQUE KEY `customer_affiliate_id` (`customer_id`,`affiliate_id`)                          
                        ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED");
		$aclinks = array();			
		$res = $this->db->query("select " . DB_PREFIX . "affiliate.affiliate_id, " . DB_PREFIX . "customer.customer_id from " . DB_PREFIX . "affiliate, " . DB_PREFIX . "customer where " . DB_PREFIX . "affiliate.email=" . DB_PREFIX . "customer.email and " . DB_PREFIX . "affiliate.affiliate_id not in (select affiliate_id from " . DB_PREFIX . "accc_customer_affiliate)");
		if($res->num_rows > 0) {			
			foreach($res->rows as $_r) {
				$aclinks[] = "('" . (int) $_r['customer_id'] . "', '" . (int) $_r['affiliate_id'] . "')";
			}
		}
		$res = $this->db->query("select * from " . DB_PREFIX . "affiliate where email not in (select email from " . DB_PREFIX . "customer) and affiliate_id not in (select affiliate_id from " . DB_PREFIX . "accc_customer_affiliate)");
		if($res->num_rows > 0) {			
			$this->load->model('marketing/account_combine');
			foreach($res->rows as $_r) {
				set_time_limit(100);
				$_cid = $this->model_marketing_account_combine->addCustomerFromAffiliate($_r, false);
				if($_cid) $aclinks[] = "('" . (int) $_cid . "', '" . (int) $_r['affiliate_id'] . "')";
			}
		}		
		if(sizeof($aclinks) > 0) $this->db->query("insert ignore into " . DB_PREFIX . "accc_customer_affiliate (customer_id, affiliate_id) values " . implode(',', $aclinks));	
		$this->load->model('setting/setting');
		if(!sizeof($this->model_setting_setting->getSetting($this->name))) {
			$_settings = array();
			foreach($this->settings as $k => $v) {
				$_settings[$this->name . '_' . $k] = $v;				
			}
			$this->model_setting_setting->editSetting($this->name, $_settings);
		}
		$this->module_permissions('add');

		$events = array(
			array('add.transaction', false, 'post.affiliate', 'affiliate/' . $this->name . '/eventAutoCredit'),
			array('affiliate', 'delete', 'pre.admin', 'module/' . $this->name . '/eventDeleteAffiliate'),
			array('affiliate.transaction', 'add', 'post.admin', 'module/' . $this->name . '/eventAutoCredit')		
		);		
		$this->addEvents($this->name, $events);		
	}
	
	public function uninstall() {
		if (!$this->user->hasPermission('modify', 'extension/module')) return;		
		$this->db->query("DELETE FROM " . DB_PREFIX . "accc_customer_affiliate");
		$this->module_permissions('remove');
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting($this->name);
		$this->deleteEvents($this->name);
	}
	
	public function index() {		
		$this->load->model('marketing/account_combine');
		$this->settings = $this->model_marketing_account_combine->getDefaultSettings();	
		$this->load->model('setting/setting');
		
		$rform = $this->config->get($this->name . '_rform');
		$cform = $this->config->get($this->name . '_cform');
		if(!$cform['website_textarea'] && !$rform['website_textarea'] && ((isset($this->request->post[$this->name . '_rform']['website_textarea']) && $this->request->post[$this->name . '_rform']['website_textarea']) || (isset($this->request->post[$this->name . '_cform']['website_textarea']) && $this->request->post[$this->name . '_cform']['website_textarea']))) $this->db->query("alter table " . DB_PREFIX . "affiliate modify website text not null");

		$data = $this->language->load('module/account_combine');
		if($this->config->get('tracking_input_status')) {
			$data['tracking_input_info'] = sprintf($this->language->get('text_tracking_input_info'), $this->url->link('module/tracking_input', 'token=' . $this->session->data['token'], 'SSL'));
		} else {
			$data['tracking_input_info'] = false;
		}

		if (!isset($this->session->data['token'])) $this->session->data['token'] = '';		
		$data['token'] = $this->session->data['token'];		
		
		if($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ($this->user->hasPermission('modify', 'module/' . $this->name)) {		
				if(!preg_match("/^\d+(:?\.\d+)?$/", $this->request->post[$this->name . '_transfer_multiplier'])) {
					$this->request->post[$this->name . '_transfer_multiplier'] = 1;
				} else {
					$this->request->post[$this->name . '_transfer_multiplier'] = round(floatval($this->request->post[$this->name . '_transfer_multiplier']) * 100) * 0.01;
				}
				$this->model_setting_setting->editSetting($this->name, array_merge($this->model_setting_setting->getSetting($this->name), $this->request->post));
				$this->session->data['success'] = $this->language->get('text_success');
				$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
			} else {
				$this->error['warning'] = $this->language->get('error_permission');
			}
		}

		$this->load->model('sale/customer_group');
		$fields = $this->config->get($this->name . '_fields');
		$data['aff_fields'] = $this->config->get($this->name . '__fields');
		$data['payment_methods'] = $this->config->get($this->name . '__payment_methods');
		$data['payment_methods_json'] = json_encode($data['payment_methods']);
		foreach($fields as $field => $_v) {
			if(in_array($field, $data['payment_methods'])) {
				$data[$field . '_fields'] = array_keys($_v);
			}
		}			
		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
		$data['text_none'] = $this->language->get('text_none');
		$data['link_customer_group_now'] = html_entity_decode($this->url->link('module/account_combine/set_customer_group', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
		
		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_home'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('text_module'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => $this->url->link('module/account_combine', 'token=' . $this->session->data['token'], 'SSL'),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		foreach ($this->settings as $s => $_v) {
			if (isset($this->request->post[$this->name . '_' . $s])) {
				$data[$this->name . '_' . $s] = $this->request->post[$this->name . '_' . $s];
			} else {
				$data[$this->name . '_' . $s] = $this->config->get($this->name . '_' . $s);
			}
		}

		$data['action'] = $this->url->link('module/account_combine', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/' . $this->name . '.tpl', $data));
	}
	
	public function set_customer_group() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop		
		if(!$this->user->hasPermission('modify', 'module/' . $this->name) || !isset($this->request->post['customer_group_id']) || !preg_match("/^\d+/", $this->request->post['customer_group_id'])) {
			$this->response->setOutput('-1');
			return;
		}
		$this->load->model('sale/customer_group');
		if(!$this->model_sale_customer_group->getCustomerGroup($this->request->post['customer_group_id'])) {
			$this->response->setOutput('-1');
			return;
		} 
		$this->load->model('marketing/account_combine');
		$this->response->setOutput($this->model_marketing_account_combine->setAllCustomerGroup($this->request->post['customer_group_id']));	
	}
	
	public function eventDeleteAffiliate($affiliate_id) {
		if($this->config->get('account_combine_status')) $this->db->query("DELETE FROM " . DB_PREFIX . "accc_customer_affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");	
	}
	
	public function eventAutoCredit($affiliate_transaction_id) {
		if(!$this->config->get('account_combine_status')) return;
		$this->load->model('marketing/account_combine');
		if(!$this->model_marketing_account_combine->autoCredit()) return;
		$_res = $this->db->query("SELECT affiliate_id, amount FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_transaction_id = '" . (int)$affiliate_transaction_id . "' AND amount > 0 AND affiliate_id > 0");
		if($_res->num_rows < 1) return;
		$amount = $_res->row['amount'];
		$affiliate_id = $_res->row['affiliate_id'];		
		$customer_id = $this->model_marketing_account_combine->getCustomerIdByAffiliateId($affiliate_id);
		if(!$customer_id) return;
		$this->language->load('marketing/account_combine');				
		$_m = $this->config->get('account_combine_transfer_multiplier') ? $this->config->get('account_combine_transfer_multiplier') : 1;
		$cust_amount = round(floatval($amount * $_m) * 10000) * 0.0001;
		$this->model_marketing_account_combine->transferEarningsToCustomer($affiliate_id, $customer_id, $amount, $cust_amount, $this->language->get('text_affiliate_transaction_description'), $this->language->get('text_customer_transaction_description'));				
	}
	
	protected function addEvents($name, $events) {
		$n = VERSION === '2.0.0.0' ? 'tool' : 'extension';
		$this->load->model($n . '/event');
		$this->{'model_' . $n . '_event'}->deleteEvent($name);	
		$ks = array(0,1);
		if(VERSION === '2.0.0.0') $ks = array_reverse($ks);		
		foreach($events as $e) {			
			$trigger = array($e[2]);
			foreach($ks as $_i) {
				if($e[$_i]) $trigger[] = $e[$_i];				
			}
			$this->{'model_' . $n . '_event'}->addEvent($name, implode('.', $trigger), $e[3]);
		}		
	}
	
	protected function deleteEvents($name) {
		$n = VERSION === '2.0.0.0' ? 'tool' : 'extension';
		$this->load->model($n . '/event');
		$this->{'model_' . $n . '_event'}->deleteEvent($name);	
	}	
	
	protected function module_permissions($action = 'add', $data = array()) {
		if($action !== 'add') $action = 'remove';
		if(sizeof($data) === 0) {
			if(property_exists($this, 'name') && $this->name) {
				$data = array('module/' . $this->name);
			} else {
				return;
			}
		}
		$this->load->model('user/user_group');
		$id = VERSION === '2.0.0.0' ? $this->user->getId() : $this->user->getGroupId();
		foreach($data as $route) {
			$this->model_user_user_group->{$action . 'Permission'}($id, 'access', $route);
			$this->model_user_user_group->{$action . 'Permission'}($id, 'modify', $route);
		}
	}
	

}