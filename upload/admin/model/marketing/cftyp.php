<?php

class ModelMarketingCftyp extends Model {

	public function getAffiliates($filter=false) {
		$q = "select affiliate_id as id, concat(firstname, ' ', lastname, '(', email , ')') as n from " . DB_PREFIX . "affiliate where `status`='1' and approved='1'";		
		if($filter) {
			$filter = $this->db->escape(strtolower($filter));
			$q .= " and (LOWER(firstname) like '$filter%' or LOWER(lastname) like '$filter%' or LOWER(email) like '$filter%' or LOWER(email) like '%@$filter%') ";
		}
		$q .= " order by concat(firstname, ' ', lastname)";
		$res = $this->db->query($q);
		$out = array();
		foreach($res->rows as $r) {
			$out[strval($r['id'])] = $r['n'];
		}
		return $out;	
	}
	
	public function getMarketing($filter=false) {
		$q = "select marketing_id as id, `name` as n from " . DB_PREFIX . "marketing where 1=1";
		if($filter) {
			$filter = $this->db->escape(strtolower($filter));
			$q .= " and LOWER(`name`) like '%$filter%'";
		}
		$q .= " order by n";
		$res = $this->db->query($q);
		$out = array();
		foreach($res->rows as $r) {
			$out[strval($r['id'])] = $r['n'];
		}
		return $out;	
	}
	
	
	public function getCouponAssoc($coupon_id) {
		$res = $this->db->query("SELECT ca.ctype, a.affiliate_id, a.status, a.approved, m.marketing_id from " . DB_PREFIX . "cftyp_coupon_affiliate ca left join " . DB_PREFIX . "affiliate a on a.affiliate_id = ca.affiliate_id left join " . DB_PREFIX . "marketing m on m.marketing_id = ca.marketing_id where ca.coupon_id = '" . (int)$coupon_id . "'");
		if($res->num_rows < 1 || ($res->row['ctype'] == 'a' && (!$res->row['affiliate_id'] || !$res->row['status'] || !$res->row['approved'])) || ($res->row['ctype'] == 'm' && !$res->row['marketing_id'])) return '0';		
		return ($res->row['ctype'] == 'a' ? 'a_' . $res->row['affiliate_id'] : 'm_' . $res->row['marketing_id']);
	}
	
	public function edit($coupon_id, $assoc = false) {
		if(!preg_match("/^\d+$/", $coupon_id)) return;
		if(!$assoc) {
			$this->db->query("delete from " . DB_PREFIX . "cftyp_coupon_affiliate where coupon_id='" . (int)$coupon_id . "'");
			return;
		}
		if(!preg_match("/^[am]_\d+$/", $assoc)) return;
		list($ctype, $id) = explode('_', $assoc);
		if($ctype == 'a') {
			$affiliate_id = intval($id);
			$marketing_id = 0;
		} else {
			$affiliate_id = 0;
			$marketing_id = intval($id);
		}
		$this->db->query("insert into " . DB_PREFIX . "cftyp_coupon_affiliate (coupon_id, affiliate_id, marketing_id, ctype) values ('" . (int)$coupon_id . "', '" . $affiliate_id . "', '" . $marketing_id . "', '" . $ctype . "') on duplicate key update affiliate_id = '" . $affiliate_id . "', marketing_id = '" . $marketing_id . "', ctype = '" . $ctype . "'");
	}
	

}
