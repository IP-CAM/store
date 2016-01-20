<?php

class ControllerModuleCouponForTracking extends Controller {

	private $name = 'cftyp';
	
	private $_settings = array('status', 'always', 'session_only', 'version');
	
	public function index() {
		$mname = 'coupon_for_tracking';
		if (!$this->user->hasPermission('modify', 'module/' . $mname)) $this->response->redirect('error/permission', 'token=' . $this->session->data['token'], 'SSL');		
		$data = $this->load->language('module/' . $mname);	
		$data['entry_session_only'] = sprintf($data['entry_session_only'], (defined('MTA_YPX_HAS_MTA') && MTA_YPX_HAS_MTA && !$this->config->get('mta_ypx_no_aff_in_cust_acc') ? $data['text_session_only_mta'] : ''));
		$this->document->setTitle($this->language->get('heading_title'));
		foreach($this->_settings as $_s) {
			$data[$this->name . '_' . $_s] = $this->config->get($this->name . '_' . $_s);
		}
		if(!$this->config->get($this->name . '_version')) {
			$this->db->query("ALTER TABLE " . DB_PREFIX . $this->name . "_coupon_affiliate ADD marketing_id int(11) unsigned not null default '0', ADD ctype enum('a','m') not null default 'a'");
			$this->load->model('setting/setting');
			$_settings = array();
			foreach($this->_settings as $_s) {				
				$_settings[$this->name . '_' . $_s] = $this->config->get($this->name . '_' . $_s);
			}
			$_settings[$this->name . '_version'] = 141217;
			$this->model_setting_setting->editSetting($this->name, $_settings);
		}
		if(isset($this->request->post[$this->name . '_always'])) {
			if (!$this->user->hasPermission('modify', 'module/' . $mname)) $this->response->redirect($this->url->link('error/permission', 'token=' . $this->session->data['token'], 'SSL'));			
			$this->load->model('setting/setting');
			$_settings = array();
			foreach($this->_settings as $_s) {
				if($_s == 'version') {
					$_settings[$this->name . '_version'] = $this->config->get($this->name . '_version');
				} else {
					$_settings[$this->name . '_' . $_s] = ($this->request->post[$this->name . '_' . $_s] ? 1 : 0);
				}
				$data[$this->name . '_' . $_s] = $_settings[$this->name . '_' . $_s];
			}			
			$this->model_setting_setting->editSetting($this->name, $_settings);
		}
		$data['classname'] = $mname;
  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/' . $mname, 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$data['action'] = $this->url->link('module/' . $mname, 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/' . $mname . '.tpl', $data));
	}
	
	public function install() {
		if (!$this->user->hasPermission('modify', 'extension/module')) return;		
		$this->db->query("CREATE TABLE if not exists " . DB_PREFIX . $this->name . "_coupon_affiliate (
			coupon_id int(11) unsigned not null default '0',
			affiliate_id int(11) unsigned not null default '0',
			marketing_id int(11) unsigned not null default '0', 
			ctype enum('a','m') not null default 'a', 		
			primary key (coupon_id)		
		) ENGINE=MyISAM");
		
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting($this->name, array(
			$this->name . '_status' => 1,
			$this->name . '_always' => 0,
			$this->name . '_session_only' => 0,
			$this->name . '_version' => 141217
		));	

		$this->module_permissions('add', array('module/coupon_for_tracking'));
		
		$events = array(array('coupon', 'delete', 'pre.admin', 'module/coupon_for_tracking/eventDeleteCoupon'));
		$this->addEvents($this->name, $events);
	}
	
	public function uninstall() {
		if (!$this->user->hasPermission('modify', 'extension/module')) return;		
		$this->load->model('setting/setting');		
		$this->model_setting_setting->deleteSetting($this->name);
		$this->deleteEvents($this->name);
		$this->module_permissions('remove', array('module/coupon_for_tracking'));
	}

	public function eventDeleteCoupon($coupon_id) {
		if($this->config->get('cftyp_status')) {
			$this->load->model('marketing/cftyp');
			$this->model_marketing_cftyp->edit($coupon_id);					
		}
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
