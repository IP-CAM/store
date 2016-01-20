<?php
class ControllerModuleTrackingInput extends Controller {
	private $error = array(); 
	private $name = 'tracking_input';
	private $_settings_default = array(
			'redirect' => 0,
			'show_close_button' => 1,
			'no_cookie_only' => 0,
			'show' => 'session',
			'status' => 0,
			'choose_code' => 1,
			'choose_code_checkout' => 0,
			'require_code' => 1,
			'edit_code' => 0,
			'dir_template' => '',
			'allow_coupon' => 0,
			'allow_marketing' => 0
		);	
	private $tpl_sep = '<!-- ---------------- -->';
	
	public function install() {
		if (!$this->user->hasPermission('modify', 'extension/module')) return;		
		$_settings = array();
		foreach($this->_settings_default as $k => $v) {
			$_settings[$this->name . '_' . $k] = $v;
		}
		$_tpldir = $this->_find_dir_template();
		if($_tpldir) $_settings[$this->name . '_dir_template'] = $_tpldir;
		$_settings[$this->name . '_module'] = array(
        'default_column' => array('language_id' => 1,
			'text_heading' => 'Referral Code',		
            'text' => 'Were you referred by someone?&lt;br /&gt;Enter code here:',
            'text_thankyou' => 'Thank You!',
            'button' => 'OK',
            'error_message' => 'Sorry, this code does not exist !',
            'template' => 'default_column'
        ),
		'default_row' => array
			('language_id' => 1,
			'text_heading' => '',
            'text' => 'Were you referred by someone? Type-in the code here: ',
            'text_thankyou' => 'Thank you, your code is accepted !',
            'button' => 'OK',
            'error_message' => 'Sorry, this code does not exist !',
            'template' => 'default_row'
        )		
		);
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting($this->name, $_settings);

		$this->module_permissions();
		
		if(VERSION !== '2.0.0.0') {
			$this->load->model('extension/module');
			foreach($_settings[$this->name . '_module'] as $_k => $_v) {
				$_v['name'] = ucwords(str_replace('_', ' ', $_k));
				$_v['status'] = '1';
				$this->model_extension_module->addModule($this->name, $_v);
			}
		}
	}
	
	public function index() {   
		if(VERSION !== '2.0.0.0' && isset($this->request->get['module_id'])) {
			$this->index_module();
			return;
		}
		$data['accc'] = $this->config->get('account_combine_status');
		if(!$this->config->get($this->name . '_dir_template')) {
			$_tpldir = $this->_find_dir_template();
			if($_tpldir) $this->config->set($this->name . '_dir_template', $_tpldir);
		}
		$this->language->load('module/' . $this->name);

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!$this->user->hasPermission('modify', 'module/' . $this->name)) $this->response->redirect($this->url->link('error/permission', 'token=' . $this->session->data['token'], 'SSL'));			
			$this->model_setting_setting->editSetting($this->name, $this->request->post);
			if(VERSION !== '2.0.0.0' && isset($this->request->post[$this->name . '_module']['name']) && strlen($this->request->post[$this->name . '_module']['name']) > 0) {
				$this->load->model('extension/module');
				$this->model_extension_module->addModule($this->name, $this->request->post[$this->name . '_module']);
			}
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		$data = array_merge($data, $this->language->load('module/' . $this->name));	
		$data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';
				
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
		
		$data['action'] = $this->url->link('module/' . $this->name, 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['image_close'] = file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/image/close.png') ? '../catalog/view/theme/' . $this->config->get('config_template') . '/image/close.png' : '../catalog/view/theme/default/image/close.png';
		$data['entry_show_close_button'] = sprintf($data['entry_show_close_button'], $data['image_close']);

		$data['token'] = $this->session->data['token'];

		foreach($this->_settings_default as $k => $v) {	
			$data[$this->name . '_' . $k] = isset($this->request->post[$this->name . '_' . $k]) ? $this->request->post[$this->name . '_' . $k] : $this->config->get($this->name . '_' . $k);
		}
		
		$data['modules'] = array();
		
		if(VERSION === '2.0.0.0') {
			if (isset($this->request->post[$this->name . '_module'])) {
				$data['modules'] = $this->request->post[$this->name . '_module'];
			} elseif ($this->config->get($this->name . '_module')) { 
				$data['modules'] = $this->config->get($this->name . '_module');
			}
		} else {
			$this->load->model('extension/module');
			$_ms = $this->model_extension_module->getModulesByCode($this->name);
			foreach($_ms as $_m) {				
				$data['modules'][$_m['module_id']] = version_compare(VERSION, '2.1', '<') ? unserialize($_m['setting']) : json_decode($_m['setting'], true);
			}
		}
		
		$_res = $this->db->query("SELECT `code` FROM " . DB_PREFIX . "layout_module WHERE `code` LIKE '" . $this->db->escape($this->name . '.') . "%'");
		$_used = array();
		foreach($_res->rows as $_r) {
			$_used[] = $_r['code'];
		}
		$data['used_templates'] = array();
		foreach($data['modules'] as $_i => $_m) {
			if(isset($_m['template'])) $data['used_templates'][] = $_m['template'];
			$data['modules'][$_i]['removable'] = !in_array($this->name . '.' . $_i, $_used);
			$data['modules'][$_i]['key'] = $_i;
		}
		$data['used_templates'] = array_values(array_unique($data['used_templates']));
		
		$data['templates'] = $this->_get_templates();
		$data['templates_display'] = array();
		foreach($data['templates'] as $_tpl) {
			$data['templates_display'][$_tpl] = ucwords(preg_replace("/[^a-z0-9]+/", ' ', strtolower($_tpl)));
		}				

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['num_languages'] = sizeof($data['languages']);	
	
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		$tplv = VERSION === '2.0.0.0' ? '_2000' : '';
		$this->response->setOutput($this->load->view('module/' . $this->name . $tplv .  '.tpl', $data));
	}
	
	public function tpl_create() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$error = false;
		if (!$this->user->hasPermission('modify', 'module/' . $this->name)) {
			$this->language->load('module/' . $this->name);
			$this->response->setOutput($this->language->get('error_permission'));
			return;
		}
		$from = $this->tpl_read(true);
		if(!$from) $error = true;
		
		if(!$error) {
			$fp = @fopen($this->config->get($this->name . '_dir_template') . $this->config->get('config_template') . '/template/module/' . $this->name . '_' . strtolower($this->request->request['name']) . '.tpl', 'w');
			if(!$fp) $error = true;
		}
		if(!$error) {
			fwrite($fp, $from . "\n" . $this->tpl_sep . "\n" . '<script type="text/javascript">$(\'#tracking-input-div\').data(\'d\', <?php echo $json;?>);</script>');
			fclose($fp);
		}		
		$this->response->setOutput($error ? '0' : '1');
	}
	
	public function tpl_read($do_return = false) {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$out = '';
		$dir_template = $this->config->get($this->name . '_dir_template');
		if(isset($this->request->request['tpl']) && !preg_match("/[^\w]/", $this->request->request['tpl']) && $dir_template) {
			$f = false;
			$_f = $dir_template . $this->config->get('config_template') . '/template/module/' . $this->name . '_' . strtolower($this->request->request['tpl']) . '.tpl';
			if(file_exists($_f)) {
				$f = $_f;
			} 
			if($f === false && $this->config->get('config_template') != 'default') {
				$_f = $dir_template . 'default/template/module/' . $this->name . '_' . strtolower($this->request->request['tpl']) . '.tpl';			
				if(file_exists($_f)) $f = $_f;
			}
			if($f) $out = file_get_contents($f);
		}
		if(strlen($out) > 0) {
			$_ar = explode($this->tpl_sep, $out);
			if(sizeof($_ar) < 2) {
				$out = '';
			} else {
				$out = $_ar[0];
			}
		}
		if($do_return) return $out;
		$this->response->setOutput($out);		
	}

	public function tpl_update() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$error = true;
		if (!$this->user->hasPermission('modify', 'module/' . $this->name)) {
			$this->language->load('module/' . $this->name);
			$this->response->setOutput($this->language->get('error_permission'));
			return;
		}
		$content = html_entity_decode($this->request->post['content'], ENT_QUOTES, 'UTF-8') . "\n" . $this->tpl_sep . "\n" . '<script type="text/javascript">$(\'#tracking-input-div\').data(\'d\', <?php echo $json;?>);</script>';
		$dir_template = $this->config->get($this->name . '_dir_template');
		$_f = $dir_template . $this->config->get('config_template') . '/template/module/' . $this->name . '_' . strtolower($this->request->request['tpl']) . '.tpl';
		if(file_exists($_f)) {
			$fp = @fopen($_f, 'w');
			if($fp) {
				fwrite($fp, $content);
				fclose($fp);
				$error = false;
			}
		}
		if($this->config->get('config_template') != 'default') {
			$_f = $dir_template . 'default/template/module/' . $this->name . '_' . strtolower($this->request->request['tpl']) . '.tpl';			
			if(file_exists($_f)) {
				$fp = @fopen($_f, 'w');
				if($fp) {
					fwrite($fp, $content);
					fclose($fp);
					$error = false;
				}
			}		
		}
		$this->response->setOutput($error ? '0' : '1');
	}

	public function tpl_delete() {		
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$error = true;
		if (!$this->user->hasPermission('modify', 'module/' . $this->name)) {
			$this->language->load('module/' . $this->name);
			$this->response->setOutput($this->language->get('error_permission'));
			return;
		}
		$dir_template = $this->config->get($this->name . '_dir_template');
		$_f = $dir_template . $this->config->get('config_template') . '/template/module/' . $this->name . '_' . strtolower($this->request->request['tpl']) . '.tpl';
		if(file_exists($_f)) @unlink($_f);
		if(!file_exists($_f)) $error = false;
		if($this->config->get('config_template') != 'default') {
			$_f = $dir_template . 'default/template/module/' . $this->name . '_' . strtolower($this->request->request['tpl']) . '.tpl';					
			if(file_exists($_f)) @unlink($_f);
			if(!file_exists($_f)) $error = false;
		}
		$this->response->setOutput($error ? '0' : '1');
	}	
	
	private function validate($check_tpl = true) {
		if($check_tpl && (strlen(trim($this->request->post[$this->name . '_dir_template'])) < 1 || !is_dir($this->request->post[$this->name . '_dir_template'] . 'default/template/'))) {
			$this->error['warning'] = $this->language->get('error_dir_template');
			$this->request->post[$this->name . '_dir_template'] = '';
		}
		if (!$this->user->hasPermission('modify', 'module/' . $this->name)) $this->error['warning'] = $this->language->get('error_permission');
		return (!$this->error ? true : false);
	}
	
	private function _get_templates() {
		$dir_template = $this->config->get($this->name . '_dir_template');
		if(!$dir_template) return array();		
		$_cwd = getcwd();
		chdir($dir_template . $this->config->get('config_template') . '/template/module');
		$_ar = glob('*.tpl');
		$out = array();
		foreach($_ar as $f) {
			if(strpos($f, $this->name . '_') === 0) $out[] = substr(basename($f, '.tpl'), strlen($this->name) + 1);
		}
		if($this->config->get('config_template') != 'default') {
			chdir($dir_template . 'default/template/module');
			$_ar = glob('*.tpl');			
			foreach($_ar as $f) {
				if(strpos($f, $this->name . '_') === 0) {
					$f = substr(basename($f, '.tpl'), strlen($this->name) + 1);
					if(!in_array($f, $out)) $out[] = $f;
				}
			}		
		}
		sort($out);
		chdir($_cwd);
		return $out;
	}
	
	private function _find_dir_template() {		
		$guessed_root = preg_replace("/[^\/]+\/?$/", '', DIR_APPLICATION);
		$guessed1 = $guessed_root . 'catalog/view/theme/';
		if(is_dir($guessed1)) return $guessed1;
		if(file_exists($guessed_root . 'config.php')) {
			$cfg = file_get_contents($guessed_root . 'config.php');
			if(preg_match("/define\s*\(\s*[\'\"]DIR_TEMPLATE[\'\"],\s*[\'\"]([^\'\"]+)[\'\"]\)\;/", $cfg, $_ar) && is_dir($_ar[1] . 'default/template/')) return $_ar[1];
		}
		return false;	
	}
	
	protected function index_module() {
		$this->load->model('extension/module');
		$this->language->load('module/' . $this->name);		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate(false)) {
			if (!$this->user->hasPermission('modify', 'module/' . $this->name)) $this->response->redirect($this->url->link('error/permission', 'token=' . $this->session->data['token'], 'SSL'));			
			if(isset($this->request->post[$this->name . '_module']['name']) && strlen($this->request->post[$this->name . '_module']['name']) > 0) $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post[$this->name . '_module']);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}	
		$this->document->setTitle($this->language->get('heading_title'));
		if(!isset($data)) $data = array();
		$data = array_merge($data, $this->language->load('module/' . $this->name));	
		$data['error_warning'] = isset($this->error['warning']) ? $this->error['warning'] : '';
				
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
			'href'      => $this->url->link('module/' . $this->name, 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/' . $this->name, 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');		

		$data['token'] = $this->session->data['token'];	
		
		
		if (isset($this->request->post[$this->name . '_module'])) {
			$data['module'] = $this->request->post[$this->name . '_module'];
		} else { 
			$data['module'] = $this->model_extension_module->getModule($this->request->get['module_id']);
		}	
		
		$data['name'] = $data['module']['name'];

		$data['templates'] = $this->_get_templates();
		$data['templates_display'] = array();
		foreach($data['templates'] as $_tpl) {
			$data['templates_display'][$_tpl] = ucwords(preg_replace("/[^a-z0-9]+/", ' ', strtolower($_tpl)));
		}				

		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['num_languages'] = sizeof($data['languages']);			
				
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');		
		$this->response->setOutput($this->load->view('module/' . $this->name . '_module_edit.tpl', $data));		
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
