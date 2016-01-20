<?php

class ControllerMtaMtaEvent extends Controller {

	public function eventDeleteCoupon($coupon_id) {
		$this->db->query("delete from " . DB_PREFIX . "mta_product where price_mod_type='coupon' and price_mod_id='" . (int)$coupon_id . "'");
		$this->db->query("delete from " . DB_PREFIX . "mta_product_affiliate where price_mod_type='coupon' and price_mod_id='" . (int)$coupon_id . "'");	
	}

	public function eventDeleteAffiliate($affiliate_id) {
		$this->load->model('mta/mta_affiliate');
		$aff = $this->model_mta_mta_affiliate->getAffiliate($affiliate_id);
		if($aff) {
			$p_id = isset($aff['parent_affiliate_id']) && $aff['parent_affiliate_id'] ? intval($aff['parent_affiliate_id']) : 0;
			$res = $this->db->query("select affiliate_id as id from " . DB_PREFIX . "mta_affiliate where parent_affiliate_id='" . (int)$affiliate_id . "'");
			$_ch = array();
			foreach($res->rows as $_r) {
				$_ch[] = $_r['id'];				
			}			
			$this->db->query("UPDATE " . DB_PREFIX . "mta_affiliate SET parent_affiliate_id='{$p_id}', all_parent_ids='" . $this->db->escape(implode(',', $aff['parents'])) . "', level_original='" . (sizeof($aff['parents']) + 1) . "' where parent_affiliate_id='" . (int)$affiliate_id . "'");				
			foreach($_ch as $_rid) {				
				$this->model_mta_mta_affiliate->fix_children($_rid, $aff['parents']);
			}
		}
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET affiliate_id='{$p_id}' WHERE affiliate_id='" . (int)$affiliate_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "mta_affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");		
	}
	
	public function eventAddProductPre($data) {
		$this->config->set('_mta_product_data_', $data);
	}
	
	public function eventAddProductPost($product_id) {
		$data = $this->config->get('_mta_product_data_');
		if(!$data) return;
		$this->config->set('_mta_product_data_', 0);
		$this->load->model('mta/mta_product');
		$this->model_mta_mta_product->setDefaultsForNew($product_id);
		if(isset($data['product_scheme_id']) && mta_check_int($data['product_scheme_id']) && $data['product_scheme_id'] > 0) $this->model_mta_mta_product->updateProductScheme($product_id, $data['product_scheme_id']);		
	}	

	public function eventEditProductPre($data) {
		$this->config->set('_mta_product_data_', $data);		
	}
	
	public function eventEditProductPost($product_id) {
		$data = $this->config->get('_mta_product_data_');
		if(!$data) return;
		$this->config->set('_mta_product_data_', 0);	
		
		foreach(array('discount', 'special') as $t) {		
			$this->db->query("DELETE FROM " . DB_PREFIX . "mta_product WHERE product_id = '" . (int)$product_id . "' and price_mod_type='" . $t . "'");
			if(isset($data['product_' . $t])) {
				foreach($data['product_' . $t] as $_i => $product_t) {
					$t_set = isset($product_t['scheme_id']) && $product_t['scheme_id'];
					$ta_set = isset($data['product_' . $t . '_affiliates'][$_i]) && is_array($data['product_' . $t . '_affiliates'][$_i]) && sizeof($data['product_' . $t . '_affiliates'][$_i]) > 0;
					if(!$t_set && !$ta_set) continue;
					$_res = $this->db->query("select product_" . $t . "_id AS tid from " . DB_PREFIX . "product_" . $t . " WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$product_t['customer_group_id'] . "' AND priority = '" . (int)$product_t['priority'] . "' AND price = '" . (float)$product_t['price'] . "'");
					if($_res->num_rows < 1) continue;
					$t_id = intval($_res->row['tid']);
					if($t_set) {						
						$this->db->query("insert " . DB_PREFIX . "mta_product set product_id='" . (int)$product_id . "', mta_scheme_id='" . (int) $product_t['scheme_id'] . "', price_mod_type='" . $t . "', price_mod_id='" . $t_id . "'");					
					}
					if($ta_set) {
						if(isset($product_t['product_' . $t . '_id'])) $this->db->query("DELETE FROM " . DB_PREFIX . "mta_product_affiliate WHERE product_id = '" . (int)$product_id . "' and price_mod_type='" . $t . "' and price_mod_id='" . (int) $product_t['product_' . $t . '_id'] . "'");
						$_insert = array();
						foreach($data['product_' . $t . '_affiliates'][$_i] as $_scheme_id => $_affs) {
							if(!$_affs) continue;
							$_affs = explode(',', $_affs);							
							foreach($_affs as $_aff) {
								$_insert[] = "('" . (int)$product_id . "','" . (int)$_scheme_id . "','" . $t . "','" . $t_id . "','" . (int)$_aff . "')";
							}
						}
						if(sizeof($_insert) > 0) $this->db->query("insert into " . DB_PREFIX . "mta_product_affiliate (product_id, mta_scheme_id,price_mod_type,price_mod_id,affiliate_id) values " . implode(',', $_insert));
					} else {
						if(isset($product_t['product_' . $t . '_id'])) $this->db->query("update " . DB_PREFIX . "mta_product_affiliate set price_mod_id='" . $t_id . "' where product_id = '" . (int)$product_id . "' and price_mod_type='" . $t . "' and price_mod_id='" . (int)$product_t['product_' . $t . '_id'] . "'");					
					}
				}
			}		
		}
		
		$this->db->query("delete from " . DB_PREFIX . "mta_product where product_id='" . (int)$product_id . "' and price_mod_type=''");
		if(isset($data['product_scheme_id']) && $data['product_scheme_id']) $this->db->query("insert into " . DB_PREFIX . "mta_product set product_id='" . (int)$product_id . "', mta_scheme_id='" . (int) $data['product_scheme_id'] . "', price_mod_type=''");
		
		//product / affiliate
		if(isset($data['product_affiliates']) && is_array($data['product_affiliates']) && sizeof($data['product_affiliates']) > 0) {
			$this->db->query("delete from " . DB_PREFIX . "mta_product_affiliate where product_id='" . (int)$product_id . "' and price_mod_type=''");
			$_insert = array();
			foreach($data['product_affiliates'] as $_scheme_id => $_aff_ids) {				
				if(!$_aff_ids) continue;
				$_aff_ids = explode(',', $_aff_ids);
				foreach($_aff_ids as $_aff_id) {
					if(mta_check_int($_aff_id) && $_aff_id > 0) $_insert[] = "('" . (int) $product_id . "','" . (int) $_scheme_id . "','" . (int) $_aff_id . "')";
				}				
			}
			if(sizeof($_insert) > 0) $this->db->query("insert into " . DB_PREFIX . "mta_product_affiliate (product_id, mta_scheme_id, affiliate_id) values " . implode(',', $_insert));			
		}
		
		//coupons
		if(isset($data['product_coupon_scheme_id'])) {
			//$this->db->query("delete from " . DB_PREFIX . "mta_product where product_id='" . (int)$product_id . "' and price_mod_type='coupon'");
			$_insert = array();
			foreach($data['product_coupon_scheme_id'] as $_coupon_id => $_scheme_id) {
				$this->db->query("delete from " . DB_PREFIX . "mta_product where product_id='" . (int)$product_id . "' and price_mod_type='coupon' and price_mod_id='" . (int) $_coupon_id . "'");	
				$this->db->query("delete from " . DB_PREFIX . "mta_product_affiliate where product_id='" . (int)$product_id . "' and price_mod_type='coupon' and price_mod_id='" . (int) $_coupon_id . "'");			
				if($_scheme_id) $_insert[] = "('" . (int) $product_id . "','" . (int) $_scheme_id . "','coupon','" . (int) $_coupon_id . "')";
			}
			if(sizeof($_insert) > 0) $this->db->query("insert into " . DB_PREFIX . "mta_product (product_id, mta_scheme_id, price_mod_type, price_mod_id) values " . implode(',', $_insert));			
		}
		//coupons / affiliate
		if(isset($data['product_coupon_affiliates']) && is_array($data['product_coupon_affiliates']) && sizeof($data['product_coupon_affiliates']) > 0) {
			//$this->db->query("delete from " . DB_PREFIX . "mta_product_affiliate where product_id='" . (int)$product_id . "' and price_mod_type='coupon'");
			$_insert = array();
			foreach($data['product_coupon_affiliates'] as $_coupon_id => $_sAr) {				
				foreach($_sAr as $_scheme_id => $_aff_ids) {				
					if(!$_aff_ids) continue;
					$_aff_ids = explode(',', $_aff_ids);
					foreach($_aff_ids as $_aff_id) {
						if(mta_check_int($_aff_id) && $_aff_id > 0) $_insert[] = "('" . (int) $product_id . "','" . (int) $_scheme_id . "','coupon','" . (int) $_coupon_id . "','" . (int) $_aff_id . "')";
					}				
				}
			}
			if(sizeof($_insert) > 0) $this->db->query("insert into " . DB_PREFIX . "mta_product_affiliate (product_id, mta_scheme_id, price_mod_type, price_mod_id, affiliate_id) values " . implode(',', $_insert));			
		}				
	}

	public function eventDeleteProductPost($product_id) {	
		$this->db->query("delete from " . DB_PREFIX . "mta_product_affiliate where product_id='" . (int)$product_id. "'");
		$this->db->query("delete from " . DB_PREFIX . "mta_product where product_id='" . (int)$product_id. "'");	
	}
	
	public function eventAddAffiliatePre($data) {
		$this->config->set('_mta_affiliate_data_', $data);		
	}
	
	public function eventAddAffiliatePost($affiliate_id) {
		$data = $this->config->get('_mta_affiliate_data_');
		if(!$data) return;
		$this->config->set('_mta_affiliate_data_', 0);	
		
      	if($data['parent_affiliate_id']) {
			$res = $this->db->query("select all_parent_ids as allids from " . DB_PREFIX . "mta_affiliate where affiliate_id='" . $data['parent_affiliate_id'] . "'");
			$parent_ids = !$res->row['allids'] ? array() : explode(',', $res->row['allids']);
			array_unshift($parent_ids, $data['parent_affiliate_id']);
			$level_original = sizeof($parent_ids) + 1;
			$parent_ids = implode(',', $parent_ids);
		} else { 
			$data['parent_affiliate_id'] = '0';
			$level_original = '1';
			$parent_ids = '';
		}
		$this->db->query("insert  " . DB_PREFIX . "mta_affiliate set affiliate_id='$affiliate_id', mta_scheme_id=" . ($data['scheme'] ? "'" . $data['scheme'] . "'" : "null") . ", parent_affiliate_id='" . $data['parent_affiliate_id'] . "', all_parent_ids='" . $this->db->escape($parent_ids) . "', level_original='$level_original'"); 
		$this->load->model('marketing/affiliate');
		$this->model_marketing_affiliate->approve($affiliate_id);		
	}
	
	public function eventEditAffiliatePre($data) {
		$this->config->set('_mta_affiliate_data_', $data);		
	}
	
	public function eventEditAffiliatePost($affiliate_id) {
		$data = $this->config->get('_mta_affiliate_data_');
		if(!$data) return;
		$this->config->set('_mta_affiliate_data_', 0);	
		
		$res = $this->db->query("select mta_scheme_id, parent_affiliate_id from " . DB_PREFIX . "mta_affiliate WHERE affiliate_id='" . (int)$affiliate_id . "'");
		if(!$res->row['parent_affiliate_id']) $res->row['parent_affiliate_id'] = 0;
		if(!$data['parent_affiliate_id']) $data['parent_affiliate_id'] = 0;
		if(is_null($res->row['mta_scheme_id']) || !$res->row['mta_scheme_id']) $res->row['mta_scheme_id'] = 0;
		if(!$data['scheme']) $data['scheme'] = 0;
		if($res->row['mta_scheme_id'] != $data['scheme']) $this->db->query("update " . DB_PREFIX . "mta_affiliate set mta_scheme_id=" . ($data['scheme'] ? "'" . $data['scheme'] . "'" : "null") . " WHERE affiliate_id='$affiliate_id'");

		if($res->row['parent_affiliate_id'] != $data['parent_affiliate_id']) {
			$parent_changed = true;
			if($data['parent_affiliate_id']) {
				$res = $this->db->query("select all_parent_ids as allids from " . DB_PREFIX . "mta_affiliate where affiliate_id='" . $data['parent_affiliate_id'] . "'");
				$parent_ids = !$res->row['allids'] ? array() : explode(',', $res->row['allids']);
				if(!in_array(strval($affiliate_id), $parent_ids)) {
					array_unshift($parent_ids, $data['parent_affiliate_id']);
					$this->db->query("update  " . DB_PREFIX . "mta_affiliate set parent_affiliate_id='" . $data['parent_affiliate_id'] . "', all_parent_ids='" . $this->db->escape(implode(',', $parent_ids)) . "', level_original='" . (sizeof($parent_ids) + 1) . "' where affiliate_id='$affiliate_id'");
				} else {
					$parent_changed = false;
				}					
			} else {
				$parent_ids = array();
				$this->db->query("update  " . DB_PREFIX . "mta_affiliate set parent_affiliate_id='0', all_parent_ids='', level_original='1' where affiliate_id='$affiliate_id'");				
			}				
			//change parents for all children of this affiliate
			if($parent_changed === true) {
				$this->load->model('mta/mta_affiliate');
				$this->model_mta_mta_affiliate->fix_children($affiliate_id, $parent_ids);
			}			
		}         	
	}
	
	
}
