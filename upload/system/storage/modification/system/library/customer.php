<?php
class Customer {
	private $customer_id;
	private $firstname;
	private $lastname;
	private $customer_group_id;
	private $email;
	private $telephone;
	private $fax;
	private $newsletter;
	private $address_id;

	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['customer_id'])) {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND status = '1'");

			if ($customer_query->num_rows) {
				$this->customer_id = $customer_query->row['customer_id'];
				$this->firstname = $customer_query->row['firstname'];
				$this->lastname = $customer_query->row['lastname'];
				$this->customer_group_id = $customer_query->row['customer_group_id'];
				$this->email = $customer_query->row['email'];
				$this->telephone = $customer_query->row['telephone'];
				$this->fax = $customer_query->row['fax'];
				$this->newsletter = $customer_query->row['newsletter'];
				$this->address_id = $customer_query->row['address_id'];

				$this->db->query("UPDATE " . DB_PREFIX . "customer SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

			
			$this->_fix_parent_aff($customer_query->row);//+mod by yp
			



			
				$this->_fix_parent_aff($customer_query->row);//+mod by yp
				

				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_ip WHERE customer_id = '" . (int)$this->session->data['customer_id'] . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

				if (!$query->num_rows) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "customer_ip SET customer_id = '" . (int)$this->session->data['customer_id'] . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', date_added = NOW()");
				}
			} else {
				$this->logout();
			}
		}
	}

	public function login($email, $password, $override = false) {
		if ($override) {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = '1'");
		} else {
			$customer_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1' AND approved = '1'");
		}

		//+mod by yp start
if ($this->config->get('account_combine_status') && !$customer_query->num_rows) {
	$_accc_res = $this->db->query("SELECT " . DB_PREFIX . "accc_customer_affiliate.customer_id, " . DB_PREFIX . "accc_customer_affiliate.affiliate_id FROM " . DB_PREFIX . "affiliate LEFT JOIN " . DB_PREFIX . "accc_customer_affiliate ON " . DB_PREFIX . "accc_customer_affiliate.affiliate_id=" . DB_PREFIX . "affiliate.affiliate_id WHERE " . DB_PREFIX . "affiliate.email = '" . $this->db->escape($email) . "' AND (" . DB_PREFIX . "affiliate.password = SHA1(CONCAT(" . DB_PREFIX . "affiliate.salt, SHA1(CONCAT(" . DB_PREFIX . "affiliate.salt, SHA1('" . $this->db->escape($password) . "'))))) OR " . DB_PREFIX . "affiliate.password = '" . $this->db->escape(md5($password)) . "') AND " . DB_PREFIX . "affiliate.status = '1' AND " . DB_PREFIX . "affiliate.approved = '1' AND " . DB_PREFIX . "accc_customer_affiliate.affiliate_id IS NOT NULL");
	if($_accc_res->num_rows > 0) {
		$accc_aff = $_accc_res->row['affiliate_id'];
		$_q = "SELECT * FROM " . DB_PREFIX . "customer WHERE customer_id='" . ((int) $_accc_res->row['customer_id']) . "' AND status = '1' AND approved = '1'";
		$customer_query = $this->db->query($_q);
	}
}
//+mod by yp end
if ($customer_query->num_rows) {
			$this->session->data['customer_id'] = $customer_query->row['customer_id'];

			$this->customer_id = $customer_query->row['customer_id'];
			$this->firstname = $customer_query->row['firstname'];
			$this->lastname = $customer_query->row['lastname'];
			$this->customer_group_id = $customer_query->row['customer_group_id'];
			$this->email = $customer_query->row['email'];
			$this->telephone = $customer_query->row['telephone'];
			$this->fax = $customer_query->row['fax'];
			$this->newsletter = $customer_query->row['newsletter'];
			$this->address_id = $customer_query->row['address_id'];

			$this->db->query("UPDATE " . DB_PREFIX . "customer SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE customer_id = '" . (int)$this->customer_id . "'");

			
			$this->_fix_parent_aff($customer_query->row);//+mod by yp
			


			return true;
		} else {
			return false;
		}
	}

	public function logout() {

			
		//+mod by yp start
		if(isset($this->session->data['_mta_ypx_aff_id'])) unset($this->session->data['_mta_ypx_aff_id']);
		if(isset($this->session->data['_mta_ypx_aff_code'])) unset($this->session->data['_mta_ypx_aff_code']);		
		//+mod by yp end	
		

		unset($this->session->data['customer_id']);

		$this->customer_id = '';
		$this->firstname = '';
		$this->lastname = '';
		$this->customer_group_id = '';
		$this->email = '';
		$this->telephone = '';
		$this->fax = '';
		$this->newsletter = '';
		$this->address_id = '';
	}

	public function isLogged() {
		return $this->customer_id;
	}

	public function getId() {
		return $this->customer_id;
	}

	public function getFirstName() {
		return $this->firstname;
	}

	public function getLastName() {
		return $this->lastname;
	}

	public function getGroupId() {
		return $this->customer_group_id;
	}

	public function getEmail() {
		return $this->email;
	}

	public function getTelephone() {
		return $this->telephone;
	}

	public function getFax() {
		return $this->fax;
	}

	public function getNewsletter() {
		return $this->newsletter;
	}

	public function getAddressId() {
		return $this->address_id;
	}

	public function getBalance() {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "customer_transaction WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}


			
	//+mod by yp start
	private function _fix_parent_aff($data) {
		if(!$this->config->get('mta_ypx_db_perm') || !isset($data['affiliate_id'])) return;
		if(!isset($this->session->data['_mta_ypx_aff_id']) || $this->session->data['_mta_ypx_aff_id'] != $data['affiliate_id']) {
			$this->session->data['_mta_ypx_aff_id'] = $data['affiliate_id'];
			if($data['affiliate_id']) {
				$_res = $this->db->query("SELECT code FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$data['affiliate_id'] . "'");
				if($_res->num_rows > 0) {
					$this->session->data['_mta_ypx_aff_code'] = $_res->row['code'];
				} else {
					$this->session->data['_mta_ypx_aff_code'] = '';
				}
			} else {
				$this->session->data['_mta_ypx_aff_code'] = '';
			}
		}
		$changed = false;
		if(strlen($this->session->data['_mta_ypx_aff_code']) > 0) {
			if(!isset($this->request->cookie['tracking']) || $this->request->cookie['tracking'] != $this->session->data['_mta_ypx_aff_code']) {
				$changed = true;
				if(isset($this->request->cookie['tracking'])) {
					setcookie('tracking', '', (time() - 3600), '/');
					setcookie('tracking', '', (time() - 3600), '/', '.' . preg_replace("/www\./i", '', $_SERVER['HTTP_HOST']));
				}
				setcookie('tracking', $this->session->data['_mta_ypx_aff_code'], time() + 3600 * 24 * 1000, '/');
				$this->request->cookie['tracking'] = $this->session->data['_mta_ypx_aff_code'];
				if(isset($this->request->post['tracking'])) $this->request->post['tracking'] = $this->session->data['_mta_ypx_aff_code'];
				if(isset($this->request->get['tracking'])) $this->request->get['tracking'] = $this->session->data['_mta_ypx_aff_code'];			
				if(isset($this->session->data['tracking'])) $this->session->data['tracking'] = $this->session->data['_mta_ypx_aff_code'];				
			}
		} else {
			if(isset($this->request->cookie['tracking'])) {
				$changed = true;
				setcookie('tracking', '', (time() - 3600), '/');
				setcookie('tracking', '', (time() - 3600), '/', '.' . preg_replace("/www\./i", '', $_SERVER['HTTP_HOST']));		
				unset($this->request->cookie['tracking']);
				if(isset($this->request->post['tracking'])) unset($this->request->post['tracking']);
				if(isset($this->request->get['tracking'])) unset($this->request->get['tracking']);
				if(isset($this->session->data['tracking'])) unset($this->session->data['tracking']);
			}
		}
		/*if($changed === true) {
			$url = 'http' . (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 's' : '') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
			header('HTTP/1.1 302 Found');
			header('Location: ' . $url);
			die();
		}*/
	}
	//+mod by yp end
	

	public function getRewardPoints() {
		$query = $this->db->query("SELECT SUM(points) AS total FROM " . DB_PREFIX . "customer_reward WHERE customer_id = '" . (int)$this->customer_id . "'");

		return $query->row['total'];
	}
}
