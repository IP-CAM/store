<?php

class ControllerModuleMta extends Controller {

	private $version = 141118;

	private $_perms = array(
		'mta/mta',
		'mta/mta_affiliate_dt',
		'mta/mta_pds',		
		'mta/mta_set_scheme',
		'mta/affiliate_downline',
		'mta/mta_event'
	);	
	
	public function install() {
		if (!$this->user->hasPermission('modify', 'extension/module')) return;		
$this->db->query("create table if not exists " . DB_PREFIX . "mta_scheme (
	mta_scheme_id int(6) unsigned not null auto_increment,
	scheme_name varchar(100) not null default '',
	description text not null,
	max_levels smallint(3) unsigned not null default '1',
	is_default tinyint(1) unsigned not null default '0', 
	all_commissions text not null,	
	all_autoadd text not null,	
	commission_type enum('percentage','fixed') not null default 'percentage',
	before_shipping tinyint(1) unsigned not null default '1',
	eternal smallint(3) unsigned not null default '0',
	signup_code char(13) not null default '',
	primary key (mta_scheme_id),
	unique key (`scheme_name`),
	unique key (`signup_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8");
	
$this->db->query("create table if not exists " . DB_PREFIX . "mta_scheme_levels (
	mta_scheme_level_id int(8) unsigned not null auto_increment,
	mta_scheme_id int(6) unsigned not null default '1',
	num_levels smallint(3) unsigned not null default '1',	
	level smallint(3) unsigned not null default '1',	
	commission decimal(15,4) NOT NULL DEFAULT '0.0000',
	autoadd smallint(2) unsigned not null default '1',
	primary key (mta_scheme_level_id),
	unique key (mta_scheme_id, num_levels, level),
	CONSTRAINT `mta_scheme_level_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `" .  DB_PREFIX . "mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

$this->db->query("create table if not exists " . DB_PREFIX . "mta_autoapprove (
	mta_autoapprove_id int(8) unsigned not null auto_increment,
	mta_scheme_id int(6) unsigned not null default '1',
	signup_level smallint(3) unsigned not null default '1',	
	autoapprove smallint(2) unsigned not null default '1',
	primary key (mta_autoapprove_id),
	unique key (mta_scheme_id, signup_level),
	CONSTRAINT `mta_autoapprove_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `" .  DB_PREFIX . "mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8");


$this->db->query("create table if not exists " . DB_PREFIX . "mta_affiliate (	
	affiliate_id int(10) unsigned not null default '0',
	mta_scheme_id int(6) unsigned default null,
	parent_affiliate_id int(10) unsigned not null default '0',
	all_parent_ids text not null,		
	level_original smallint(3) unsigned not null default '1',		
	primary key (affiliate_id),
  KEY `FK_mta_scheme_id` (`mta_scheme_id`),
	CONSTRAINT `mta_affiliate_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `" .  DB_PREFIX . "mta_scheme` (`mta_scheme_id`) ON DELETE SET NULL ON UPDATE CASCADE  	
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

$this->db->query("create table if not exists " . DB_PREFIX . "mta_product (
	mta_product_id int(11) unsigned NOT NULL auto_increment,
	product_id int(11) unsigned NOT NULL default '0',	
	price_mod_type enum('','coupon','special','discount') not null default '',
	price_mod_id int(11) unsigned NOT NULL default '0',	
	mta_scheme_id int(6) unsigned default null,
	primary key (mta_product_id),
	unique key (product_id, price_mod_type, price_mod_id),
	KEY `FK_mta_product_mta_scheme_id` (`mta_scheme_id`),
	CONSTRAINT `mta_product_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `" .  DB_PREFIX . "mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE  	
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

$this->db->query("create table if not exists " . DB_PREFIX . "mta_product_affiliate (
	mta_product_affiliate_id int(10) unsigned not null auto_increment,	
	product_id int(11) unsigned NOT NULL default '0',
	affiliate_id int(10) unsigned not null default '0',
	price_mod_type enum('','coupon','special','discount') not null default '',
	price_mod_id int(11) unsigned NOT NULL default '0',	
	mta_scheme_id int(6) unsigned default null,
	primary key (mta_product_affiliate_id),
	unique key (product_id,affiliate_id,price_mod_type, price_mod_id),
	CONSTRAINT `mta_product_affiliate_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `" .  DB_PREFIX . "mta_affiliate` (`affiliate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `mta_product_affiliate_ibfk_2` FOREIGN KEY (`mta_scheme_id`) REFERENCES `" .  DB_PREFIX . "mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE  	
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

$this->db->query("create table if not exists " . DB_PREFIX . "mta_order (
	mta_order_id int(11) unsigned not null auto_increment,		
	order_id int(11) not null default '0',  	
	affiliate_id int(10) unsigned default null,
	commission decimal(15,4) NOT NULL DEFAULT '0.0000',
	commission_added tinyint(1) unsigned not null default '0', 
	autoadd tinyint(1) unsigned not null default '0', 
	primary key (mta_order_id),
	unique key (affiliate_id, order_id),
	CONSTRAINT `mta_order_ibfk_1` FOREIGN KEY (`affiliate_id`) REFERENCES `" .  DB_PREFIX . "mta_affiliate` (`affiliate_id`) ON DELETE set null ON UPDATE CASCADE  	
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

$this->db->query("create table if not exists " . DB_PREFIX . "mta_order_product (
	mta_order_product_id int(11) unsigned not null auto_increment,		
	mta_order_id int(11) unsigned default null,
	product_id int(11) unsigned NOT NULL default '0',	
	order_product_id int(11) unsigned NOT NULL default '0',	
	affiliate_id int(10) unsigned default null,	
	commission decimal(15,4) NOT NULL DEFAULT '0.0000',
	mta_scheme_id int(6) unsigned default null,
	num_levels smallint(3) unsigned not null default '1',	
	level smallint(3) unsigned not null default '1',
	autoadd tinyint(1) unsigned not null default '0', 
	primary key (mta_order_product_id),
	unique key (affiliate_id, order_product_id),
	KEY `FK_mta_order_id` (`mta_order_id`),
	CONSTRAINT `mta_order_product_ibfk_1` FOREIGN KEY (`mta_order_id`) REFERENCES `" .  DB_PREFIX . "mta_order` (`mta_order_id`) ON DELETE CASCADE ON UPDATE CASCADE  	
) ENGINE=InnoDB DEFAULT CHARSET=utf8");

$this->db->query("CREATE TABLE if not exists `" . DB_PREFIX . "mta_product_default_scheme` (
  `mta_product_default_scheme_id` INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `entity_type` ENUM('coupon','m','c','m_coupon','m_special','m_discount','c_coupon','c_special','c_discount') NOT NULL DEFAULT 'coupon',
  `entity_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
  `mta_scheme_id` INT(6) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`mta_product_default_scheme_id`),
  UNIQUE KEY `enitity` (`entity_id`, `entity_type`),
  CONSTRAINT `mta_product_default_scheme_ibfk_1` FOREIGN KEY (`mta_scheme_id`) REFERENCES `" . DB_PREFIX . "mta_scheme` (`mta_scheme_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8");	
	
try {
	$_hasc = false;
	$res = $this->db->query("show columns from " . DB_PREFIX . "customer");
	foreach($res->rows as $_r) {
		if($_r['Field'] == 'affiliate_id') {
			$_hasc = true;
			break;
		}		
	}
	if(!$_hasc) $this->db->query("alter table " . DB_PREFIX . "customer add affiliate_id int(11) unsigned not null default '0'");
	$_res = $this->db->query("select customer_id, affiliate_id from `" . DB_PREFIX . "order` where affiliate_id > 0 group by customer_id");
	$res = $_res->num_rows > 0 ? $_res->rows : array();
} catch(Exception $_exc) {
	$res = array();
}

foreach($res as $_r) {
	$this->db->query("update " . DB_PREFIX . "customer set affiliate_id='" . (int) $_r['affiliate_id'] . "' where customer_id='" . (int) $_r['customer_id'] . "'");
}	

//$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "mta_scheme_levels");
//$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "mta_scheme");

		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('mta_version', array('mta_version' => $this->version));

		$this->module_permissions('add', $this->_perms);		
		
		$events = array(
			array('coupon', 'delete', 'pre.admin', 'mta/mta_event/eventDeleteCoupon'),
			array('product', 'add', 'pre.admin', 'mta/mta_event/eventAddProductPre'),
			array('affiliate', 'delete', 'pre.admin', 'mta/mta_event/eventDeleteAffiliate'),
			array('product', 'add', 'post.admin', 'mta/mta_event/eventAddProductPost'),
			array('affiliate', 'add', 'pre.admin', 'mta/mta_event/eventAddAffiliatePre'),
			array('affiliate', 'add', 'post.admin', 'mta/mta_event/eventAddAffiliatePost'),		
			array('affiliate', 'edit', 'pre.admin', 'mta/mta_event/eventEditAffiliatePre'),
			array('affiliate', 'edit', 'post.admin', 'mta/mta_event/eventEditAffiliatePost'),					
			array('product', 'edit', 'pre.admin', 'mta/mta_event/eventEditProductPre'),
			array('product', 'edit', 'post.admin', 'mta/mta_event/eventEditProductPost'),
			array('product', 'delete', 'post.admin', 'mta/mta_event/eventDeleteProductPost'),			
			array('customer.add', false, 'pre', 'affiliate/mta_event/eventAddCustomerPre'),
			array('customer.add', false, 'post', 'affiliate/mta_event/eventAddCustomerPost'),			
			array('affiliate.add', false, 'post', 'affiliate/mta_event/eventAddAffiliatePost'),	
			array('history.add', false, 'pre.order', 'affiliate/mta_event/eventAddOrderHistoryPre'),
			array('history.add', false, 'post.order', 'affiliate/mta_event/eventAutoAddCommissions'),
			array('add.transaction', false, 'post.affiliate', 'affiliate/mta_event/eventAddTransactionPost'),
			array('order.add', false, 'pre', 'affiliate/mta_event/eventAddOrderPre'),
			array('order.add', false, 'post', 'affiliate/mta_event/eventAddOrderPost'),
			array('order.delete', false, 'pre', 'affiliate/mta_event/eventDeleteOrder'),
			array('order.edit', false, 'pre', 'affiliate/mta_event/eventEditOrderPre'),
			array('order.edit', false, 'post', 'affiliate/mta_event/eventEditOrderPost')
		);		
		$this->addEvents('mta', $events);
	}
	
	public function index() {
		$this->response->redirect($this->url->link('mta/mta', 'token=' . $this->session->data['token'], 'SSL'));	
	}

	public function uninstall() {
		if (!$this->user->hasPermission('modify', 'extension/module')) return;		
		$this->load->model('extension/modification');
		$mods = $this->model_extension_modification->getModifications();
		$has_mods = sizeof($mods) > 0 ? true : false;
		if($has_mods) {
			foreach($mods as $m) {
				if((isset($m['code']) && preg_match("/^mta\d{6}_\d?yp$/", $m['code'])) || strpos(strtolower($m['name']), 'multi tier affiliate') === 0)	$this->model_extension_modification->deleteModification($m['modification_id']);
			}
		}

		$this->load->model('setting/setting');
		$this->model_setting_setting->deleteSetting('mta_version');
		$this->model_setting_setting->deleteSetting('mta_ypx');

		$this->deleteEvents('mta');
		$this->module_permissions('add', $this->_perms);
		
		if($has_mods) $this->load->controller('extension/modification/refresh');
	}

	protected function addEvents($name, $events) {
		$n = VERSION === '2.0.0.0' ? 'tool' : 'extension';
		$this->load->model($n . '/event');
		$this->{'model_' . $n . '_event'}->deleteEvent($name);	
		$ks = array(0,1);
		if(VERSION === '2.0.0.0') $ks = array_reverse($ks);		
		foreach($events as $e) {			
			$trigger = array($e[2]);
			foreach($ks as $_i) {
				if($e[$_i]) $trigger[] = $e[$_i];				
			}
			$this->{'model_' . $n . '_event'}->addEvent($name, implode('.', $trigger), $e[3]);
		}		
	}
	
	protected function deleteEvents($name) {
		$n = VERSION === '2.0.0.0' ? 'tool' : 'extension';
		$this->load->model($n . '/event');
		$this->{'model_' . $n . '_event'}->deleteEvent($name);	
	}		

	protected function module_permissions($action = 'add', $data = array()) {
		if($action !== 'add') $action = 'remove';
		if(sizeof($data) === 0) {
			if(property_exists($this, 'name') && $this->name) {
				$data = array('module/' . $this->name);
			} else {
				return;
			}
		}
		$this->load->model('user/user_group');
		$id = VERSION === '2.0.0.0' ? $this->user->getId() : $this->user->getGroupId();
		foreach($data as $route) {
			$this->model_user_user_group->{$action . 'Permission'}($id, 'access', $route);
			$this->model_user_user_group->{$action . 'Permission'}($id, 'modify', $route);
		}
	}
	
}
