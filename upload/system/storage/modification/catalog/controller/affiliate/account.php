<?php
class ControllerAffiliateAccount extends Controller {
	public function index() {
		if (!$this->affiliate->isLogged()) {

			
			//+mod by yp start
			if ($this->config->get('account_combine_status') && $this->customer->isLogged()) {			
				$this->response->redirect($this->url->link('affiliate/account_combine', '', 'SSL'));
			}		
			//+mod by yp end
			

			$this->session->data['redirect'] = $this->url->link('affiliate/account', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

		$this->load->language('affiliate/account');

	
			
		//+mod by yp start
		if($this->config->get('account_combine_status')) {
			$this->load->model('affiliate/account_combine');
			if(isset($this->session->data['accc_force_required']) || $this->model_affiliate_account_combine->forceRequired()) {
				$this->session->data['accc_force_required'] = 1;
				$this->response->redirect($this->url->link('affiliate/info', '', 'SSL'));
			}		
		}
		//+mod by yp end			
		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('affiliate/account', '', 'SSL')
		);

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_my_account'] = $this->language->get('text_my_account');
		$data['text_my_tracking'] = $this->language->get('text_my_tracking');
		$data['text_my_transactions'] = $this->language->get('text_my_transactions');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_tracking'] = $this->language->get('text_tracking');
		$data['text_transaction'] = $this->language->get('text_transaction');

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['edit'] = $this->url->link('affiliate/edit', '', 'SSL');
		$data['password'] = $this->url->link('affiliate/password', '', 'SSL');
		$data['payment'] = $this->url->link('affiliate/payment', '', 'SSL');
		$data['tracking'] = $this->url->link('affiliate/tracking', '', 'SSL');
		$data['transaction'] = $this->url->link('affiliate/transaction', '', 'SSL');


			//+mod by yp start
			$this->language->load('affiliate/mta');
			foreach(array('text_signup_link', 'text_aff_link_any_page', 'text_affiliate_downline') as $_v) {
				$data[$_v] = $this->language->get($_v);		
			}						
			$data['signup_link'] = $this->url->link('affiliate/register', 'tracking=' . $this->affiliate->getCode(), 'SSL');
			$data['show_downline'] = $this->config->get('mta_ypx_downline');
			$data['link_affiliate_downline'] = $this->url->link('affiliate/downline', '', 'SSL');
			//+mod by yp end
			


		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

	
			
		//+mod by yp start 
		if ($this->config->get('account_combine_status')) {
			$data['accc'] = true;
			$this->language->load('affiliate/account_combine');
			$data['text_affiliate_info'] = $this->language->get('text_affiliate_info');
			$data['affiliate_info'] = $this->url->link('affiliate/info', '', 'SSL');
			$data['text_customer_account'] = $this->language->get('text_customer') . ' ' . $this->language->get('text_account');
			$data['customer_account'] = $this->url->link('account/account', '', 'SSL');
		} else {
			$data['accc'] = false;
		}
		//+mod by yp end			
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/account.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/account.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/account.tpl', $data));
		}
	}
}