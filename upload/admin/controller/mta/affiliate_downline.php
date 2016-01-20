<?php

class ControllerMtaAffiliateDownline extends Controller {
	
	public function index() {
		$this->language->load('mta/affiliate_downline');
		foreach(array('heading_title', 'text_legend', 'text_abbr_te', 'text_abbr_elm', 'text_te', 'text_elm') as $_v) {
			$data[$_v] = $this->language->get('affd_' . $_v);
		}	
		if(!isset($this->request->get['affiliate_id']) || !preg_match("/^\d+$/", $this->request->get['affiliate_id'])) {			
			$data['aff_id'] = 0;
			$data['text_shop'] = $this->config->get('config_name');
		} else {
			$data['aff_id'] = intval($this->request->get['affiliate_id']);
			$this->load->model('marketing/affiliate');
			$aff = $this->model_marketing_affiliate->getAffiliate($data['aff_id']);
			$data['text_shop'] = $aff['firstname'] . ' ' . $aff['lastname'];
		}
		
    	$this->document->setTitle($data['heading_title']);
		$this->document->addStyle('view/stylesheet/affiliate_downline.css');
			
		$this->load->model('mta/affiliate_downline');
		
		$data['top_count'] = $this->model_mta_affiliate_downline->countSubs($data['aff_id']);		
		$data['link'] = html_entity_decode($this->url->link('marketing/affiliate/edit', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('mta/affiliate_downline.tpl', $data));		
	}	
	
	public function l() {
		$_REQUEST['format'] = $_GET['format'] = 'raw';//+mod by yp mijoshop
		$affiliate_id = isset($this->request->request['affiliate_id']) ? intval($this->request->request['affiliate_id']) : 0;	
		$this->load->model('mta/affiliate_downline');
		$res = $this->model_mta_affiliate_downline->loadSubs($affiliate_id);
		foreach($res as $id => $v) {
			foreach(array('te', 'elm') as $_v) {
				if(!isset($res[$id]['e_' . $_v])) $res[$id]['e_' . $_v] = 0;
				$res[$id]['e_' . $_v] = $this->currency->format($res[$id]['e_' . $_v], $this->config->get('config_currency'));				
			}
		}
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode(array_values($res)));
	}
	
}

