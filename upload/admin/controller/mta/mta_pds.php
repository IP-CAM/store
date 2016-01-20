<?php

class ControllerMtaMtaPds extends Controller {

	private $error = false;
	private $_coupons = false;	
	
	public function index() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$this->language->load('mta/mta_pds');
		if(!$this->validate_get()) $this->error = true;
		if(!$this->error) {
			$this->load->model('mta/mta_product');
			$data['schemes'] = $this->_get_schemes();
			if($this->request->request['type'] == 'coupon') {
				$_types = 'coupon';
			} else {
				$_type = substr($this->request->request['type'], 0, 1);
				$_types = array($_type);
				foreach(array('coupon', 'discount', 'special') as $_v) {
					$_types[] = $_type . '_' . $_v;
				}
			}
			$data['schemes_default'] = array();
			$_s_def = $this->model_mta_mta_product->getDefaultProductSchemes($_types, $this->request->request['id']);
			if($_s_def) {
				foreach($_s_def as $_v) {
					$data['schemes_default'][$_v['type']] = $_v['scheme_id'];
				}
			}
			$data['types'] = is_array($_types) ? $_types : array($_types);
			$data['mta_type'] = $this->request->request['type'];
			$data['entity_id'] = $this->request->request['id'];
			foreach(array('button_set', 'button_save_default', 'option_select', 'option_default', 'text_confirm_set', 'text_confirm_save_default', 'word_saved', 'word_done', 'text_saving') as $_v) {
				$data[$_v] = $this->language->get($_v);
			}
			$data['alert_error'] = $this->language->get('error_warning');
			foreach(array('text_confirm_set', 'text_confirm_save_default', 'alert_error') as $_v) {
				$data[$_v] = mta_jsstr($data[$_v]);
			}			
			$data['url_set'] = mta_jsstr($this->url->link('mta/mta_pds/set', 'token=' . $this->session->data['token'] . '&id=' . $data['entity_id'], 'SSL'));
			$data['url_save_default'] = mta_jsstr($this->url->link('mta/mta_pds/save_default', 'token=' . $this->session->data['token'] . '&id=' . $data['entity_id'], 'SSL'));	
			$data['entries_set'] = array();
			$data['entries_save_default'] = array();
			foreach($data['types'] as $_type) {
				foreach(array('set', 'save_default') as $_action) {
					if($_type == 'coupon' || strlen($_type) < 2) {
						$data['entries_' . $_action][$_type] = $this->language->get('entry_' . $_type . '_' . $_action);
					} else {
						$_tAr = explode('_', $_type);
						$data['entries_' . $_action][$_type] = sprintf($this->language->get('entry_' . $_tAr[0] . 'sub_' . $_action), $this->language->get('entry_word_' . $_tAr[1]));
					}
				}
			}
		}
		$data['error_warning'] = $this->error ? mta_jsstr($this->language->get('error_warning')) : '';
		
		$this->response->setOutput($this->load->view('mta/mta_pds.tpl', $data));
	}
	
	public function set($func = 'All') {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		if(!$this->validate_set()) $this->error = true;
		if(!$this->error) {
			if(!$func) $func = 'All';
			$this->load->model('mta/mta_product');
			$this->model_mta_mta_product->{'set' . $func . 'ProductScheme'}($this->request->request['type'], $this->request->request['id'], $this->request->request['scheme_id']);		
		}
		$this->response->setOutput($this->error ? '0' : '1');	
	}
	
	public function save_default() {
		$this->set('Default');
	}
	
	private function validate_get() {
		if (!isset($this->request->request['type']) || !isset($this->request->request['id']) || !in_array($this->request->request['type'], array('coupon', 'm', 'c', 'm_coupon', 'm_discount', 'm_special', 'c_coupon', 'c_discount', 'c_special')) || !preg_match("/^\d+$/", $this->request->request['id']) || (intval($this->request->request['id']) < 0)) return false;
		return true;
	}

	private function validate_set() {
		if ((!$this->user->hasPermission('modify', 'mta/mta') && !$this->user->hasPermission('modify', 'mta/mta_pds')) || !$this->validate_get() || !isset($this->request->request['scheme_id']) || !preg_match("/^\d+$/", $this->request->request['scheme_id']) || (intval($this->request->request['scheme_id']) < 0)) return false;
		return true;
	}
	
	private function _get_schemes() {	
		$this->load->model('mta/mta_product');
		$_s = $this->model_mta_mta_product->getSchemes(array('fields' => array('mta_scheme_id as id', 'scheme_name as n')));
		$out = array();
		foreach($_s as $_s2) {
			$out[strval($_s2['id'])] = $_s2['n'];
		}
		return $out;
	}		

	public function datatable() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$data['show_save_button'] = isset($this->request->request['s']) ? true : false;
		$data['add_js'] = isset($this->request->request['add_js']) ? $this->request->request['add_js'] : false;
		$data['add_jsp'] = isset($this->request->request['add_jsp']) ? $this->url->link($this->request->request['add_jsp'], 'token=' . $this->session->data['token'], 'SSL') : false;
		$this->language->load('mta/mta_pds_dt');
		foreach(array('entry_affiliate', 'text_select_affiliate', 'text_set_none', 'text_none', 'oy_close', 'oy_title', 'oy_loading', 'oy_id', 'oy_name', 'oy_email', 'oy_scheme', 'oy_level', 'oy_balance', 'oy_date_added') as $_k) {
			$data[$_k] = $this->language->get($_k);
		}		
		$this->response->setOutput($this->load->view('mta/mta_pds_dt.tpl', $data));
	}		
	
	public function product_dt() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop		
		$this->language->load('catalog/product');
		foreach(array('column_affiliates', 'column_mta_scheme', 'text_edit_commission', 'text_add_commission', 'button_add_selected', 'button_remove_selected') as $_k) {
			$data[$_k] = $this->language->get($_k);
		}			
		foreach(array('add', 'edit') as $_v) {
			$data['text_' . $_v] = $data['text_' . $_v . '_commission'];
		}
		$data['schemes'] = $this->_get_schemes();
		$this->response->setOutput($this->load->view('mta/mta_pds_product_dt.tpl', $data));
	}
	
	public function	product_commission() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$product_id = $this->request->request['product_id'];
		$this->language->load('catalog/product');
		$data['entry_product'] = $this->language->get('entry_product');	
		$data['entry_coupons'] = $this->language->get('entry_coupons');	
		$data['column_coupon'] = $this->language->get('column_coupon');	
		$data['column_mta_scheme'] = $this->language->get('column_mta_scheme');	
		$data['link_commission_tab'] = mta_jsstr($this->url->link('mta/mta_pds/product_commission', 'token=' . $this->session->data['token'] . '&product_id=' . $product_id, 'SSL'));
		$this->load->model('mta/mta_product');
		$data['schemes'] = $this->_get_schemes();	
		$data['schemes0'] = array('0' => $this->language->get('text_default'));
		foreach($data['schemes'] as $_k => $_v) {
			$data['schemes0'][strval($_k)] = $_v;
		}	
		$data['text_aff_schemes'] = $this->language->get('text_aff_schemes');
		$_psch = $this->model_mta_mta_product->getProductScheme($product_id);
		$data['product_scheme_id'] = $_psch && isset($_psch['id']) ? $_psch['id'] : 0;		
		$all_sub_schemes = $this->model_mta_mta_product->getAllProductSubSchemes($product_id);		
		$per_page = $this->config->get('config_admin_limit');
		$this->load->model('marketing/coupon');
		$coupon_total = $this->model_marketing_coupon->getTotalCoupons();
		if($coupon_total <= $per_page) {
			$data['pagination'] = false;
			$coupons = $this->_get_coupons();
		} else {
			$page = isset($this->request->request['coupon_page']) ? intval($this->request->request['coupon_page']) : 1;
			$coupons = $this->_get_coupons((($page - 1) * $per_page), $per_page);
			$pagination = new Pagination();
			$pagination->total = $coupon_total;
			$pagination->page = $page;
			$pagination->limit = $per_page;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = '{page}';			
			$data['pagination'] = str_replace('a href=', 'a class="coupon-page-link" href="javascript:;" rel=', $pagination->render());			
		}
		$data['coupons'] = array();
		foreach($coupons as $_coupon) {
			$data['coupons'][] = array(
				'id' => $_coupon['coupon_id'],
				'description' => ($_coupon['name'] . '<br />(%' . intval($_coupon['discount']) . ')<br />' . date('d/m/Y', strtotime($_coupon['date_start'])) . ' - ' . date('d/m/Y', strtotime($_coupon['date_end']))),
				'scheme_id' => (isset($all_sub_schemes['coupon'][strval($_coupon['coupon_id'])]) ? $all_sub_schemes['coupon'][strval($_coupon['coupon_id'])] : '0')
			);
		}	

		$this->response->setOutput($this->load->view('mta/product_commission.tpl', $data));
	}
	
	private function _get_coupons($start = 0, $limit = false) {
		if($this->_coupons === false) {
			$this->load->model('marketing/coupon');
			if($limit === false) {
				$_coupons = $this->model_marketing_coupon->getCoupons();
			} else {
				$_coupons = $this->model_marketing_coupon->getCoupons(array('start' => $start, 'limit' => $limit));
			}
			$this->_coupons = array();
			foreach($_coupons as $_coupon) {
				$this->_coupons[$_coupon['coupon_id']] = $_coupon;
			}
		}
		return $this->_coupons;
	}		
}
