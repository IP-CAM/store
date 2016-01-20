<?php
class ModelMarketingAffiliatePayout extends Model {

	private $email_regexp = "^[\n\r\s]*[^\@]+@.*.[a-zA-Z]{2,15}[\n\r\s]*$";

	public function prepare($data) {
		if(!isset($data['amount']) || !preg_match("/^\d+(?:\.\d+)?$/", trim($data['amount']))) return array();
		$AMOUNT = floatval($data['amount']);
		$_pm = $this->payment_methods();
		if(isset($data['payment_methods']) && is_array($data['payment_methods']) && sizeof($data['payment_methods']) > 0) {
			$pm = array();
			foreach($data['payment_methods'] as $m) {
				if(in_array($m, $_pm) && !in_array($m, $pm)) $pm[] = $m;
			}
		} else {
			$pm = $_pm;
		}
		if(!$pm) return array();
		$pwhere = array();
		$xblank = isset($data['exclude_blank']) && $data['exclude_blank'];
		if($xblank) $pf = $this->payment_fields($pm);
		foreach($pm as $m) {
			$_pwhere = "(payment = '" . $this->db->escape($m) . "'";
			if($xblank && isset($pf[$m])) {
				foreach($pf[$m] as $pfm) {
					$_pwhere .= " and " . $pfm . " is not null and " . $pfm ." != '' ";
					if($pfm == 'paypal') $_pwhere .= " and paypal rlike '" . $this->db->escape($this->email_regexp) . "' ";
				}
			}
			$_pwhere .= ")";
			$pwhere[] = $_pwhere;
		}
		$where = "`at`.affiliate_id = a.affiliate_id";
		if(sizeof($pwhere) > 0) {
			$where .= " AND (" . implode(' OR ', $pwhere) . ")";
		}
		$query = "
SELECT 
  a.affiliate_id AS affiliate_id,
  SUM(at.amount) AS s 
FROM
  " . DB_PREFIX . "affiliate a,
  " . DB_PREFIX . "affiliate_transaction `at` 
WHERE " . $where . " 
GROUP BY a.affiliate_id ";

		$lower = $higher = false;
		if(isset($data['lower']) && preg_match("/^\d+(?:\.\d+)?$/", trim($data['lower']))) $lower = trim($data['lower']);
		if(isset($data['higher']) && preg_match("/^\d+(?:\.\d+)?$/", trim($data['higher']))) $higher = trim($data['higher']);
		if($lower || $higher) {
			$having = array();			
			if($lower) $having[] = "s < '" . (float)$lower . "' ";
			if($higher) $having[] = "s > '" . (float)$higher . "' ";
			$query .= " HAVING " . implode(" AND ", $having);		
		}
				
		$res = $this->db->query($query);
		if($res->num_rows < 1) return array();
		$action = isset($data['action']) && $data['action'] === 'sub' ? 'sub' : 'set';
		$out = array();
		foreach($res->rows as $r) {
			$r['s'] = floatval($r['s']);
			if($action === 'set') {
				if($r['s'] < $AMOUNT) continue;
				$out[] = array(intval($r['affiliate_id']), $r['s'] - $AMOUNT);
			} else {
				if(($r['s'] - $AMOUNT) < 0) continue;
				$out[] = array(intval($r['affiliate_id']), $AMOUNT);
			}
		}
		return $out;
	}

	public function perform($data, $description, $send_emails = false) {
		if(is_string($data)) {
			if(substr($data, -1) == ';') $data = substr($data, 0, -1);
			$data = explode(';', $data);
			foreach($data as $_i => $v) {
				$data[$_i] = explode(',', $v);
			}
		}
		if(!$send_emails) {
			$values = array();
			foreach($data as $v) {
				$values[] = "('" . (int)$v[0] . "','" . $this->db->escape($description) . "','-" . (float)$v[1] . "',NOW())";
			}
			$this->db->query("insert into " . DB_PREFIX . "affiliate_transaction (affiliate_id, description, amount, date_added) values " . implode(',', $values));
		} else {
			ignore_user_abort(1);
			$this->load->model('marketing/affiliate');
			foreach($data as $v) {
				set_time_limit(300);
				$this->model_marketing_affiliate->addTransaction($v[0], $description, '-' . $v[1]);
			}
		}
	}
	
	public function csv($data) {
		$ids = array_keys($data);
		$id_str = implode(',', $ids);
		if(defined('MTA_YPX_HAS_MTA') && MTA_YPX_HAS_MTA) {
			$q = "SELECT a.*, cn.`name` AS country_name, z.`name` AS zone_name, ap.affiliate_id AS parent_affiliate_id, CONCAT(ap.firstname, ' ', ap.lastname) AS parent_name, ap.email AS parent_email, (SELECT SUM(amount) FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = a.affiliate_id) AS balance_prior FROM " . DB_PREFIX . "affiliate a LEFT JOIN " . DB_PREFIX . "country cn ON cn.country_id=a.country_id LEFT JOIN " . DB_PREFIX . "zone z ON z.zone_id=a.zone_id LEFT JOIN " . DB_PREFIX . "mta_affiliate ON " . DB_PREFIX . "mta_affiliate.affiliate_id = a.affiliate_id LEFT JOIN " . DB_PREFIX . "affiliate ap ON ap.affiliate_id = " . DB_PREFIX . "mta_affiliate.parent_affiliate_id WHERE a.affiliate_id IN (" . $id_str . ")";		
		} else {
			$q = "SELECT a.*, cn.`name` AS country_name, z.`name` AS zone_name,  (SELECT SUM(amount) FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = a.affiliate_id) AS balance_prior FROM " . DB_PREFIX . "affiliate a LEFT JOIN " . DB_PREFIX . "country cn ON cn.country_id=a.country_id LEFT JOIN " . DB_PREFIX . "zone z ON z.zone_id=a.zone_id WHERE a.affiliate_id IN (" . $id_str . ")";
		}
		$res = $this->db->query($q);
		if($res->num_rows < 1) return false;
		$exclude = array('password', 'salt', 'ip');
		$out = array();
		$curr = $this->config->get('config_currency');
		foreach($res->rows as $r) {
			$r['currency'] = $curr;
			if(isset($data[$r['affiliate_id']]) && $r['balance_prior'] > 0) {
				$r['balance_posterior'] = floatval($r['balance_prior']) - floatval($data[$r['affiliate_id']]);
				$r['transaction_amount'] = $data[$r['affiliate_id']];
			} else {
				$r['balance_posterior'] = '';
				$r['transaction_amount'] = '';
			}
			foreach($exclude as $_f) {
				if(isset($r[$_f])) unset($r[$_f]);
			}
			$out[] = $r;
		}
		return $out;
	}
	
	public function paypal_emails($data, $ids_keys = false) {		
		if($ids_keys) {
			$ids = array_keys($data);
		} else {
			$ids = array();
			foreach($data as $v) {
				$ids[] = $v[0];
			}
		}
		$res = $this->db->query("SELECT affiliate_id, paypal FROM " . DB_PREFIX . "affiliate WHERE affiliate_id IN (" . implode(',', $ids) . ") and payment='paypal' and paypal rlike '" . $this->db->escape($this->email_regexp) . "'");
		$out = array();
		foreach($res->rows as $r) {			
			$out[$r['affiliate_id']] = strtolower(preg_replace(array("/^[\n\r\s]+/", "/[\n\r\s]+$/"), array('', ''), trim($r['paypal'])));
		}
		return $out;
	}
	
	public function paypal_emails_total($data, $ids_keys = false) {		
		if($ids_keys) {
			$ids = array_keys($data);
		} else {
			$ids = array();
			foreach($data as $v) {
				$ids[] = $v[0];
			}
		}
		$res = $this->db->query("SELECT count(*) AS c FROM " . DB_PREFIX . "affiliate WHERE affiliate_id IN (" . implode(',', $ids) . ") and payment='paypal' and paypal rlike '" . $this->db->escape($this->email_regexp) . "'");	
		return intval($res->row['c']);
	}
	
	public function payment_methods() {
		$res = $this->db->query("select distinct(payment) as m from " . DB_PREFIX . "affiliate");
		$out = array();
		foreach($res->rows as $r) {
			if(!is_null($r['m']) && strlen($r['m']) > 0) $out[] = $r['m'];
		}
		return $out;
	}
	
	private function payment_fields($pm) {
		$res = $this->db->query("show columns from " . DB_PREFIX . "affiliate");
		$out = array();
		foreach($res->rows as $r) {
			foreach($pm as $_pm) {
				if(strpos($r['Field'], $_pm) === 0) {
					if(!isset($out[$_pm])) $out[$_pm] = array();
					$out[$_pm][] = $r['Field'];
					break;
				}
			}
		}
		return $out;
	}

}
