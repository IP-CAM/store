<?php

class ControllerTotalTrackingDiscount extends Controller {
	private $error = array();
	private $name = 'tracking_discount';

	public function install() {
		if (!$this->user->hasPermission('modify', 'extension/total')) return;
		$this->db->query("CREATE TABLE if not exists " . DB_PREFIX . "affiliate_" . $this->name . "(
			affiliate_id int(11) unsigned not null default '0',
			`amount` decimal(6,2) NOT NULL DEFAULT '0.00',
			`type` enum('percent','fixed') not null default 'percent',
			primary key (affiliate_id)
		) ENGINE=MYISAM");

		$this->module_permissions('add', array('total/' . $this->name));
		
		$events = array(
			array('affiliate', 'add', 'pre.admin', 'total/' . $this->name . '/eventAffiliatePre'),
			array('affiliate', 'add', 'post.admin', 'total/' . $this->name . '/eventAffiliatePost'),
			array('affiliate', 'edit', 'pre.admin', 'total/' . $this->name . '/eventAffiliatePre'),
			array('affiliate', 'edit', 'post.admin', 'total/' . $this->name . '/eventAffiliatePost'),
			array('affiliate', 'delete', 'pre.admin', 'total/' . $this->name .
			'/eventDeleteAffiliate')
		);		
		$this->addEvents($this->name, $events);			
	}	
	
	public function index() {		
		if(!$this->config->get($this->name . '_per_aff')) $this->install();
		$data = $this->language->load('total/' . $this->name);
		$data['text_fixed'] = sprintf($data['text_fixed'], $this->config->get('config_currency'));

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			if (!$this->user->hasPermission('modify', 'total/' . $this->name)) $this->response->redirect($this->url->link('error/permission', 'token=' . $this->session->data['token'], 'SSL'));			
			$this->request->post[$this->name . '_per_aff'] = '1';
			$this->model_setting_setting->editSetting($this->name, $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'));
		}

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

   		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_total'),
			'href'      => $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
		'href'      => $this->url->link('total/' . $this->name, 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->document->breadcrumbs[] = array(
       		'text'      => $this->language->get('heading_title'),
       		'href'      => $this->url->link('total/' . $this->name, 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('total/' . $this->name, 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/total', 'token=' . $this->session->data['token'], 'SSL');
		
		foreach(array('amount', 'type', 'fixed_max', 'fixed_per_item', 'when', 'period', 'what', 'no_coupon', 'status', 'sort_order', 'apply_to') as $_v) {
			$_v = $this->name . '_' . $_v;
			if (isset($this->request->post[$_v])) {
				$data[$_v] = $this->request->post[$_v];
			} else {				
				$data[$_v] = $this->config->get($_v);
				if($_v == $this->name . '_sort_order' && !$data[$_v]) $data[$_v] = (intval($this->config->get('sub_total_sort_order'))) + 1;
			}		
		}

		$this->load->model('localisation/tax_class');

		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('total/' . $this->name . '.tpl', $data));		
	}

	private function validate() {		
		if (!$this->user->hasPermission('modify', 'total/' . $this->name)) {
			$this->error['warning'] = $this->language->get('error_permission');
		} else {		
			$errors = array(
				'amount' => "/^\d+(?:\.\d+)?$/",
				'fixed_max' => "/^\d+(?:\.\d+)?$/",
				'period' => "/^\d+$/",
				'sort_order' => "/^\d+$/"
			);
			$required = array('amount');
		
			$_errors = array();
			foreach($errors as $k => $preg) {
				if(!in_array($k, $required) && !strlen($this->request->post[$this->name . '_' . $k])) continue;
				if(!preg_match($preg, $this->request->post[$this->name . '_' . $k])) $_errors[] = $this->language->get('error_' . $k);
			}
		
			if(sizeof($_errors) > 0) $this->error['warning'] = implode('<br />', $_errors);
		}		
		return !$this->error;
	}
	
	public function uninstall() {	
		if (!$this->user->hasPermission('modify', 'extension/total')) return;
		$this->module_permissions('remove', array('total/' . $this->name));
		$this->deleteEvents($this->name);
		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting($this->name);		
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

	public function eventDeleteAffiliate($affiliate_id) {
		if($this->config->get('tracking_discount_status')) $this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_tracking_discount WHERE affiliate_id = '" . (int)$affiliate_id . "'");
	}
	
	public function eventAffiliatePre($data) {
		if(!$this->config->get('tracking_discount_status')) return;
		$this->config->set('_tracking_discount_data_', $data);
	}		

	public function eventAffiliatePost($affiliate_id) {
		if(!$this->config->get('tracking_discount_status')) return;
		$data = $this->config->get('_tracking_discount_data_');
		if(!$data) return;
		$this->config->set('_tracking_discount_data_', '');		

		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_tracking_discount WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		if(isset($data['tracking_discount_amount']) && preg_match("/^\d+(\.\d+)?$/", $data['tracking_discount_amount'])) $this->db->query("INSERT INTO " . DB_PREFIX . "affiliate_tracking_discount SET affiliate_id = '" . (int)$affiliate_id . "', `amount` = '" . (float)$data['tracking_discount_amount'] . "', `type` = '" . ($data['tracking_discount_type'] === 'fixed' ? 'fixed' : 'percent') . "'");
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

