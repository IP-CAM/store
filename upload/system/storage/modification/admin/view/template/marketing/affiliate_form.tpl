<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-affiliate" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-affiliate" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-payment" data-toggle="tab"><?php echo $tab_payment; ?></a></li>
            <?php if ($affiliate_id) { ?>
            <li><a href="#tab-transaction" data-toggle="tab"><?php echo $tab_transaction; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <fieldset>
                <legend><?php echo $text_affiliate_detail; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="firstname" value="<?php echo $firstname; ?>" placeholder="<?php echo $entry_firstname; ?>" id="input-firstname" class="form-control" />
                    <?php if ($error_firstname) { ?>
                    <div class="text-danger"><?php echo $error_firstname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="lastname" value="<?php echo $lastname; ?>" placeholder="<?php echo $entry_lastname; ?>" id="input-lastname" class="form-control" />
                    <?php if ($error_lastname) { ?>
                    <div class="text-danger"><?php echo $error_lastname; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                    <?php if ($error_email) { ?>
                    <div class="text-danger"><?php echo $error_email; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="telephone" value="<?php echo $telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                    <?php if ($error_telephone) { ?>
                    <div class="text-danger"><?php echo $error_telephone; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="fax" value="<?php echo $fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-code"><span data-toggle="tooltip" title="<?php echo $help_code; ?>"><?php echo $entry_code; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="code" value="<?php echo $code; ?>" placeholder="<?php echo $entry_code; ?>" id="input-code" class="form-control" />
                    <?php if ($error_code) { ?>
                    <div class="text-danger"><?php echo $error_code; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-password"><?php echo $entry_password; ?></label>
                  <div class="col-sm-10">
                    <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" autocomplete="off" id="input-password" class="form-control"  />
                    <?php if ($error_password) { ?>
                    <div class="text-danger"><?php echo $error_password; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-confirm"><?php echo $entry_confirm; ?></label>
                  <div class="col-sm-10">
                    <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" autocomplete="off" id="input-confirm" class="form-control" />
                    <?php if ($error_confirm) { ?>
                    <div class="text-danger"><?php echo $error_confirm; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                    <select name="status" id="input-status" class="form-control">
                      <?php if ($status) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_affiliate_address; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-company"><?php echo $entry_company; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="company" value="<?php echo $company; ?>" placeholder="<?php echo $entry_company; ?>" id="input-company" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-website"><?php echo $entry_website; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="website" value="<?php echo $website; ?>" placeholder="<?php echo $entry_website; ?>" id="input-website" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-address-1"><?php echo $entry_address_1; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="address_1" value="<?php echo $address_1; ?>" placeholder="<?php echo $entry_address_1; ?>" id="input-address-1" class="form-control" />
                    <?php if ($error_address_1) { ?>
                    <div class="text-danger"><?php echo $error_address_1; ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-address-2"><?php echo $entry_address_2; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="address_2" value="<?php echo $address_2; ?>" placeholder="<?php echo $entry_address_2; ?>" id="input-address-2" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-city"><?php echo $entry_city; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="city" value="<?php echo $city; ?>" placeholder="<?php echo $entry_city; ?>" id="input-city" class="form-control" />
                    <?php if ($error_city) { ?>
                    <div class="text-danger"><?php echo $error_city ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-postcode"><?php echo $entry_postcode; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="postcode" value="<?php echo $postcode; ?>" placeholder="<?php echo $entry_postcode; ?>" id="input-postcode" class="form-control" />
                    <?php if ($error_postcode) { ?>
                    <div class="text-danger"><?php echo $error_postcode ?></div>
                    <?php  } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                  <div class="col-sm-10">
                    <select name="country_id" id="input-country" class="form-control">
                      <option value=""><?php echo $text_select; ?></option>
                      <?php foreach ($countries as $country) { ?>
                      <?php if ($country['country_id'] == $country_id) { ?>
                      <option value="<?php echo $country['country_id']; ?>" selected="selected"> <?php echo $country['name']; ?> </option>
                      <?php } else { ?>
                      <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                    <?php if ($error_country) { ?>
                    <div class="text-danger"><?php echo $error_country; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                  <div class="col-sm-10">
                    <select name="zone_id" id="input-zone" class="form-control">
                    </select>
                    <?php if ($error_zone) { ?>
                    <div class="text-danger"><?php echo $error_zone; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-payment">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-commission"><span data-toggle="tooltip" title="<?php echo $help_commission; ?>"><?php echo $entry_commission; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="commission" value="<?php echo $commission; ?>" placeholder="<?php echo $entry_commission; ?>" id="input-commission" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-tax"><?php echo $entry_tax; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="tax" value="<?php echo $tax; ?>" placeholder="<?php echo $entry_tax; ?>" id="input-tax" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_payment; ?></label>
                <div class="col-sm-10">
                  <div class="radio">
                    <label>
                      <?php if ($payment == 'cheque') { ?>
                      <input type="radio" name="payment" value="cheque" checked="checked" />
                      <?php } else { ?>
                      <input type="radio" name="payment" value="cheque" />
                      <?php } ?>
                      <?php echo $text_cheque; ?></label>
                  </div>
                  <div class="radio">
                    <label>
                      <?php if ($payment == 'paypal') { ?>
                      <input type="radio" name="payment" value="paypal" checked="checked" />
                      <?php } else { ?>
                      <input type="radio" name="payment" value="paypal" />
                      <?php } ?>
                      <?php echo $text_paypal; ?></label>
                  </div>
                  <div class="radio">
                    <label>
                      <?php if ($payment == 'bank') { ?>
                      <input type="radio" name="payment" value="bank" checked="checked" />
                      <?php } else { ?>
                      <input type="radio" name="payment" value="bank" />
                      <?php } ?>
                      <?php echo $text_bank; ?></label>
                  </div>
                </div>
              </div>
              <div id="payment-cheque" class="payment">
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-cheque"><?php echo $entry_cheque; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="cheque" value="<?php echo $cheque; ?>" placeholder="<?php echo $entry_cheque; ?>" id="input-cheque" class="form-control" />
                    <?php if ($error_cheque) { ?>
                    <div class="text-danger"><?php echo $error_cheque; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div id="payment-paypal" class="payment">
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-paypal"><?php echo $entry_paypal; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="paypal" value="<?php echo $paypal; ?>" placeholder="<?php echo $entry_paypal; ?>" id="input-paypal" class="form-control" />
                    <?php if ($error_paypal) { ?>
                    <div class="text-danger"><?php echo $error_paypal; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </div>
              <div id="payment-bank" class="payment">
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-bank-name"><?php echo $entry_bank_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="<?php echo $entry_bank_name; ?>" id="input-bank-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-bank-branch-number"><?php echo $entry_bank_branch_number; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" placeholder="<?php echo $entry_bank_branch_number; ?>" id="input-bank-branch-number" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-bank-swift-code"><?php echo $entry_bank_swift_code; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" placeholder="<?php echo $entry_bank_swift_code; ?>" id="input-bank-swift-code" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-bank-account-name"><?php echo $entry_bank_account_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" placeholder="<?php echo $entry_bank_account_name; ?>" id="input-bank-account-name" class="form-control" />
                    <?php if ($error_bank_account_name) { ?>
                    <div class="text-danger"><?php echo $error_bank_account_name; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-bank-account-number"><?php echo $entry_bank_account_number; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" placeholder="<?php echo $entry_bank_account_number; ?>" id="input-bank-account-number" class="form-control" />
                    <?php if ($error_bank_account_number) { ?>
                    <div class="text-danger"><?php echo $error_bank_account_number; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <?php if ($affiliate_id) { ?>
            <div class="tab-pane" id="tab-transaction">
              <div id="transaction"></div>
              <br />
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="description" value="" placeholder="<?php echo $entry_description; ?>" id="input-description" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-amount"><?php echo $entry_amount; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="amount" value="" placeholder="<?php echo $entry_amount; ?>" id="input-amount" class="form-control" />
                </div>
              </div>
              <div class="text-right">
                <button type="button" id="button-transaction" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_transaction_add; ?></button>
              </div>
            </div>
            <?php } ?>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=localisation/country/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('input[name=\'postcode\']').parent().parent().removeClass('required');
			}

			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
					html += '<option value="' + json['zone'][i]['zone_id'] + '"';
					
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
						html += ' selected="selected"';
					}

          			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script> 
  <script type="text/javascript"><!--
$('input[name=\'payment\']').on('change', function() {
	$('.payment').hide();

	$('#payment-' + this.value).show();
});

$('input[name=\'payment\']:checked').trigger('change');
//--></script> 
  <script type="text/javascript"><!--
$('#transaction').delegate('.pagination a', 'click', function(e) {
	e.preventDefault();

	$('#transaction').load(this.href);
});

$('#transaction').load('index.php?route=marketing/affiliate/transaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>');

$('#button-transaction').on('click', function() {
	$.ajax({
		url: 'index.php?route=marketing/affiliate/addtransaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'description=' + encodeURIComponent($('#tab-transaction input[name=\'description\']').val()) + '&amount=' + encodeURIComponent($('#tab-transaction input[name=\'amount\']').val()),
		beforeSend: function() {
			$('#button-transaction').button('loading');
		},
		complete: function() {
			$('#button-transaction').button('reset');
		},
		success: function(json) {
			$('.alert').remove();
			
			if (json['error']) {
				 $('#tab-transaction').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');
			}

			if (json['success']) {
				$('#tab-transaction').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div></div>');

				$('#transaction').load('index.php?route=marketing/affiliate/transaction&token=<?php echo $token; ?>&affiliate_id=<?php echo $affiliate_id; ?>');
	
				$('#tab-transaction input[name=\'amount\']').val('');
				$('#tab-transaction input[name=\'description\']').val('');			
			}
		}
	});
});
//--></script></div>

			
<?php //+mod by yp start 
	if ($link_customer) { ?>
<script type="text/javascript"><!--
	$(document).ready(function() {	
		$('.panel-body').prepend('<div><?php echo $link_customer; ?></div>');
	});
//--></script> 
<?php }		
	if($config_website_textarea) {?>
<script type="text/javascript"><!--
	$(document).ready(function() {
        $('input[name="website"]').after('<textarea name="website" id="input-website" class="form-control"><?php echo $website; ?></textarea>');
		$('input[name="website"]').remove();
	});
//--></script> 
<?php }	
	if($config_website_required) {?>
<script type="text/javascript"><!--	
$(document).ready(function() {
	$('[name="website"]').parent().parent().addClass('required')
});
//--></script> 	
<?php }
	if($error_website) {?>
<script type="text/javascript"><!--
	$(document).ready(function() {
		$('[name="website"]').after('<div class="text-danger"><?php echo $error_website; ?></div>');
	});
//--></script> 
<?php }
	//+mod by yp end 
	?>



			
			<?php /* //+mod by yp start	*/ ?>
<script type="text/javascript" src="view/javascript/jquery.migrate.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery.tools.min.js"></script>
<script type="text/javascript"><!--			
$(document).ready(function() {
	var _html = '<div class="form-group"><label class="col-sm-2 control-label" id="level_span"><?php echo mta_jsstr($text_level); ?>  <?php echo $level; ?></label><div class="col-sm-10"><a href="<?php echo mta_jsstr($link_downline); ?>" target="_blank"><?php echo mta_jsstr($text_view_downline); ?></a></div></div>';
	_html += '<div class="form-group"><label class="col-sm-2 control-label" for="input-parent-affiliate-id"><?php echo mta_jsstr($entry_parent); ?></label><div class="col-sm-10"><div class="input-group"><input type="hidden" name="parent_affiliate_id" value="<?php echo $parent_affiliate_id; ?>" /><input type="hidden" name="parent_affiliate_name" value="<?php echo mta_jsstr($parent_affiliate_name); ?>" /><span id="parent_affiliate_span">';
	<?php if($parent_affiliate_id) {?>
	_html += '<a href="<?php echo mta_jsstr($parent_affiliate_link); ?>" target="_blank"><?php echo mta_jsstr($parent_affiliate_name); ?></a>';
						<?php
							} else { ?>
	_html += '<?php echo mta_jsstr($text_none); ?>';
						<?php } ?>
	_html += '</span><div class="btn-group"><button type="button" rel="#affiliate_dt_overlay_div" id="affiliate_dt_overlay_open" class="btn btn-default"><?php echo mta_jsstr($text_select_affiliate); ?></button><button type="button" id="affiliate_set_none" class="btn btn-default"><?php echo mta_jsstr($text_set_none); ?></button></div></div></div></div><div class="form-group"><label class="col-sm-2 control-label" for="input-scheme"><?php echo mta_jsstr($entry_scheme); ?></label><div class="col-sm-10"><select name="scheme" id="input-scheme" class="form-control"><option value="0"<?php if(!$scheme_id) { ?> selected="selected"<?php } ?>><?php echo mta_jsstr($option_default); ?></option>';
						<?php	
							foreach($schemes as $_id => $_name) {?>
	_html += '<option value="<?php echo $_id;?>"<?php if($scheme_id == $_id) {?> selected="selected"<?php } ?>><?php echo mta_jsstr($_name); ?></option>';
						<?php } ?>
	_html += '</select></div></div>';
	$('input[name="email"]').parent().parent().after(_html);
	$.ajax({
		url: 'index.php?route=mta/mta_pds/datatable&token=<?php echo $token; ?>&add_js=affiliate_form',
		type: 'get',
		dataType: 'html',
		success: function(html) {
			$('#content').append(html);
		}
	});
});	
//--></script>			
			<?php /* //+mod by yp end */ ?>
							

	
			
<?php //+mod by yp start
	if($tracking_discount_status) { ?>
<script type="text/javascript"><!-- 
jQuery(document).ready(function() {
	var _html = '<div class="form-group"><label class="col-sm-2 control-label" for="input-tracking-discount-amount"><span data-toggle="tooltip" title="<?php echo $help_tracking_discount_amount; ?>"><?php echo $entry_tracking_discount_amount; ?></span></label><div class="col-sm-10"><input type="text" name="tracking_discount_amount" value="<?php echo $tracking_discount_amount; ?>" placeholder="<?php echo $entry_tracking_discount_amount; ?>" id="input-tracking-discount-amount" class="form-control" />';
<?php if ($error_tracking_discount_amount) { ?>	
	_html += '<div class="text-danger"><?php echo $error_tracking_discount_amount; ?></div>';
<?php } ?>	
	_html += '</div></div><div class="form-group"><label class="col-sm-2 control-label" for="input-tracking-discount-type"><?php echo $entry_tracking_discount_type; ?></label><div class="col-sm-10"><select name="tracking_discount_type" id="input-tracking-discount-type" class="form-control"><option value="percent"<?php if ($tracking_discount_type != 'fixed') { echo ' selected="selected"'; } ?>><?php echo $option_tracking_discount_percent; ?></option><option value="fixed"<?php if ($tracking_discount_type == 'fixed') { echo ' selected="selected"'; } ?>><?php echo $option_tracking_discount_fixed; ?></option></select></div></div>';
	jQuery('#tab-payment>div:first').after(_html);
});
//--></script> 			
<?php //+mod by yp end
	} ?>
	
			
<?php echo $footer; ?>