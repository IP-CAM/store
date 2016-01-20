<?php
class ControllerModuleAffiliatePayout extends Controller {	

	private $name = 'affiliate_payout';
	private $pmp_max = 4950;
	
	public function index() {   
		if (!$this->user->hasPermission('modify', 'module/' . $this->name)) $this->response->redirect('error/permission', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->load->model('marketing/' . $this->name);
		$pm = $this->{'model_marketing_' .  $this->name}->payment_methods();
		if(!isset($data)) $data = array();
		$data['payment_methods'] = array();
		foreach($pm as $m) {
			$data['payment_methods'][$m] = ucfirst($m);
		}
		$data = array_merge($data, $this->language->load('module/' . $this->name));	
		$this->document->setTitle($this->language->get('heading_title'));

		$data['action_prepare'] = html_entity_decode($this->url->link('module/' . $this->name . '/prepare', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
		$data['action_confirm'] = html_entity_decode($this->url->link('module/' . $this->name . '/confirm', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
		$data['action_pmp'] = $this->url->link('module/' . $this->name . '/export_paypal_mass_pay', 'token=' . $this->session->data['token'], 'SSL');
		$data['action_csv'] = $this->url->link('module/' . $this->name . '/export_csv', 'token=' . $this->session->data['token'], 'SSL');		
		
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
			'href'      => $this->url->link('module/' . $this->name, 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);		
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/' . $this->name . '.tpl', $data));
	}

	public function prepare() {
		if (!$this->user->hasPermission('access', 'module/' . $this->name)) $this->response->redirect('error/permission', 'token=' . $this->session->data['token'], 'SSL');		
		if(defined('_JEXEC')) $_REQUEST['format'] = $_GET['format'] = 'raw';
		if($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->load->model('marketing/' . $this->name);
			$data = $this->{'model_marketing_' . $this->name}->prepare($this->request->post);
			$sz_data = sizeof($data);
			if($sz_data < 1) {
				$json = array('error' => 'no_data');
			} else {
				$json = array('data' => array(), 'total' => 0, 'num_affs' => sizeof($data));
				foreach($data as $v) {
					$json['data'][] = implode(',', $v);
					$json['total'] += round($v[1], 2);
				}
				$sz_pp_emails = $this->{'model_marketing_' . $this->name}->paypal_emails_total($data);				
				if($sz_pp_emails > 0) {
					$json['num_pmp_pages'] = ceil($sz_pp_emails / $this->pmp_max);
				} else {
					$json['num_pmp_pages'] = 0;
				}
				$json['num_pmp'] = $sz_pp_emails;
				$json['total'] = $this->currency->format($json['total'], $this->config->get('config_currency'));
				$json['data'] = implode(';', $json['data']);
			}
		} else {
			$json = array('error' => 'no_data');
		}
		$this->response->setOutput(json_encode($json));
	}
	
	public function confirm() {
		if(defined('_JEXEC')) $_REQUEST['format'] = $_GET['format'] = 'raw';
		if($this->user->hasPermission('modify', 'module/' . $this->name) && $this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['data']) && isset($this->request->post['description'])) {
			$data = $this->_prepare_data($this->request->post['data']);
			if(sizeof($data) < 1) {
				$json = array('error' => 'no_data');
			} else {
				$this->load->model('marketing/' . $this->name);
				$this->{'model_marketing_' . $this->name}->perform($data, $this->request->post['description'], $this->request->post['send_emails']);
				$this->language->load('module/' . $this->name);
				$this->session->data['success'] = $this->language->get('text_success');
				$json = array('success' => true);
			}
		} else {
			$json = array('error' => 'no_data');
		}
		$this->response->setOutput(json_encode($json));		
	}
	
	public function export_csv() {
		if (!$this->user->hasPermission('access', 'module/' . $this->name)) $this->response->redirect('error/permission', 'token=' . $this->session->data['token'], 'SSL');		
		if(defined('_JEXEC')) $_REQUEST['format'] = $_GET['format'] = 'raw';
		$error = false;
		if($this->request->server['REQUEST_METHOD'] != 'POST' || !isset($this->request->post['data'])) $error = true;
		if(!$error) {
			$data = $this->_prepare_data($this->request->post['data'], true);
			$sz_data = sizeof($data);
			if($sz_data < 1) $error = true;
		}
		if(!$error) {			
			$this->load->model('marketing/' . $this->name);
			$results = $this->{'model_marketing_' . $this->name}->csv($data);
			if(!$results) $error = true;
		}
		if($error) $this->response->redirect('error/not_found', 'token=' . $this->session->data['token'], 'SSL');
		$fsep = $this->request->post['fsep'] == 'c' ? ',' : "\t";
		$lsep = $this->request->post['lsep'] == 'm' ? "\n" : "\r\n";
		$fields = array_keys($results[0]);
		$out = implode($fsep, $fields) . $lsep;		
		foreach($results as $r) {
			$_ar = array();
			foreach($fields as $f) {
				$v = '';
				if($fsep == ',') $v .= '"';
				if(!is_null($r[$f])) {
					$_v = preg_replace("/[\n\r\s]+/", ' ', trim(html_entity_decode($r[$f], ENT_QUOTES, 'UTF-8')));
					if($fsep == ',') $_v = str_replace('"', '""', $_v);
					$v .= $_v;
				}
				if($fsep == ',') $v .= '"';
				$_ar[] = $v;
			}
			$out .= implode($fsep, $_ar) . $lsep;		
		}
		
		header('Content-Description: File Transfer');
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename=batch_payout-' . date('Y-m-d_H-i') . '.csv');
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public');
		header('Content-Length: ' . strlen($out));
		$this->response->setOutput($out);
	}
	
	
	public function export_paypal_mass_pay() {
		if (!$this->user->hasPermission('access', 'module/' . $this->name)) $this->response->redirect('error/permission', 'token=' . $this->session->data['token'], 'SSL');				
		if(defined('_JEXEC')) $_REQUEST['format'] = $_GET['format'] = 'raw';
		$error = false;
		if($this->request->server['REQUEST_METHOD'] != 'POST' || !isset($this->request->post['data']) || !isset($this->request->post['pmp_description'])) $error = true;
		if(!$error) {
			$data = $this->_prepare_data($this->request->post['data'], true);
			$sz_data = sizeof($data);
			if($sz_data < 1) $error = true;
		}
		if(!$error) {
			$this->load->model('marketing/' . $this->name);
			$pp_emails = $this->{'model_marketing_' . $this->name}->paypal_emails($data, true);
			$sz_pp_emails = sizeof($pp_emails);
			if($sz_pp_emails < 1) $error = true;
		}
		if($error) $this->response->redirect('error/not_found', 'token=' . $this->session->data['token'], 'SSL');
		$out = '';
		$ids = array_keys($pp_emails);
		if(ceil($sz_pp_emails / $this->pmp_max) > 1) {
			$page = isset($this->request->post['page']) ? intval($this->request->post['page']) : 1;
			$ids = array_slice($ids, ($page - 1) * $this->pmp_max, $this->pmp_max);
		}		
		
		$curr = $this->config->get('config_currency');
		$pmp_description = strlen($this->request->post['pmp_description']) . 0 ? preg_replace("/[\n\r\s]+/", ' ', trim(html_entity_decode($this->request->post['pmp_description'], ENT_QUOTES, 'UTF-8'))) : '';
		
		foreach($ids as $_id) {
			if(isset($data[$_id])) {
				$out .= implode("\t", array($pp_emails[$_id], number_format(round(floatval($data[$_id]), 2), 2, '.', ''), $curr, 'affpay_' . $_id, $pmp_description)) . "\n";
			}
		}
		
		header('Content-Description: File Transfer');
		header('Content-Type: application/octet-stream');
		header('Content-Disposition: attachment; filename=paypal_mass_pay-' . date('Y-m-d_H-i') . (isset($page) && $page > 1 ? '_' . $page : '') . '.txt');
		header('Content-Transfer-Encoding: binary');
		header('Expires: 0');
		header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
		header('Pragma: public');
		header('Content-Length: ' . strlen($out));
		$this->response->setOutput($out);
	}
	
	private function _prepare_data($data, $ids = false) {
		if(substr($data, -1) == ';') $data = substr($data, 0, -1);
		$data = explode(';', $data);
		$out = array();
		foreach($data as $v) {
			$v = explode(',', $v);
			if(sizeof($v) === 2 && preg_match("/^\d+$/", $v[0]) && $v[0] > 0 && preg_match("/^\d+(?:\.\d+)?$/", $v[1]) && $v[1] > 0) {
				if($ids) {
					$out[$v[0]] = $v[1];
				} else {
					$out[] = $v;
				}
			}
		}	
		return $out;
	}
	
	public function install() {		
		$this->module_permissions('add');
	}
	
	public function uninstall() {		
		$this->module_permissions('remove');
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
