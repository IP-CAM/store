<?php
class ControllerAccountRegister extends Controller {
	private $error = array();

	public function index() {
		if ($this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/account', '', 'SSL'));
		}

		$this->load->language('account/register');


			
		if ($this->config->get('account_combine_status')) $this->language->load('affiliate/account_combine_info');//+mod by yp
		

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$customer_id = $this->model_account_customer->addCustomer($this->request->post);

			// Clear any previous login attempts for unregistered accounts.
			$this->model_account_customer->deleteLoginAttempts($this->request->post['email']);

			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $customer_id,
				'name'        => $this->request->post['firstname'] . ' ' . $this->request->post['lastname']
			);

			$this->model_account_activity->addActivity('register', $activity_data);


			
			if($this->config->get('account_combine_status') && $this->affiliate->login('', '', $this->customer->getId())) $this->response->redirect($this->config->get('config_affiliate_approval') ? $this->url->link('affiliate/account', '', 'SSL') : $this->url->link('affiliate/account_combine', '', 'SSL')); //+mod by yp
			

			$this->response->redirect($this->url->link('account/success'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('account/register', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', 'SSL'));
		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_your_address'] = $this->language->get('text_your_address');
		$data['text_your_password'] = $this->language->get('text_your_password');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_company'] = $this->language->get('entry_company');
		$data['entry_address_1'] = $this->language->get('entry_address_1');
		$data['entry_address_2'] = $this->language->get('entry_address_2');
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_upload'] = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['address_1'])) {
			$data['error_address_1'] = $this->error['address_1'];
		} else {
			$data['error_address_1'] = '';
		}

		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}

		if (isset($this->error['postcode'])) {
			$data['error_postcode'] = $this->error['postcode'];
		} else {
			$data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = '';
		}

		if (isset($this->error['custom_field'])) {
			$data['error_custom_field'] = $this->error['custom_field'];
		} else {
			$data['error_custom_field'] = array();
		}

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
		}

		$data['action'] = $this->url->link('account/register', '', 'SSL');

		$data['customer_groups'] = array();

		if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$data['customer_groups'][] = $customer_group;
				}
			}
		}

		if (isset($this->request->post['customer_group_id'])) {
			$data['customer_group_id'] = $this->request->post['customer_group_id'];
		} else {
			$data['customer_group_id'] = $this->config->get('config_customer_group_id');
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$data['telephone'] = $this->request->post['telephone'];
		} else {
			$data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$data['fax'] = $this->request->post['fax'];
		} else {
			$data['fax'] = '';
		}

		if (isset($this->request->post['company'])) {
			$data['company'] = $this->request->post['company'];
		} else {
			$data['company'] = '';
		}

		if (isset($this->request->post['address_1'])) {
			$data['address_1'] = $this->request->post['address_1'];
		} else {
			$data['address_1'] = '';
		}

		if (isset($this->request->post['address_2'])) {
			$data['address_2'] = $this->request->post['address_2'];
		} else {
			$data['address_2'] = '';
		}

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		} elseif (isset($this->session->data['shipping_address']['postcode'])) {
			$data['postcode'] = $this->session->data['shipping_address']['postcode'];
		} else {
			$data['postcode'] = '';
		}

		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} else {
			$data['city'] = '';
		}

		if (isset($this->request->post['country_id'])) {
			$data['country_id'] = (int)$this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = (int)$this->request->post['zone_id'];
		} elseif (isset($this->session->data['shipping_address']['zone_id'])) {
			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		} else {
			$data['zone_id'] = '';
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		// Custom Fields
		$this->load->model('account/custom_field');

		$data['custom_fields'] = $this->model_account_custom_field->getCustomFields();

		if (isset($this->request->post['custom_field'])) {
			if (isset($this->request->post['custom_field']['account'])) {
				$account_custom_field = $this->request->post['custom_field']['account'];
			} else {
				$account_custom_field = array();
			}

			if (isset($this->request->post['custom_field']['address'])) {
				$address_custom_field = $this->request->post['custom_field']['address'];
			} else {
				$address_custom_field = array();
			}

			$data['register_custom_field'] = $account_custom_field + $address_custom_field;
		} else {
			$data['register_custom_field'] = array();
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		if (isset($this->request->post['newsletter'])) {
			$data['newsletter'] = $this->request->post['newsletter'];
		} else {
			$data['newsletter'] = '';
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$data['captcha'] = $this->load->controller('captcha/' . $this->config->get('config_captcha'), $this->error);
		} else {
			$data['captcha'] = '';
		}

		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), 'SSL'), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}


			
		//+mod by yp start
		$data['show_affiliate_section'] = 0;
		$accc_status = $this->config->get('account_combine_status');
		if($accc_status) {
			$rform = $this->config->get('account_combine_rform');
			if($rform['affiliate'] == 'n') $accc_status = false;
		}
		if($accc_status) {
			if(!isset($data['aff_fields'])) $data['aff_fields'] = $this->config->get('account_combine__fields');		
			$data['payment_methods'] = $this->config->get('account_combine__payment_methods');
			$fields = $this->config->get('account_combine_fields');
			$data['show_affiliate_section'] = 1;
			$data['website_textarea'] = $rform['website_textarea'];
			
			$data['affiliate_choice'] = $rform['affiliate'] == 'c';
			if ($data['affiliate_choice']) {
				if (isset($this->request->post['accc_create_affiliate_account'])) {
					$data['accc_create_affiliate_account'] = $this->request->post['accc_create_affiliate_account'];				
				} else {
					if(isset($this->session->data['accc_show_aff_section'])) {
						$data['accc_create_affiliate_account'] = 1;
						unset($this->session->data['accc_show_aff_section']);
					} else {
						$data['accc_create_affiliate_account'] = isset($this->session->data['redirect']) && $this->session->data['redirect'] == $this->url->link('affiliate/account', '', 'SSL') ? 1 : 0;
					}
				}
			}
			
			if ($rform['agreement']) {			
				$this->load->model('affiliate/account_combine');
				$aff_information_info = $this->model_affiliate_account_combine->getAgreement();
				if ($aff_information_info) {
					$data['text_affiliate_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_affiliate_id'), 'SSL'), $aff_information_info['title'], $aff_information_info['title']);
					$data['error_affiliate_agree'] = str_replace(array("\r\n", "\r", "\n"), array('\\n', '\\n', '\\n'), addslashes(html_entity_decode(sprintf($this->language->get('error_agree'), $aff_information_info['title']), ENT_QUOTES, 'UTF-8')));
					if (isset($this->request->post['affiliate_agree'])) {
						$data['affiliate_agree'] = $this->request->post['affiliate_agree'];
					} else {
						$data['affiliate_agree'] = false;
					}						
				} else {
					$data['text_affiliate_agree'] = '';
					$data['error_affiliate_agree'] = false;
				}			
			} else {
				$data['error_affiliate_agree'] = false;
				$data['text_affiliate_agree'] = '';
			}			
			
			$data['text_affiliate_information'] = $this->language->get('text_info');
			$data['text_affiliate_checkbox_confirm'] = $this->language->get('text_affiliate_checkbox_confirm');
			
			foreach($data['aff_fields'] as $field) {
				$data[$field] = ($field == 'payment' ? $fields['payment_default'] : '');
				if($fields[$field] == 'n' || !$rform['show_' . $field]) {
					$data['entry_' . $field] = '';
					$data['use_' . $field] = false;				
					$data[$field . '_required'] = false;
					$data['error_' . $field] = '';				
				} else {
					$data['entry_' . $field] = $this->language->get('entry_' . $field);
					$data['use_' . $field] = true;
					if (isset($this->request->post[$field])) $data[$field] = $this->request->post[$field];
					$data[$field . '_required'] = ($fields[$field] == 'r');
					$data['error_' . $field] = (isset($this->error[$field]) ? $this->error[$field] : '');
				}		
			}

			foreach($data['payment_methods'] as $method) {
				if($fields['payment'] == 'n' || !$rform['show_payment']) $fields['use_' . $method] = false;
				if($fields['use_' . $method]) {
					$data['use_' . $method] = true;
					$data['text_' . $method] = $this->language->get('text_' . $method);
					if(isset($fields[$method]) && !$fields[$method]) continue;
					if(!isset($fields[$method]) || !is_array($fields[$method])) $fields[$method] = array('_' => 1);
					foreach($fields[$method] as $mfield => $_use) {					
						$mfield = $method . ($mfield == '_' ? '' : '_' . $mfield);
						if(!$_use) {
							$data['use_' . $mfield] = false;
							continue;
						}
						$data['use_' . $mfield] = true;
						$data[$mfield . '_required'] = $data['payment_required'];
						$data['entry_' . $mfield] = $this->language->get('entry_' . $mfield);
						if (isset($this->request->post[$mfield])) {
							$data[$mfield] = $this->request->post[$mfield];
						} else {
							$data[$mfield] = '';		
						}						
						$data['error_' . $mfield] = (isset($this->error[$mfield]) ? $this->error[$mfield] : '');					
					}
				} else {
					$data['use_' . $method] = false;				
				}		
			}		
		}
		//+mod by yp end	
		

		if (isset($this->request->post['agree'])) {
			$data['agree'] = $this->request->post['agree'];
		} else {
			$data['agree'] = false;
		}



		//+mod by yp start
		if (isset($accc_status) && $accc_status && $this->config->get('tracking_input_status') && $this->config->get('tracking_input_choose_code')) {
			$data['tracking_input_show'] = true;
			$data['tracking_input_settings_json'] = array(
				'accc' => true,
				'tracking_input_value' => (isset($this->request->post['tracking_input']) ? $this->request->post['tracking_input'] : ''),
				'error' => ''
			);
			if(isset($this->error['tracking_input'])) $data['tracking_input_settings_json']['error'] = is_array($this->error['tracking_input']) ? implode('<br />', $this->error['tracking_input']) : $this->error['tracking_input'];			
			$this->language->load('affiliate/tracking_input');
			foreach(array('exists', 'invalid', 'long', 'required') as $_v) {
				$data['tracking_input_settings_json']['error_' . $_v] = $this->language->get('error_tracking_code_' . $_v);
			}
			$data['tracking_input_settings_json']['required'] = $this->config->get('tracking_input_require_code') ? 1 : 0;			
			$data['tracking_input_settings_json']['entry'] = $this->language->get('entry_tracking_input');
			$data['tracking_input_settings_json']['help'] = $this->language->get('help_tracking_input');
			$data['tracking_input_settings_json']['link_check'] = html_entity_decode($this->url->link('affiliate/tracking_input/check_tracking', '', 'SSL'), ENT_QUOTES, 'UTF-8');
			$data['tracking_input_settings_json'] = json_encode($data['tracking_input_settings_json']);			
			$this->document->addScript('catalog/view/javascript/trifyp.min.js');
		} else {
			$data['tracking_input_show'] = false;
		}
		//+mod by yp end				
			
			
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/register.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/register.tpl', $data));
		}
	}

	private function validate() {

			
		//+mod by yp start
		$do_aff = false;
		if($this->config->get('account_combine_status')) {
			$rform = $this->config->get('account_combine_rform');
			if($rform['affiliate'] == 'y' || ($rform['affiliate'] == 'c' && isset($this->request->post['accc_create_affiliate_account']) && $this->request->post['accc_create_affiliate_account'])) $do_aff = true;			
		}
		if($do_aff === true) {			
			if($rform['agreement']) {
				$this->load->model('affiliate/account_combine');
				$affagr = $this->model_affiliate_account_combine->getAgreement();
				if ($affagr && (!isset($this->request->post['affiliate_agree']) || !$this->request->post['affiliate_agree'])) {
					$this->error['warning'] = sprintf($this->language->get('error_agree'), $affagr['title']);
				}				
			}
			$fields = $this->config->get('account_combine_fields');
			if(!isset($data['aff_fields'])) $data['aff_fields'] = $this->config->get('account_combine__fields');
			foreach($data['aff_fields'] as $field) {
				if($fields[$field] == 'n' || !$rform['show_' . $field]) continue;
				if(isset($this->request->post[$field])) $this->request->post[$field] = trim($this->request->post[$field]);
				if($fields[$field] == 'r' && (!isset($this->request->post[$field]) || utf8_strlen($this->request->post[$field]) < 1)) $this->error[$field] = $this->language->get('error_' . $field);
			}			
			if($rform['show_payment'] && $fields['payment'] == 'r') {
				$method = $this->request->post['payment'];
				if(!isset($fields['use_' . $method]) || !$fields['use_' . $method]) {
					$this->error['payment'] = $this->language->get('error_payment');
				} else {				
					if(!isset($fields[$method]) || ($fields[$method] && !is_array($fields[$method]))) $fields[$method] = array('_' => 1);
					foreach($fields[$method] as $mfield => $_use) {					
						$mfield = $method . ($mfield == '_' ? '' : '_' . $mfield);
						if(!$_use) continue;
						if(isset($this->request->post[$mfield])) $this->request->post[$mfield] = trim($this->request->post[$mfield]);
						if(!isset($this->request->post[$mfield]) || utf8_strlen($this->request->post[$mfield]) < 1) $this->error[$mfield] = $this->language->get('error_' . $mfield);			
					}
				}		
			}		
		}
		//+mod by yp end
		

		
			
		//+mod by yp start
		if (isset($do_aff) && $do_aff === true && $this->config->get('tracking_input_status') && $this->config->get('tracking_input_choose_code')) {
			$this->language->load('affiliate/tracking_input');
			$_er = array();
			if(strlen($this->request->post['tracking_input']) < 1) {
				if($this->config->get('tracking_input_require_code')) $_er[] = $this->language->get('error_tracking_code_required');
			} else {
				if(!preg_match("/^[\w\-]+$/", $this->request->post['tracking_input'])) $_er[] = $this->language->get('error_tracking_code_invalid');
				if(strlen($this->request->post['tracking_input']) > 20) $_er[] = $this->language->get('error_tracking_code_long');
				if(sizeof($_er) < 1) {
					$this->load->model('affiliate/affiliate');
					if($this->model_affiliate_affiliate->getAffiliateByCode($this->request->post['tracking_input']))  $_er[] = $this->language->get('error_tracking_code_exists');
				}
				if(sizeof($_er) < 1 && $this->config->get('tracking_input_allow_coupon')) {
					$_mpfx = version_compare(VERSION, '2.1', '<') ? 'checkout' : 'total';
					$this->load->model($_mpfx . '/coupon');
					if($this->{'model_' . $_mpfx . '_coupon'}->getCoupon($this->request->post['tracking_input'])) $_er[] = $this->language->get('error_tracking_code_exists');
				}				
			}
			if(sizeof($_er) > 0) $this->error['tracking_input'] = sizeof($_er) > 1 ? $_er : $_er[0];			
		}
		//+mod by yp end
		
			
		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		if ((utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if ((utf8_strlen(trim($this->request->post['address_1'])) < 3) || (utf8_strlen(trim($this->request->post['address_1'])) > 128)) {
			$this->error['address_1'] = $this->language->get('error_address_1');
		}

		if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
			$this->error['city'] = $this->language->get('error_city');
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		}

		if (!isset($this->request->post['zone_id']) || $this->request->post['zone_id'] == '' || !is_numeric($this->request->post['zone_id'])) {
			$this->error['zone'] = $this->language->get('error_zone');
		}

		// Customer Group
		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->post['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		// Custom field validation
		$this->load->model('account/custom_field');

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			if ($custom_field['required'] && empty($this->request->post['custom_field'][$custom_field['location']][$custom_field['custom_field_id']])) {
				$this->error['custom_field'][$custom_field['custom_field_id']] = sprintf($this->language->get('error_custom_field'), $custom_field['name']);
			}
		}

		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

		// Captcha
		if ($this->config->get($this->config->get('config_captcha') . '_status') && in_array('register', (array)$this->config->get('config_captcha_page'))) {
			$captcha = $this->load->controller('captcha/' . $this->config->get('config_captcha') . '/validate');

			if ($captcha) {
				$this->error['captcha'] = $captcha;
			}
		}

		// Agree to terms
		if ($this->config->get('config_account_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

			if ($information_info && !isset($this->request->post['agree'])) {
				$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
			}
		}

		return !$this->error;
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
