<?php
class ControllerAffiliateTransaction extends Controller {
	public function index() {
		if (!$this->affiliate->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('affiliate/transaction', '', 'SSL');

			$this->response->redirect($this->url->link('affiliate/login', '', 'SSL'));
		}

	
			
		//+mod by yp start
		if($this->config->get('account_combine_status')) {
			$this->load->model('affiliate/account_combine');
			if(isset($this->session->data['accc_force_required']) || $this->model_affiliate_account_combine->forceRequired()) {
				$this->session->data['accc_force_required'] = 1;
				$this->response->redirect($this->url->link('affiliate/info', '', 'SSL'));
			}		
		}
		//+mod by yp end
		

		$this->load->language('affiliate/transaction');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('affiliate/account', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_transaction'),
			'href' => $this->url->link('affiliate/transaction', '', 'SSL')
		);

		$this->load->model('affiliate/transaction');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_description'] = $this->language->get('column_description');
		$data['column_amount'] = sprintf($this->language->get('column_amount'), $this->config->get('config_currency'));

		$data['text_balance'] = $this->language->get('text_balance');
		$data['text_empty'] = $this->language->get('text_empty');

		$data['button_continue'] = $this->language->get('button_continue');

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['transactions'] = array();

		$filter_data = array(
			'sort'  => 't.date_added',
			'order' => 'DESC',
			'start' => ($page - 1) * 10,
			'limit' => 10
		);

		$transaction_total = $this->model_affiliate_transaction->getTotalTransactions();

		$results = $this->model_affiliate_transaction->getTransactions($filter_data);

		foreach ($results as $result) {
			$data['transactions'][] = array(
				'amount'      => $this->currency->format($result['amount'], $this->config->get('config_currency')),
				'description' => $result['description'],
				'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		$pagination = new Pagination();
		$pagination->total = $transaction_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('affiliate/transaction', 'page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($transaction_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($transaction_total - 10)) ? $transaction_total : ((($page - 1) * 10) + 10), $transaction_total, ceil($transaction_total / 10));

		$data['balance'] = $this->currency->format($this->model_affiliate_transaction->getBalance());


			
		//+mod by yp start
		$data['accc_allow_funds_transfer'] = false;
		if($this->config->get('account_combine_status') && $this->config->get('account_combine_allow_funds_transfer')) {			
			$_balance = $this->model_affiliate_transaction->getBalance();
			if($_balance > 0) {
				$this->language->load('affiliate/account_combine');
				$data['text_loading'] = $this->language->get('text_loading');
				$data['accc_allow_funds_transfer'] = true;
				$data['balance_raw'] = $this->currency->convert($_balance, $this->config->get('config_currency'),  $this->currency->getCode());			
				$data['action_funds_transfer'] = $this->url->link('affiliate/account_combine/transaction', '', 'SSL');
				$data['entry_funds_transfer_input'] = sprintf($this->language->get('entry_funds_transfer_input'), $data['balance']);
				$data['symbol_left'] = $this->currency->getSymbolLeft();
				$data['symbol_right'] = $this->currency->getSymbolRight();
				$data['button_funds_transfer'] = $this->language->get('button_funds_transfer');
				$data['error_invalid_transfer_amount'] = $this->language->get('error_invalid_transfer_amount');				
				$data['error_invalid_transfer_amount_js'] = addcslashes(str_replace(array("\r\n", "\n", "\r"), array(' ', ' ', ' '), strip_tags(html_entity_decode($data['error_invalid_transfer_amount'], ENT_COMPAT))), "'");
				$data['credit_amount_message'] = addcslashes(str_replace(array("\r\n", "\n", "\r"), array(' ', ' ', ' '), $this->language->get('text_credit_amount_message')), "'");
				$data['transfer_multiplier'] = $this->config->get('account_combine_transfer_multiplier') ? $this->config->get('account_combine_transfer_multiplier') : 1;
				$data['use_multiplier'] = (float) $data['transfer_multiplier'] === 1.0 ? false : true;
				
			}		
		}
		//+mod by yp end
		


			
		//+mod by yp start
		$this->load->model('affiliate/mta_affiliate');
		$this->language->load('affiliate/mta');
		foreach(array('text_total_earnings', 'text_view_subs', 'column_level', 'column_num_affs', 'text_affiliate_downline') as $_v) {
			$data[$_v] = $this->language->get($_v);		
		}
		$data['total_earnings'] = $this->currency->format($this->model_affiliate_mta_affiliate->getTotalEarnings());			
		$limit = $this->config->get('mta_ypx_downline_limit');
		if($limit) {			
			$self_aff = $this->model_affiliate_mta_affiliate->getAffiliate($this->affiliate->getId());
			$max_level = intval($self_aff['level_original']) + intval($limit);
		} else {
			$max_level = false;
		}
		
		$_sub_affs = $this->model_affiliate_mta_affiliate->getSubAffiliates(((int)$this->affiliate->getId()), $max_level);
		if($_sub_affs) {
			$data['sub_affiliates'] = array();
			foreach($_sub_affs as $_i => $_num) {
				$data['sub_affiliates'][] = array('level' => ($_i + 1), 'num' => $_num);
			}
		} else {
			$data['sub_affiliates'] = false;
		}
		$data['show_downline'] = $this->config->get('mta_ypx_downline');
		$data['link_affiliate_downline'] = $this->url->link('affiliate/downline', '', 'SSL');		
		//+mod by yp end


		$data['continue'] = $this->url->link('affiliate/account', '', 'SSL');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/affiliate/transaction.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/affiliate/transaction.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/affiliate/transaction.tpl', $data));
		}
	}
}