<?php
class ModelMarketingAffiliate extends Model {
	public function addAffiliate($data) {

			
			if(!isset($data['payment'])) $data['payment'] = '';//+mod by yp
			
			
		$this->event->trigger('pre.admin.affiliate.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', company = '" . $this->db->escape($data['company']) . "', website = '" . $this->db->escape($data['website']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', code = '" . $this->db->escape($data['code']) . "', commission = '" . (float)$data['commission'] . "', tax = '" . $this->db->escape($data['tax']) . "', payment = '" . $this->db->escape($data['payment']) . "', cheque = '" . $this->db->escape($data['cheque']) . "', paypal = '" . $this->db->escape($data['paypal']) . "', bank_name = '" . $this->db->escape($data['bank_name']) . "', bank_branch_number = '" . $this->db->escape($data['bank_branch_number']) . "', bank_swift_code = '" . $this->db->escape($data['bank_swift_code']) . "', bank_account_name = '" . $this->db->escape($data['bank_account_name']) . "', bank_account_number = '" . $this->db->escape($data['bank_account_number']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$affiliate_id = $this->db->getLastId();

		$this->event->trigger('post.admin.affiliate.add', $affiliate_id);

		return $affiliate_id;
	}

	public function editAffiliate($affiliate_id, $data) {

			
			if(!isset($data['payment'])) $data['payment'] = '';//+mod by yp
			
			
		$this->event->trigger('pre.admin.affiliate.edit', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', company = '" . $this->db->escape($data['company']) . "', website = '" . $this->db->escape($data['website']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', code = '" . $this->db->escape($data['code']) . "', commission = '" . (float)$data['commission'] . "', tax = '" . $this->db->escape($data['tax']) . "', payment = '" . $this->db->escape($data['payment']) . "', cheque = '" . $this->db->escape($data['cheque']) . "', paypal = '" . $this->db->escape($data['paypal']) . "', bank_name = '" . $this->db->escape($data['bank_name']) . "', bank_branch_number = '" . $this->db->escape($data['bank_branch_number']) . "', bank_swift_code = '" . $this->db->escape($data['bank_swift_code']) . "', bank_account_name = '" . $this->db->escape($data['bank_account_name']) . "', bank_account_number = '" . $this->db->escape($data['bank_account_number']) . "', status = '" . (int)$data['status'] . "' WHERE affiliate_id = '" . (int)$affiliate_id . "'");

		if ($data['password']) {
			$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		}

		$this->event->trigger('post.admin.affiliate.edit', $affiliate_id);
	}

	public function deleteAffiliate($affiliate_id) {
		$this->event->trigger('pre.admin.affiliate.delete', $affiliate_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_activity WHERE affiliate_id = '" . (int)$affiliate_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = '" . (int)$affiliate_id . "'");

		$this->event->trigger('post.admin.affiliate.delete', $affiliate_id);
	}

	public function getAffiliate($affiliate_id) {
	
			
	//+mod by yp start					
if($this->config->get('tracking_discount_status')) {
	$query = $this->db->query("SELECT a.*, atd.amount AS tracking_discount_amount, atd.type AS tracking_discount_type FROM " . DB_PREFIX . "affiliate a LEFT  JOIN " . DB_PREFIX . "affiliate_tracking_discount atd ON atd.affiliate_id = a.affiliate_id WHERE a.affiliate_id = '" . (int)$affiliate_id . "'");
} else {
	//+mod by yp end			
	
			
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");
	
			
	 } //+mod by yp
	 
			

		return $query->row;
	}

	public function getAffiliateByEmail($email) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "affiliate WHERE LCASE(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getAffiliates($data = array()) {

			
			return $this->getAffiliatesMta($data);//+mod by yp
			

		$sql = "SELECT *, CONCAT(a.firstname, ' ', a.lastname) AS name, (SELECT SUM(at.amount) FROM " . DB_PREFIX . "affiliate_transaction at WHERE at.affiliate_id = a.affiliate_id GROUP BY at.affiliate_id) AS balance FROM " . DB_PREFIX . "affiliate a";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(a.firstname, ' ', a.lastname) LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "LCASE(a.email) = '" . $this->db->escape(utf8_strtolower($data['filter_email'])) . "'";
		}

		if (!empty($data['filter_code'])) {
			$implode[] = "a.code = '" . $this->db->escape($data['filter_code']) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "a.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "a.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(a.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'a.email',
			'a.code',
			'a.status',
			'a.approved',
			'a.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function approve($affiliate_id) {
		$affiliate_info = $this->getAffiliate($affiliate_id);

		if ($affiliate_info) {
			$this->event->trigger('pre.admin.affiliate.approve', $affiliate_id);

			$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET approved = '1' WHERE affiliate_id = '" . (int)$affiliate_id . "'");

			$this->load->language('mail/affiliate');

			$message  = sprintf($this->language->get('text_approve_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";
			$message .= $this->language->get('text_approve_login') . "\n";
			$message .= HTTP_CATALOG . 'index.php?route=affiliate/login' . "\n\n";
			$message .= $this->language->get('text_approve_services') . "\n\n";
			$message .= $this->language->get('text_approve_thanks') . "\n";
			$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($affiliate_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_approve_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')));
			$mail->setText($message);
			$mail->send();

			$this->event->trigger('post.admin.affiliate.approve', $affiliate_id);
		}
	}

	public function getAffiliatesByNewsletter() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE newsletter = '1' ORDER BY firstname, lastname, email");

		return $query->rows;
	}

	public function getTotalAffiliates($data = array()) {

			
			return $this->getTotalAffiliatesMta($data);//+mod by yp
			

		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "LCASE(email) = '" . $this->db->escape(utf8_strtolower($data['filter_email'])) . "'";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalAffiliatesAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate WHERE status = '0' OR approved = '0'");

		return $query->row['total'];
	}

	public function getTotalAffiliatesByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate WHERE country_id = '" . (int)$country_id . "'");

		return $query->row['total'];
	}

	public function getTotalAffiliatesByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate WHERE zone_id = '" . (int)$zone_id . "'");

		return $query->row['total'];
	}

	public function addTransaction($affiliate_id, $description = '', $amount = '', $order_id = 0) {
		$affiliate_info = $this->getAffiliate($affiliate_id);

		if ($affiliate_info) {
			$this->event->trigger('pre.admin.affiliate.transaction.add', $affiliate_id);

			$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate_transaction SET affiliate_id = '" . (int)$affiliate_id . "', order_id = '" . (float)$order_id . "', description = '" . $this->db->escape($description) . "', amount = '" . (float)$amount . "', date_added = NOW()");

			$affiliate_transaction_id = $this->db->getLastId();

			$this->load->language('mail/affiliate');

			$message  = sprintf($this->language->get('text_transaction_received'), $this->currency->format($amount, $this->config->get('config_currency'))) . "\n\n";
			$message .= sprintf($this->language->get('text_transaction_total'), $this->currency->format($this->getTransactionTotal($affiliate_id), $this->config->get('config_currency')));

			
			//+mod by yp start
			if(floatval($amount) < 0) {
				$text_received = $this->language->get('text_payment_received');				
				$amount = abs(floatval($amount));
			} else {
				$text_received = $this->language->get('text_transaction_received');				
			}
			
			$message  = sprintf($text_received, $this->currency->format($amount, $this->config->get('config_currency'))) . "\n\n";
			$message .= sprintf($this->language->get('text_balance'), $this->currency->format( $this->getTransactionTotal($affiliate_id), $this->config->get('config_currency')) );
			//+mod by yp end
			


			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($affiliate_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_transaction_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')));
			$mail->setText($message);
			$mail->send();

			$this->event->trigger('post.admin.affiliate.transaction.add', $affiliate_transaction_id);

			return $affiliate_transaction_id;
		}
	}

	public function deleteTransaction($order_id) {
		$this->event->trigger('pre.admin.affiliate.transaction.delete', $order_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_transaction WHERE order_id = '" . (int)$order_id . "'");

		$this->event->trigger('post.admin.affiliate.transaction.delete', $order_id);
	}

	public function getTransactions($affiliate_id, $start = 0, $limit = 10) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = '" . (int)$affiliate_id . "' ORDER BY date_added DESC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function getTotalTransactions($affiliate_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total  FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = '" . (int)$affiliate_id . "'");

		return $query->row['total'];
	}

	public function getTransactionTotal($affiliate_id) {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = '" . (int)$affiliate_id . "'");

		return $query->row['total'];
	}


			
	//+mod by yp start		
	protected function getAffiliatesMta($data = array()) {
		$sql = "SELECT *, CONCAT(a.firstname, ' ', a.lastname) AS name, (SELECT SUM(at.amount) FROM " . DB_PREFIX . "affiliate_transaction at WHERE at.affiliate_id = a.affiliate_id GROUP BY at.affiliate_id) AS balance, mta_a.mta_scheme_id as scheme_id, mta_a.level_original as level FROM " . DB_PREFIX . "affiliate AS a left join " . DB_PREFIX . "mta_affiliate AS mta_a on mta_a.affiliate_id=a.affiliate_id";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(a.firstname, ' ', a.lastname) LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "LCASE(a.email) = '" . $this->db->escape(utf8_strtolower($data['filter_email'])) . "'";
		}

		if (!empty($data['filter_code'])) {
			$implode[] = "a.code = '" . $this->db->escape($data['filter_code']) . "'";
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== null) {
			$implode[] = "a.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && $data['filter_approved'] !== null) {
			$implode[] = "a.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(a.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		//+mod by yp start
		if(isset($data['ids']) && preg_match("/^\d+(?:\,\d+)*$/", $data['ids'])) {
			$implode[] = 'a.affiliate_id ' . (isset($data['filter_ids']) && $data['filter_ids'] == 'exclude' ? 'NOT ' : '') . 'in (' . $data['ids'] . ')';			
		}		
		//+mod by yp end
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'a.email',
			'a.code',
			'a.status',
			'a.approved',
			'a.date_added',
			'mta_a.level_original'//+mod by yp
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}
	
	protected function getTotalAffiliatesMta($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "LCASE(email) = '" . $this->db->escape(utf8_strtolower($data['filter_email'])) . "'";
		}

		if (isset($data['filter_status']) && $data['filter_status'] !== null) {
			$implode[] = "status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['filter_approved']) && $data['filter_approved'] !== null) {
			$implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		//+mod by  yp start
		if(isset($data['ids']) && preg_match("/^\d+(?:\,\d+)*$/", $data['ids'])) {
			$implode[] = 'affiliate_id ' . (isset($data['filter_ids']) && $data['filter_ids'] == 'exclude' ? 'NOT ' : '') . 'in (' . $data['ids'] . ')';			
		}		
		//+mod by  yp end		
		
		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	
	public function addMtaTransaction($order_id, $affiliate_id, $description) {
		$res = $this->db->query("select mta_order_id, commission from " . DB_PREFIX . "mta_order where order_id='" . (int) $order_id . "' and affiliate_id='" . (int) $affiliate_id . "' and commission_added='0'");
		if($res->num_rows < 1) return false;
		$commission = $res->row['commission'];
		$res2 = $this->db->query("select " . DB_PREFIX . "mta_order_product.num_levels, " . DB_PREFIX . "mta_order_product.level, " . DB_PREFIX . "order_product.quantity, " . DB_PREFIX . "product_description.name as product_name from " . DB_PREFIX . "mta_order_product left join " . DB_PREFIX . "order_product on " . DB_PREFIX . "order_product.order_product_id=" . DB_PREFIX . "mta_order_product.order_product_id left join " . DB_PREFIX . "product_description on " . DB_PREFIX . "product_description.product_id=" . DB_PREFIX . "mta_order_product.product_id where " . DB_PREFIX . "mta_order_product.mta_order_id='" . (int) $res->row['mta_order_id'] . "'  group by " . DB_PREFIX . "mta_order_product.order_product_id");
		if($res2->num_rows > 0) {
			$this->language->load('mail/affiliate');
			$_ar = array();
			foreach($res2->rows as $_r) {
				$_str = $_r['product_name'];
				if($_r['quantity'] > 1) $_str .= ' x' . $_r['quantity'];
				if($_r['level']) $_str .= sprintf($this->language->get('text_transaction_level'), (intval($_r['num_levels']) - intval($_r['level']) + 1));
				$_ar[] = $_str;
			}

			if(sizeof($_ar) > 0) $description .= ': ' . implode(', ', $_ar);
		}		
		$this->db->query("update " . DB_PREFIX . "mta_order set commission_added='1' where order_id='" . (int) $order_id . "' and affiliate_id='" . (int) $affiliate_id . "'");
		$this->addTransaction($affiliate_id, $description, $commission, $order_id);
		return true;
	}

	public function deleteMtaTransaction($order_id, $affiliate_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_transaction WHERE order_id = '" . (int) $order_id . "' and affiliate_id = '" . (int) $affiliate_id . "'");		
		//if(!$this->db->countAffected()) return false;
		$this->db->query("update " . DB_PREFIX . "mta_order set commission_added='0' where order_id='" . (int) $order_id . "' and affiliate_id='" . (int) $affiliate_id . "'");
		return true;
	}

	public function getOrderCommissions($order_id) {
		$res = $this->db->query("select " . DB_PREFIX . "mta_order.mta_order_id, " . DB_PREFIX . "mta_order.order_id, " . DB_PREFIX . "mta_order.commission AS commission_total, " . DB_PREFIX . "mta_order.affiliate_id, " . DB_PREFIX . "mta_order.commission_added, " . DB_PREFIX . "mta_order.autoadd, CONCAT(" . DB_PREFIX . "affiliate.firstname, ' ', " . DB_PREFIX . "affiliate.lastname) as affiliate_name, " . DB_PREFIX . "mta_scheme.mta_scheme_id AS scheme_id, " . DB_PREFIX . "mta_scheme.scheme_name AS scheme_name, " . DB_PREFIX . "mta_order_product.order_product_id, " . DB_PREFIX . "mta_order_product.commission, " . DB_PREFIX . "product.model AS product_name FROM " . DB_PREFIX . "mta_order left join " . DB_PREFIX . "affiliate on " . DB_PREFIX . "affiliate.affiliate_id=" . DB_PREFIX . "mta_order.affiliate_id left join " . DB_PREFIX . "mta_order_product on " . DB_PREFIX . "mta_order_product.mta_order_id=" . DB_PREFIX . "mta_order.mta_order_id left join " . DB_PREFIX . "mta_scheme on " . DB_PREFIX . "mta_scheme.mta_scheme_id=" . DB_PREFIX . "mta_order_product.mta_scheme_id LEFT JOIN " . DB_PREFIX . "product ON " . DB_PREFIX . "product.product_id=" . DB_PREFIX . "mta_order_product.product_id WHERE " . DB_PREFIX . "mta_order.order_id='" . (int) $order_id . "' group by " . DB_PREFIX . "mta_order_product.order_product_id, " . DB_PREFIX . "mta_order_product.affiliate_id order by " . DB_PREFIX . "mta_order.mta_order_id asc");
		//if($res->num_rows < 1) return false;
		return $res->rows;
	}
	
	public function setOrderCommissions($order_id, $commissions = false, $do_add = false) {
		if(!is_int($order_id)) $order_id = (int)$order_id;
		if(!$commissions) $commissions = array();
		$added = array();
		$_res = $this->db->query("select affiliate_id from " . DB_PREFIX . "affiliate_transaction where order_id = '" . $order_id . "'");
		foreach($_res->rows as $_r) {
			$added[] = (int)$_r['affiliate_id'];
		}
		$aff_ids = array();
		$comms = array();
		$totals = array();
		foreach($commissions as $__c) {
			foreach($__c as $_c) {
				if(in_array(intval($_c['affiliate_id']), $added)) continue;
				if(!isset($comms[$_c['affiliate_id']])) $comms[$_c['affiliate_id']] = array();
				if(!isset($totals[$_c['affiliate_id']])) $totals[$_c['affiliate_id']] = 0;
				$aff_ids[] = $_c['affiliate_id'];			
				$comms[$_c['affiliate_id']][] = $_c;
				$totals[$_c['affiliate_id']] += (float)$_c['commission'];
			}
		}
		if(sizeof($aff_ids) > 0) $aff_ids = array_values(array_unique($aff_ids));	
		$this->db->query("delete from " . DB_PREFIX . "mta_order_product where mta_order_id in (select mta_order_id from " . DB_PREFIX . "mta_order where order_id = '" . $order_id . "' and commission_added='0')");
		$this->db->query("delete from " . DB_PREFIX . "mta_order where order_id = '" . $order_id . "' and commission_added='0'");
		if(sizeof($comms) < 1) return;
		$ops = array();
		$_res = $this->db->query("SELECT order_product_id, product_id FROM " . DB_PREFIX . "order_product WHERE order_id = '" . $order_id . "'");
		foreach($_res->rows as $_r) {
			$ops[$_r['order_product_id']] = $_r['product_id'];
		}
		if($do_add) $tAr = array();
		foreach($comms as $_aff_id => $_comms) {
			$this->db->query("insert into " . DB_PREFIX . "mta_order (order_id, affiliate_id, commission) values ('" . $order_id . "', '" . (int)$_aff_id . "', '" . $totals[$_aff_id] . "')");
			$mta_order_id = $this->db->getLastId();
			$qAr = array();			
			foreach($_comms as $_c) {
				if(!isset($ops[$_c['order_product_id']])) continue;
				$qAr[] = "('" . $mta_order_id . "', '" . (int)$_c['order_product_id'] . "', '" . (int)$ops[$_c['order_product_id']] . "', '" . (int)$_aff_id . "', '" . (float)$_c['commission'] . "', 0, 0, 0)";				
			}
			if($do_add && !in_array($_aff_id, $tAr)) $tAr[] = $_aff_id;
			if(sizeof($qAr) > 0) $this->db->query("insert into " . DB_PREFIX . "mta_order_product (mta_order_id, order_product_id, product_id, affiliate_id, commission, mta_scheme_id, num_levels, level) values " . implode(', ', $qAr));
		}
		if($do_add && sizeof($tAr) > 0) {
			$this->language->load('mta/mta');
			foreach($tAr as $_aff_id) {
				$this->addMtaTransaction($order_id, $_aff_id, $this->language->get('text_order_id') . ' #' . $order_id);
			}
		}
	}
	//+mod by yp end
	

	public function getTotalTransactionsByOrderId($order_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate_transaction WHERE order_id = '" . (int)$order_id . "'");

		return $query->row['total'];
	}

	public function getTotalLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "affiliate_login` WHERE `email` = '" . $this->db->escape($email) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "affiliate_login` WHERE `email` = '" . $this->db->escape($email) . "'");
	}
}