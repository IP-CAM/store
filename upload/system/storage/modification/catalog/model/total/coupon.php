<?php
class ModelTotalCoupon extends Model {

			
	//+mod by yp cft start
	private function _set_tracking($coupon_id) {
		$this->load->model('checkout/cftyp_coupon_affiliate');
		$affiliate = $this->model_checkout_cftyp_coupon_affiliate->getAffiliate($coupon_id);
		if($affiliate['cftyp_ctype'] == 'm' && !isset($this->request->cookie['tracking'])) {
			setcookie('tracking', $affiliate['code'], ($this->config->get('cftyp_session_only') ? 0 : (time() + 3600 * 24 * 1000)), '/');
			$this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = '" . $this->db->escape($affiliate['code']) . "'");			
		} else if($affiliate['cftyp_ctype'] == 'a' && (!isset($this->request->cookie['tracking']) || $this->request->cookie['tracking'] != $affiliate['code'])) {
			if(isset($this->request->cookie['tracking'])) setcookie('tracking', '', time() - 3600, '/');
			setcookie('tracking', $affiliate['code'], ($this->config->get('cftyp_session_only') ? 0 : (time() + 3600 * 24 * 1000)), '/');
		}
		$this->session->data['tracking'] = $affiliate['code'];
	}
	//+mod by yp cft end	
	

	public function getCoupon($code, $tracking_input = false) {//+mod by yp
		$status = true;

		$coupon_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon` WHERE code = '" . $this->db->escape($code) . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) AND status = '1'");


			
		//+mod by yp cft start
		if($this->config->get('cftyp_status') && (!defined('CFTYP_NO_AFFILIATE') || !CFTYP_NO_AFFILIATE) && $this->config->get('cftyp_always')) {
			if($coupon_query->num_rows > 0) {
				$this->_set_tracking($coupon_query->row['coupon_id']);
			} else {
				$_cq = $this->db->query("SELECT coupon_id FROM `" . DB_PREFIX . "coupon` WHERE code = '" . $this->db->escape($code) . "'");
				if($_cq->num_rows > 0) $this->_set_tracking($_cq->row['coupon_id']);
			}
		}
		//+mod by yp cft end
		

		if ($coupon_query->num_rows) {
			if ($coupon_query->row['total'] > $this->cart->getSubTotal()) {
				$status = false;
			}

			$coupon_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "coupon_history` ch WHERE ch.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			if ($coupon_query->row['uses_total'] > 0 && ($coupon_history_query->row['total'] >= $coupon_query->row['uses_total'])) {
				$status = false;
			}

			if ($coupon_query->row['logged'] && !$this->customer->getId()) {
				$status = false;
			}

			if ($this->customer->getId()) {
				$coupon_history_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "coupon_history` ch WHERE ch.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "' AND ch.customer_id = '" . (int)$this->customer->getId() . "'");

				if ($coupon_query->row['uses_customer'] > 0 && ($coupon_history_query->row['total'] >= $coupon_query->row['uses_customer'])) {
					$status = false;
				}
			}

			// Products
			$coupon_product_data = array();

			$coupon_product_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_product` WHERE coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_product_query->rows as $product) {
				$coupon_product_data[] = $product['product_id'];
			}

			// Categories
			$coupon_category_data = array();

			$coupon_category_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "coupon_category` cc LEFT JOIN `" . DB_PREFIX . "category_path` cp ON (cc.category_id = cp.path_id) WHERE cc.coupon_id = '" . (int)$coupon_query->row['coupon_id'] . "'");

			foreach ($coupon_category_query->rows as $category) {
				$coupon_category_data[] = $category['category_id'];
			}

			$product_data = array();

			if ($coupon_product_data || $coupon_category_data) {
				foreach ($this->cart->getProducts() as $product) {
					if (in_array($product['product_id'], $coupon_product_data)) {
						$product_data[] = $product['product_id'];

						continue;
					}

					foreach ($coupon_category_data as $category_id) {
						$coupon_category_query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "product_to_category` WHERE `product_id` = '" . (int)$product['product_id'] . "' AND category_id = '" . (int)$category_id . "'");

						if ($coupon_category_query->row['total']) {
							$product_data[] = $product['product_id'];

							continue;
						}
					}
				}

				if (!$product_data) {
					$status = false;
				}
			}
		} else {
			$status = false;
		}


			
		//+mod by yp start
		if (version_compare(VERSION, '2.1', '>=') && $tracking_input && !$status && $this->config->get('tracking_input_status') && $this->config->get('tracking_input_allow_coupon')) {
			$this->load->model('affiliate/affiliate');
			$mark = false;
			$aff = $this->model_affiliate_affiliate->getAffiliateByCode($code);
			if(!$aff && !isset($this->request->cookie['tracking']) && $this->config->get('tracking_input_allow_marketing')) {
				$this->load->model('checkout/marketing');
				$mark = $this->model_checkout_marketing->getMarketingByCode($code);
			}
			if($mark || ($aff && $aff['status'] && $aff['approved'])) {
				$_cookie_ttl = 86400000;
				$this->session->data['tracking_input_show'] = false;
				if(isset($this->request->cookie['tracking'])) setcookie('tracking', '', time() - 86400, '/');	
				setcookie('tracking', $code, ($_cookie_ttl ? (time() + $_cookie_ttl) : 0), '/');
				$this->session->data['tracking'] = $code;
				if($mark) $this->db->query("UPDATE `" . DB_PREFIX . "marketing` SET clicks = (clicks + 1) WHERE code = '" . $this->db->escape($code) . "'");
				return 'tracking_input';
			}			
		}
		//+mod by yp end			
		
			
		if ($status) {

			
			if(isset($coupon_query) && $this->config->get('cftyp_status') && (!defined('CFTYP_NO_AFFILIATE') || !CFTYP_NO_AFFILIATE) && !$this->config->get('cftyp_always')) $this->_set_tracking($coupon_query->row['coupon_id']); //+mod by yp cft
			

			return array(
				'coupon_id'     => $coupon_query->row['coupon_id'],
				'code'          => $coupon_query->row['code'],
				'name'          => $coupon_query->row['name'],
				'type'          => $coupon_query->row['type'],
				'discount'      => $coupon_query->row['discount'],
				'shipping'      => $coupon_query->row['shipping'],
				'total'         => $coupon_query->row['total'],
				'product'       => $product_data,
				'date_start'    => $coupon_query->row['date_start'],
				'date_end'      => $coupon_query->row['date_end'],
				'uses_total'    => $coupon_query->row['uses_total'],
				'uses_customer' => $coupon_query->row['uses_customer'],
				'status'        => $coupon_query->row['status'],
				'date_added'    => $coupon_query->row['date_added']
			);
		}
	}

	public function getTotal(&$total_data, &$total, &$taxes) {
		if (isset($this->session->data['coupon'])) {
			$this->load->language('total/coupon');

			$coupon_info = $this->getCoupon($this->session->data['coupon']);

			if ($coupon_info) {


$product_ids = array();//+mod by yp


				$discount_total = 0;

				if (!$coupon_info['product']) {
					$sub_total = $this->cart->getSubTotal();
				} else {
					$sub_total = 0;

					foreach ($this->cart->getProducts() as $product) {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$sub_total += $product['total'];

				
$product_ids[] = $product['product_id'];//+mod by yp


						}
					}
				}

				if ($coupon_info['type'] == 'F') {
					$coupon_info['discount'] = min($coupon_info['discount'], $sub_total);
				}

				foreach ($this->cart->getProducts() as $product) {
					$discount = 0;

					if (!$coupon_info['product']) {
						$status = true;
					} else {
						if (in_array($product['product_id'], $coupon_info['product'])) {
							$status = true;
						} else {
							$status = false;
						}
					}

					if ($status) {

			
			if(isset($coupon_query) && $this->config->get('cftyp_status') && (!defined('CFTYP_NO_AFFILIATE') || !CFTYP_NO_AFFILIATE) && !$this->config->get('cftyp_always')) $this->_set_tracking($coupon_query->row['coupon_id']); //+mod by yp cft
			

						if ($coupon_info['type'] == 'F') {
							$discount = $coupon_info['discount'] * ($product['total'] / $sub_total);
						} elseif ($coupon_info['type'] == 'P') {
							$discount = $product['total'] / 100 * $coupon_info['discount'];
						}

						if ($product['tax_class_id']) {
							$tax_rates = $this->tax->getRates($product['total'] - ($product['total'] - $discount), $product['tax_class_id']);

							foreach ($tax_rates as $tax_rate) {
								if ($tax_rate['type'] == 'P') {
									$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
								}
							}
						}
					}

					$discount_total += $discount;
				}

				if ($coupon_info['shipping'] && isset($this->session->data['shipping_method'])) {
					if (!empty($this->session->data['shipping_method']['tax_class_id'])) {
						$tax_rates = $this->tax->getRates($this->session->data['shipping_method']['cost'], $this->session->data['shipping_method']['tax_class_id']);

						foreach ($tax_rates as $tax_rate) {
							if ($tax_rate['type'] == 'P') {
								$taxes[$tax_rate['tax_rate_id']] -= $tax_rate['amount'];
							}
						}
					}

					$discount_total += $this->session->data['shipping_method']['cost'];
				}

				// If discount greater than total
				if ($discount_total > $total) {
					$discount_total = $total;
				}

				if ($discount_total > 0) {
					$total_data[] = array(

				
					'product_ids' => $product_ids, //+mod by yp
					'coupon_id'  => $coupon_info['coupon_id'], //+mod by yp	


						'code'       => 'coupon',
						'title'      => sprintf($this->language->get('text_coupon'), $this->session->data['coupon']),
						'value'      => -$discount_total,
						'sort_order' => $this->config->get('coupon_sort_order')
					);

					$total -= $discount_total;
				} else {
					unset($this->session->data['coupon']);
				}
			} else {
				unset($this->session->data['coupon']);
			}
		}
	}

	public function confirm($order_info, $order_total) {
		$code = '';

		$start = strpos($order_total['title'], '(') + 1;
		$end = strrpos($order_total['title'], ')');

		if ($start && $end) {
			$code = substr($order_total['title'], $start, $end - $start);
		}

		if ($code) {
			$coupon_info = $this->getCoupon($code);

			if ($coupon_info) {
				$this->db->query("INSERT INTO `" . DB_PREFIX . "coupon_history` SET coupon_id = '" . (int)$coupon_info['coupon_id'] . "', order_id = '" . (int)$order_info['order_id'] . "', customer_id = '" . (int)$order_info['customer_id'] . "', amount = '" . (float)$order_total['value'] . "', date_added = NOW()");
			} else {
				return $this->config->get('config_fraud_status_id');
			}
		}
	}

	public function unconfirm($order_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "coupon_history` WHERE order_id = '" . (int)$order_id . "'");
	}
}
