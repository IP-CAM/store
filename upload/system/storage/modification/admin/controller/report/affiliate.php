<?php
class ControllerReportAffiliate extends Controller {
	public function index() {
		$this->load->language('report/affiliate');


		$filter_balance = isset($this->request->get['filter_balance']) && mta_check_int($this->request->get['filter_balance']) ? $this->request->get['filter_balance'] : 0;//+mod by yp



		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = '';
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = '';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}


			
		if(isset($this->request->get['filter_balance'])) $url .= '&filter_balance=' . $this->request->get['filter_balance'];//+mod by yp
		

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('report/affiliate', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$this->load->model('report/affiliate');

		$data['affiliates'] = array();

		$filter_data = array(

			
'filter_balance' => $filter_balance,//+mod by yp


			'filter_date_start'	=> $filter_date_start,
			'filter_date_end'	=> $filter_date_end,
			'start'             => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'             => $this->config->get('config_limit_admin')
		);

		$affiliate_total = $this->model_report_affiliate->getTotalCommission($filter_data);

		$results = $this->model_report_affiliate->getCommission($filter_data);

			
$affiliate_ids = array();//+mod by yp



		foreach ($results as $result) {

			
$affiliate_ids[] = intval($result['affiliate_id']);//+mod by yp


			$data['affiliates'][] = array(

			
				//+mod by yp start
				'affiliate_id' => intval($result['affiliate_id']),
				'commission' => $this->currency->format($result['commission'], $this->config->get('config_currency')),
				'total_earnings' => $this->currency->format((isset($result['total_earnings']) ? $result['total_earnings'] : 0), $this->config->get('config_currency')),
				//+mod by yp end


				'affiliate'  => $result['affiliate'],
				'email'      => $result['email'],
				'status'     => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'commission' => $this->currency->format($result['commission'], $this->config->get('config_currency')),
				'orders'     => $result['orders'],
				'total'      => $this->currency->format($result['total'], $this->config->get('config_currency')),
				'edit'       => $this->url->link('marketing/affiliate/edit', 'token=' . $this->session->data['token'] . '&affiliate_id=' . $result['affiliate_id'] . $url, 'SSL')
			);
		}


			
		//+mod by yp start
		$this->load->model('mta/mta_affiliate');
		$data['payout_accounts'] = $this->model_mta_mta_affiliate->getPayoutAccounts($affiliate_ids);
		foreach(array('column_current_balance', 'text_no_payout_account', 'entry_current_balance', 'column_total_sales') as $_v) {
			$data[$_v] = $this->language->get($_v);		
		}
		//+mod by yp end
		

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_affiliate'] = $this->language->get('column_affiliate');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_commission'] = $this->language->get('column_commission');
		$data['column_orders'] = $this->language->get('column_orders');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');

		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}


			
if(isset($this->request->get['filter_balance'])) $url .= '&filter_balance=' . $this->request->get['filter_balance'];//+mod by yp


		$pagination = new Pagination();
		$pagination->total = $affiliate_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/affiliate', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($affiliate_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($affiliate_total - $this->config->get('config_limit_admin'))) ? $affiliate_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $affiliate_total, ceil($affiliate_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;


			
$data['filter_balance'] = $filter_balance;//+mod by yp


		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/affiliate.tpl', $data));
	}
}