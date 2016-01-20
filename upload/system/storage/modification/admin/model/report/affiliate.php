<?php
class ModelReportAffiliate extends Model {

			
	//+mod by yp start
	protected function _mta_getCommission($data = array()) { 
		$sql_e = "SELECT at.affiliate_id, SUM(at.amount) AS total_earnings FROM " . DB_PREFIX . "affiliate_transaction at";
		$sql = "SELECT at.affiliate_id, CONCAT(a.firstname, ' ', a.lastname) AS affiliate, a.email, a.status, SUM(at.amount) AS commission, COUNT(o.order_id) AS orders, SUM(o.total) AS total FROM " . DB_PREFIX . "affiliate_transaction at LEFT JOIN `" . DB_PREFIX . "affiliate` a ON (at.affiliate_id = a.affiliate_id) LEFT JOIN `" . DB_PREFIX . "order` o ON (at.order_id = o.order_id)";
		
		$implode = array();
		
		if (preg_match("/^\d{4}\-\d{2}\-\d{2}$/", $data['filter_date_start'])) {
			$implode[] = "DATE(at.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (preg_match("/^\d{4}\-\d{2}\-\d{2}$/", $data['filter_date_end'])) {
			$implode[] = "DATE(at.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}	
		
		if ($implode) {
			$_imp = " WHERE " . implode(" AND ", $implode);
			$sql .= $_imp;
			$sql_e .= $_imp . " AND at.amount > 0";
		} else {
			$sql_e .= " WHERE at.amount > 0";
		}
				
		$sql .= " GROUP BY at.affiliate_id ORDER BY commission DESC";
		$sql_e .= " AND at.affiliate_id in ([[AFFILIATES]]) GROUP BY at.affiliate_id";
				
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			$sql_e .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
			
		$query = $this->db->query($sql);
		$rows = $query->rows;
		$_aff_ids = array();
		foreach($rows as $_i => $_r) {
			if($data['filter_balance'] > 0 && $_r['commission'] < $data['filter_balance']) {
				unset($rows[$_i]);
				continue;
			}
			$_aff_ids[] = $_r['affiliate_id'];			
		}
		$rows = array_values($rows);
		$sql_e = str_replace('[[AFFILIATES]]', implode(',', $_aff_ids), $sql_e);
		
		if(sizeof($_aff_ids) > 0) {
			$query_e = $this->db->query($sql_e);
			$rows_e = array();
			foreach($query_e->rows as $_r) {
				$rows_e[intval($_r['affiliate_id'])] = $_r['total_earnings'];
			}
		} else {
			$rows_e = array();
		}
		
		foreach($rows as $_i => $_r) {
			if(isset($rows_e[intval($_r['affiliate_id'])])) {
				$_r['total_earnings'] = $rows_e[intval($_r['affiliate_id'])];
				$rows[$_i] = $_r;
			}
		}		
		return $rows;
	}
	//+mod by yp end


	public function getCommission($data = array()) {

			
return $this->_mta_getCommission($data);//+mod by yp


		$sql = "SELECT at.affiliate_id, CONCAT(a.firstname, ' ', a.lastname) AS affiliate, a.email, a.status, SUM(at.amount) AS commission, COUNT(o.order_id) AS orders, SUM(o.total) AS total FROM " . DB_PREFIX . "affiliate_transaction at LEFT JOIN `" . DB_PREFIX . "affiliate` a ON (at.affiliate_id = a.affiliate_id) LEFT JOIN `" . DB_PREFIX . "order` o ON (at.order_id = o.order_id)";

		$implode = array();

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(at.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(at.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sql .= " GROUP BY at.affiliate_id ORDER BY commission DESC";

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

	public function getTotalCommission($data = array()) {
		$sql = "SELECT COUNT(DISTINCT affiliate_id) AS total FROM `" . DB_PREFIX . "affiliate_transaction`";

		$implode = array();

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getProducts($data = array()) {
		$sql = "SELECT at.product_id, CONCAT(a.firstname, ' ', a.lastname) AS affiliate, a.email, a.status, SUM(at.amount) AS commission, COUNT(o.order_id) AS orders, SUM(o.total) AS total FROM " . DB_PREFIX . "affiliate_transaction at LEFT JOIN `" . DB_PREFIX . "affiliate` a ON (at.affiliate_id = a.affiliate_id) LEFT JOIN `" . DB_PREFIX . "order` o ON (at.order_id = o.order_id) LEFT JOIN " . DB_PREFIX . "product";

		$implode = array();

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(at.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(at.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sql .= " GROUP BY at.affiliate_id ORDER BY commission DESC";

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

	public function getTotalProducts($data = array()) {
		$sql = "SELECT COUNT(DISTINCT product_id) AS total FROM `" . DB_PREFIX . "affiliate_transaction`";

		$implode = array();

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getAffiliateActivities($data = array()) {
		$sql = "SELECT aa.activity_id, aa.affiliate_id, aa.key, aa.data, aa.ip, aa.date_added FROM " . DB_PREFIX . "affiliate_activity aa LEFT JOIN " . DB_PREFIX . "affiliate a ON (aa.affiliate_id = a.affiliate_id)";

		$implode = array();

		if (!empty($data['filter_affiliate'])) {
			$implode[] = "CONCAT(a.firstname, ' ', a.lastname) LIKE '" . $this->db->escape($data['filter_affiliate']) . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "aa.ip LIKE '" . $this->db->escape($data['filter_ip']) . "'";
		}

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(aa.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(aa.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sql .= " ORDER BY aa.date_added DESC";

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

	public function getTotalAffiliateActivities($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "affiliate_activity` aa LEFT JOIN " . DB_PREFIX . "affiliate a ON (aa.affiliate_id = a.affiliate_id)";

		$implode = array();

		if (!empty($data['filter_affiliate'])) {
			$implode[] = "CONCAT(a.firstname, ' ', a.lastname) LIKE '" . $this->db->escape($data['filter_affiliate']) . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "aa.ip LIKE '" . $this->db->escape($data['filter_ip']) . "'";
		}

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(aa.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(aa.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}