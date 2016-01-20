<?php

class ControllerMtaMta extends Controller {
	private $error = array();
	private $scheme = array();
	private $error_keys = array('permission','name','duplicate_name','invalid_percent','invalid_request','downline_limit',
'invalid_commission','unknown','database','warning','no_default','no_default_unconverted','all');

	public function index() {
		$this->load->model('mta/mta_affiliate');
		$this->load->model('mta/mta_product_affiliate');

		$data['link_downline'] = $this->url->link('mta/affiliate_downline', 'token=' . $this->session->data['token'], 'SSL');
		$data['unconverted_affiliates'] = $this->model_mta_mta_affiliate->countPreMtaAffiliates();
		if($data['unconverted_affiliates']) $data = array_merge($data, array('text_unconverted_affiliates','text_convert_affiliates'));
		
		$data = $this->_preprocess($data, array('insert', 'add'));
		
		$data['has_default'] = $this->model_mta_mta_affiliate->getDefaultSchemeId() ? true : false;
		if(!$data['has_default']) $this->error = array_merge($this->error, array('no_default', 'no_default_unconverted'));		
		
		$data['schemes'] = $this->model_mta_mta_affiliate->getSchemes(array('sort' => 'default', 'order' => 'desc'));
				
		$data['user_types'] = array(
			'affiliate' => 'a',
			'product' => 'p',			
			'product_discount' => 'p_d',
			'product_special' => 'p_s',
			'product_coupon' => 'p_c',
			'product_affiliate' => 'pa',
			'product_affiliate_discount' => 'pa_d',
			'product_affiliate_special' => 'pa_s',
			'product_affiliate_coupon' => 'pa_c'	
		);
		$data['user_types_lng'] = array();
		$_trans = array();
		foreach($data['user_types'] as $_k => $_v) {
			$_kAr = explode('_', $_k);
			$_kAr2 = array();
			foreach($_kAr as $_k2) {
				if(!isset($_trans[$_k2])) $_trans[$_k2] = $this->language->get('word_' . $_k2);
				$_kAr2[] = ucfirst($_trans[$_k2]);
			}
			$data['user_types_lng'][$_k] = implode(' / ', $_kAr2);
		}
		
		$data['s_opts'] = array();
		$data['all_fixed'] = array();
		
		foreach($data['schemes'] as $i => $s) {
			$s['id'] = $s['mta_scheme_id'];
			$s['name'] = $s['scheme_name'];
			$s['user_count'] = $this->_count_scheme_users($s['id']);
			$s['user_total'] = array_sum(array_values($s['user_count']));
			foreach($data['user_types'] as $_k => $_v) {
				if(!isset($s['user_count'][$_k])) $s['user_count'][$_k] = 0;
			}
			$_c = unserialize($s['all_commissions']);
			foreach($_c as $ii => $v) {
				foreach($v as $i2 => $v2) {
					$_c[$ii][$i2] = mta_float4($v2);
				}
				$_c[$ii] = implode(', ', $_c[$ii]);
			}
			$s['commissions'] = implode('<br />', $_c);
			unset($s['mta_scheme_id']);
			unset($s['scheme_name']);
			unset($s['all_commissions']);
			unset($s['all_autoadd']);
			
			$s['edit_link'] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('mta/mta/edit', 'token=' . $this->session->data['token'] . '&id=' . $s['id'], 'SSL')
			);			
			$data['s_opts'][] = array('id' => $s['id'], 'name' => $s['name']);
			if($s['commission_type'] == 'fixed') $data['all_fixed'][] = (int) $s['id'];
			$data['schemes'][$i] = $s;			
		}
		
		$data['all_fixed'] = json_encode($data['all_fixed']);
		$data['num_schemes'] = sizeof($data['schemes']);		

		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		$data['autoadd_statuses'] = $this->config->get('mta_ypx_autoadd_statuses');
		if(!is_array($data['autoadd_statuses'])) $data['autoadd_statuses'] = $this->config->get('config_complete_status');
		
		$data = $this->_process_errors($data);		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$data['config'] = $this->config;

		$this->response->setOutput($this->load->view('mta/mta.tpl', $data));		
	}


	public function add() {
		$this->load->model('mta/mta_scheme');
		if($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['name'])) {
			$this->_save();
			return;
		}
		if(!isset($data)) $data = array();
		$data = $this->_preprocess($data, array('insert','add','save','cancel'), false);

		$data = $this->_process_errors($data);	
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');		

		$this->response->setOutput($this->load->view('mta/mta_insert.tpl', $data));
	}

	public function edit() {
		if(!isset($this->request->request['id']) || !mta_check_int($this->request->request['id']) || $this->request->request['id'] < 1) {
			$this->response->redirect($this->url->link('mta/mta/add', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			return;
		}		
		$this->load->model('mta/mta_scheme');		
		
		if($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['name'])) {
			$this->_save();
			return;
		}
		
		$id = intval($this->request->request['id']);
		$this->model_mta_mta_scheme->getSchemeById($id);
		$this->scheme =& $this->model_mta_mta_scheme->scheme;
		if(!$this->scheme || isset($this->scheme['error'])) {
			$this->response->redirect($this->url->link('mta/mta/add', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			return;
		}		
		
		if(!isset($data)) $data = array();
		$data = $this->_preprocess($data, array('update','edit','save','cancel'), false);		
		
		foreach($this->scheme as $k => $v) {
			$data['s_' . $k] = $v;
		}	

		$data['update'] = $this->url->link('mta/mta/edit', 'token=' . $this->session->data['token'] . '&id=' . $id, 'SSL');
		
		$data['s_autoadd_json'] = json_encode($data['s__autoadd']);	
		$data['s_autoapprove_json'] = json_encode($data['s__autoapprove']);	
		$data['s_commissions_json'] = json_encode($data['s__commissions']);
		$data['has_affiliates'] = $this->model_mta_mta_scheme->hasAffiliates();

		$data = $this->_process_errors($data);
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('mta/mta_update.tpl', $data));
	}

	public function delete() {		
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		if(!isset($this->request->post['id']) || !mta_check_int($this->request->post['id']) || $this->request->post['id'] < 1 || !isset($this->request->post['really_do_delete']) || $this->request->post['really_do_delete'] != ($this->request->post['id'] * 3 + 517) || !$this->user->hasPermission('modify', 'mta/mta')) {
			$this->response->setOutput('0');
			return;
		}
		$this->load->model('mta/mta_scheme');
		$this->response->setOutput($this->model_mta_mta_scheme->deleteScheme($this->request->post['id']) ? '1' : '0');
	}
	
	public function check_scheme_name() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		if(!isset($this->request->request['name']) || $this->request->request['name'] == 'INVALID') {
			$this->response->setOutput('0');
			return;
		}
		$this->load->model('mta/mta_scheme');
		$id = isset($this->request->request['id']) ? $this->request->request['id'] : false;		
		$this->response->setOutput(intval($this->model_mta_mta_scheme->checkName($this->request->request['name'], $id)));
	}

	public function copy() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		if(!isset($this->request->request['name']) || !isset($this->request->request['id']) || !$this->user->hasPermission('modify', 'mta/mta')) {
			$this->response->setOutput('0');
			return;
		}
		$this->load->model('mta/mta_scheme');
		$this->response->setOutput(intval($this->model_mta_mta_scheme->copyScheme($this->request->request['id'], $this->request->request['name'])));
	}
	
	public function convert_affiliates() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$this->load->model('mta/mta_affiliate');
		if(!$this->model_mta_mta_affiliate->countPreMtaAffiliates()) {
			$this->response->setOutput('1');
			return;
		}
		$r = $this->model_mta_mta_affiliate->convertPreMtaAffiliates();
		$this->response->setOutput($r ? strval($r) : '0');
	}
	
	
	public function save_settings() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		if(!$this->user->hasPermission('modify', 'mta/mta')) {
			$this->response->setOutput('0');
			return;
		}	
		if(!isset($this->request->post['mta_ypx_autoadd_statuses'])) {
			$this->request->post['mta_ypx_autoadd_statuses'] = array();
		} else {
			$this->request->post['mta_ypx_autoadd_statuses'] = array_values($this->request->post['mta_ypx_autoadd_statuses']);
		}		
		$_settings = array();
		foreach($this->request->post as $k => $v) {
			if(strpos($k, 'mta_ypx_') === 0) $_settings[$k] = $v;
		}
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('mta_ypx', $_settings);
		$this->response->setOutput('1');	
	}
	
	public function order_commission() {
		if(isset($this->request->post['save_commission']) && !$this->user->hasPermission('modify', 'mta/mta')) $this->response->redirect($this->url->link('error/permission', 'token=' . $this->session->data['token'], 'SSL'));
		$this->load->model('sale/order');
		if(!isset($this->request->request['order_id']) || !$this->model_sale_order->getOrder($this->request->request['order_id'])) $this->response->redirect($this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'));
		$order_id = (int)$this->request->request['order_id'];
		
		$this->load->model('marketing/affiliate');
		if(!isset($data)) $data = array();
		$data = array_merge($data, $this->language->load('mta/mta'));
		$data = array_merge($data, $this->language->load('mta/order_commission'));		
		if(isset($this->request->post['save_commission']) && $this->validate_order_commission($order_id)) {			
			$this->model_marketing_affiliate->setOrderCommissions($order_id, $this->request->post['commissions'], $this->request->post['do_add']);
			$this->session->data['save_commission_success'] = true;
			$this->response->redirect($this->url->link('mta/mta/order_commission', 'token=' . $this->session->data['token'] . '&order_id=' . $order_id, 'SSL'));			
		}
		
		foreach(array('text_yes', 'text_no', 'entry_do_add', 'heading_title') as $_v) {
			$data[$_v] = $this->language->get($_v);
		}
		$data['heading_title'] = sprintf($data['heading_title'], $order_id);
		
		$this->document->setTitle($data['heading_title']);
		$this->document->addStyle('view/stylesheet/jquery.dataTables.css');
		
		if(isset($this->session->data['save_commission_success']) && $this->session->data['save_commission_success'] === true) {
			$data['success'] = $this->language->get('text_success');
			unset($this->session->data['save_commission_success']);
		} else {
			$data['success'] = false;
		}
		
		if($this->error) {
			$data['error_warning'] = implode('<br />', $this->error);
		} else {
			$data['error_warning'] = false;
		}
		
		$data['do_add'] = isset($this->request->post['do_add']) && $this->request->post['do_add'] ? true : false;

		$data['action'] = $this->url->link('mta/mta/order_commission', 'token=' . $this->session->data['token'] . '&order_id=' . $order_id, 'SSL');
		$data['link_order'] = $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $order_id, 'SSL');
		$data['cancel'] = $data['link_order'];
		$data['link_datatable'] = html_entity_decode($this->url->link('mta/mta_affiliate_dt', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
		$data['link_affiliate_tpl'] = html_entity_decode($this->url->link('mta/mta_affiliate_dt', 'token=' . $this->session->data['token'] . 'affiliate_id=AFFID', 'SSL'), ENT_QUOTES, 'UTF-8');
		
		$_ops = $this->model_sale_order->getOrderProducts($order_id);
		$data['order_products'] = array();
		foreach($_ops as $_op) {
			$data['order_products'][$_op['order_product_id']] = $_op;
		}
		
		$comms = $this->model_marketing_affiliate->getOrderCommissions($order_id);
		$data['commissions'] = array();
		$data['added'] = array();
		$data['aff_sizes'] = array();
		foreach($comms as $_c) {
			$_c['link_affiliate'] = $this->url->link('marketing/affiliate/edit', 'token=' . $this->session->data['token'] . '&affiliate_id=' . $_c['affiliate_id'], 'SSL');
			if(isset($data['order_products'][$_c['order_product_id']])) {
				$_c['quantity'] = $data['order_products'][$_c['order_product_id']]['quantity'];
				$_c['product_name'] = $data['order_products'][$_c['order_product_id']]['name'];
				$_c['product_model'] = $data['order_products'][$_c['order_product_id']]['model'];
			} else {
				$_c['quantity'] = 0;
				$_c['product_model'] = '';
			}
			if($_c['commission_added']) {
				$_c['commission_total'] = $this->currency->format($_c['commission_total']);
				if(!isset($data['added'][$_c['affiliate_id']])) $data['added'][$_c['affiliate_id']] = array();
				$data['added'][$_c['affiliate_id']][] = $_c;
			} else {
				if(!isset($data['commissions'][$_c['affiliate_id']]))	$data['commissions'][$_c['affiliate_id']] = array();
				$data['commissions'][$_c['affiliate_id']][] = $_c;
			}				
		}
		
		if(isset($this->request->post['save_commission'])) {
			if(isset($this->request->post['commissions']) && is_array($this->request->post['commissions']) && sizeof($this->request->post['commissions']) > 0) {
				$data['commissions'] = $this->request->post['commissions'];
				foreach($data['commissions']  as $_aff_id => $c) {
					foreach($c as $_i => $_c) {
						$__aff = $this->model_marketing_affiliate->getAffiliate($_c['affiliate_id']);
						$_c['affiliate_name'] = $__aff['firstname'] . ' ' . $__aff['lastname'];
						$_c['link_affiliate'] = $this->url->link('marketing/affiliate/edit', 'token=' . $this->session->data['token'] . '&affiliate_id=' . $_c['affiliate_id'], 'SSL');
						if(isset($data['order_products'][$_c['order_product_id']])) {
							$_c['quantity'] = $data['order_products'][$_c['order_product_id']]['quantity'];
							$_c['product_name'] = $data['order_products'][$_c['order_product_id']]['name'];
							$_c['product_model'] = $data['order_products'][$_c['order_product_id']]['model'];
						} else {
							$_c['quantity'] = 0;
							$_c['product_model'] = '';
						}
						$data['commissions'][$_aff_id][$_i] = $_c;
					}
				}
			} else {
				$data['commissions'] = array();
			}
		}
		if(sizeof($data['commissions']) > 0) {
			foreach($data['commissions'] as $_aff_id => $_v) {
				$data['aff_sizes']['a' . $_aff_id] = sizeof($_v);
			}
		}
		$data['aff_sizes'] = json_encode($data['aff_sizes']);
		$data['order_id'] = $order_id;
		$data['text_order'] = sprintf($data['text_order'], $order_id);
		$data['token'] = $this->session->data['token'];
		$data['added_ids'] = sizeof($data['added']) > 0 ? implode(',', array_keys($data['added'])) : '';
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('mta/order_commission.tpl', $data));		
	}
	
	private function validate_order_commission($order_id) {
		if(!isset($this->request->post['commissions']) || !is_array($this->request->post['commissions']) || sizeof($this->request->post['commissions']) < 1) {
			$this->request->post['commissions'] = false;
			return true;
		}
		$c = $this->request->post['commissions'];
		$_comms = $this->model_marketing_affiliate->getOrderCommissions($order_id);
		$added = array();
		foreach($_comms as $_c) {
			if($_c['commission_added']) $added[] = $_c['affiliate_id'];			
		}
		if(sizeof(array_intersect($added, array_keys($c))) > 0) $this->error[] = $this->language->get('error_already_added');
		foreach($c as $_c) {
			foreach($_c as $_p) {
				if(!preg_match("/^\d+(?:\.\d+)?$/", $_p['commission']) || $_p['commission'] < 0.01) {
					$this->error[] = $this->language->get('error_invalid_amount');
					break 2;
				}
			}
		}
		
		foreach($c as $_c) {
			$_opids = array();
			foreach($_c as $_p) {		
				if(in_array($_p['order_product_id'], $_opids)) {
					$this->error[] = $this->language->get('error_double_product');
					break 2;
				}
				$_opids[] = $_p['order_product_id'];
			}
		}
		return ($this->error ? false : true);
	}
	
/////////////////////////////////////////////////////////////////
	private function _count_scheme_users($scheme_id) {
		if(!mta_check_int($scheme_id) || $scheme_id < 1) return false;
		$c = array(
			'affiliate' => $this->model_mta_mta_affiliate->countUsers($scheme_id)
		);		
		$c = array_merge($c, $this->model_mta_mta_product_affiliate->countUsers($scheme_id, 'product_affiliate'));
		$c = array_merge($c, $this->model_mta_mta_product_affiliate->countUsers($scheme_id));		
		
		return $c;		
	}
	
	private function _save() {
		$this->language->load('mta/mta');
		if(!$this->user->hasPermission('modify', 'mta/mta')) {
     		$this->response->setOutput($this->language->get('error_permission'));
     		return false;
		}		
		if(!$this->_post_to_scheme($this->request->post)) {
			if(isset($this->scheme['error'])) {
				$_er = $this->language->get('error_' . $this->scheme['error']);
				if($_er == $this->scheme['error']) $_er = $this->language->get('error_database') . ' : ' . $this->scheme['error']; 
			} else {
				$_er = $this->language->get('error_validation');
			}
			$this->response->setOutput($_er);
			return false;
		}
		$_ret = $this->model_mta_mta_scheme->saveScheme();			
		$this->response->setOutput($_ret === true ? '1' : $this->language->get('error_database'));
		return ($_ret === true);		
	}

	private function _preprocess($data, $buttons, $unset_errors = true) {
		$data = array_merge($data, $this->language->load('mta/mta'));
		if($unset_errors) {
			foreach($data as $k => $v) {
				if(strpos($k, 'error_') === 0) unset($data[$k]);
			}
		}
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addScript('view/javascript/mta/util.js');
		
		/*foreach($fields as $_v) {
			$data[$_v] = $this->language->get($_v);			
		}*/
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		
		$url = '';
		
  	$data['breadcrumbs'] = array(
   		array(
    	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      'separator' => false
   		),

   		array(
      'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('mta/mta', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      'separator' => ' :: '
   		)
   	);
		
		foreach($buttons as $_b) {
			$_bv = $_b == 'cancel' ? '' : '/' . $_b;	
			$data[$_b] = $this->url->link('mta/mta' . $_bv, 'token=' . $this->session->data['token'] . $url, 'SSL');
		}
		return $data;
	}
	
	private function _post_to_scheme(&$p) {
		foreach(array('name', 'max_levels') as $_v) {
			if(!isset($p[$_v])) return false;
		}
		if(utf8_strlen($p['name']) < 1 || utf8_strlen($p['name']) > 100 || !mta_check_int($p['max_levels'])) return false;
		
		if(!isset($p['description'])) $p['description'] = '';
		if(!isset($p['is_default']) || !mta_check_bool($p['is_default'])) $p['is_default'] = 0;
		if(!isset($p['commission_type']) || !in_array($p['commission_type'], array('fixed', 'percentage'))) $p['commission_type'] = 'percentage';
		if(!isset($p['before_shipping']) || !mta_check_bool($p['before_shipping'])) $p['before_shipping'] = 1;
		if(!isset($p['eternal']) || !mta_check_int($p['eternal'])) $p['eternal'] = 0;

		$scheme = array();
		$_levels = array('autoadd' => array(), 'commission' => array());
		$autoapprove = array();		
		foreach($p as $k => $v) {
			if(preg_match("/^((?:tiers)|(?:level))(\d+)_(.+)$/", $k, $_lAr)) {
				if($_lAr[1] == 'tiers') {
					if(!preg_match("/^\d+(\.\d+)?$/s", $v)) return false;
					$tier = $_lAr[2];
					$_lAr = explode('_', $_lAr[3]);
					$_type = $_lAr[1];
					preg_match("/\d+$/", $_lAr[0], $_lAr);
					$level = $_lAr[0];
					if(!isset($_levels[$_type][$tier])) $_levels[$_type][$tier] = array();
					$_levels[$_type][$tier][$level] = $v;					
				} else {
					$autoapprove[$_lAr[2]] = $v;					
				}
			} else {
				$scheme[$k] = $v;
			}
		}
		//if($scheme['commission_type'] == 'fixed') $scheme['is_default'] = 0;		
		
		if($scheme['eternal'] > $scheme['max_levels']) $scheme['eternal'] = 0;		
		$scheme['_autoapprove'] = mta_array_a2n($autoapprove);
		if(sizeof($scheme['_autoapprove']) != $scheme['max_levels']) return false;
		foreach($scheme['_autoapprove'] as $_i => $_v) {
			if(!mta_check_bool($_v)) $scheme['_autoapprove'][$_i] = 1;
		}
		
		foreach($_levels as $k => $v) {			
			$v = mta_array_a2n($v);
			if(sizeof($v) != $scheme['max_levels']) return false;
			foreach($v as $i => $v2) {				
				$v[$i] = mta_array_a2n($v2);
				if(sizeof($v[$i]) != ($i + 1)) return false;
				foreach($v[$i] as $_i => $_v) {
					if($k == 'autoadd') {
						if(!mta_check_bool($_v)) $v[$i][$_i] = 1;
					} else if($k == 'commission') {
						if(!mta_check_float($_v)) return false;
					} else {
						return false;
					}
				}
			}
			$_levels[$k] = $v;
		}
		
		$scheme['_commissions'] = $_levels['commission'];
		$scheme['_autoadd'] = $_levels['autoadd'];		
		$this->scheme =& $this->model_mta_mta_scheme->setScheme($scheme);
		return (isset($this->scheme['error']) ? false : true);		
	}
	
	private function _process_errors($data) {		
		$_num_errors = sizeof($this->error);
		$_errors = array();
		if($_num_errors) {
			foreach($this->error as $i => $_er) {
				if(is_array($_er)) {
					$_msg = mta_tpl($this->language->get('error_' . $_er[0]));
					$_er = $_er[0];
				} else {
					$_msg = $this->language->get('error_' . $_er);
				}
				if(!isset($data['error_' . $_er])) $data['error_' . $_er] = $_msg;
				$this->error[$_er] = $data['error_' . $_er];
				$_errors[] = $data['error_' . $_er];
				unset($this->error[$_er]);
			}		
			if($_num_errors > 1) {
				$data['error_all'] = $this->language->get('error_all') . "\n" . implode("\n", $_errors);
			} else {
				$data['error_all'] = $_errors[0];
			}
		}		
		foreach($this->error_keys as $_er) {
			if(!isset($data['error_' . $_er])) $data['error_' . $_er] = '';
		}
		return $data;
	}

	public function insert() {
		$this->add();
	}
	
	public function update() {
		$this->edit();
	}
	
}