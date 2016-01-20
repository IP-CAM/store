<?php

class ModelMtaAffiliateDownline extends Model {

	public function countSubs($affiliate_id) {
		$res = $this->db->query("select count(*) as c from " . DB_PREFIX . "mta_affiliate where `parent_affiliate_id` = '" . (int)$affiliate_id . "'");
		return $res->row['c'];
	}
	
	public function loadSubs($affiliate_id) {		
		$q = "SELECT (select COUNT(*) from " . DB_PREFIX . "mta_affiliate where `parent_affiliate_id` = mta1.`affiliate_id`) AS c, CONCAT(a.firstname, ' ', a.lastname) AS `name`, a.email, a.telephone, a.affiliate_id, 
		(select sum(`amount`) from " . DB_PREFIX . "affiliate_transaction where affiliate_id  = mta1.`affiliate_id` and `amount` > 0) as e_te,
		(select sum(`amount`) from " . DB_PREFIX . "affiliate_transaction where affiliate_id  = mta1.`affiliate_id` and `amount` > 0 and date_added > subdate(now(), INTERVAL 1 month)) as e_elm 		
FROM " . DB_PREFIX . "mta_affiliate mta1, " . DB_PREFIX . "affiliate a WHERE mta1.`parent_affiliate_id` = '" . (int)$affiliate_id . "' 
AND a.`affiliate_id`=mta1.`affiliate_id` GROUP BY mta1.`affiliate_id`";
		$res = $this->db->query($q);
		return $res->rows;
	}		

}
