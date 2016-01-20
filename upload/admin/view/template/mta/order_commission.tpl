<?php echo $header; ?>
<style>
.help {
	color: #999;
	font-size: 10px;
	font-weight: normal;
	font-family: Verdana, Geneva, sans-serif;
	display: block;
}
</style>
<?php echo $column_left; ?><div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-order-commission" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <span id="error-warning"><?php echo $error_warning; ?></span>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $text_success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>	
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" id="form-order-commission">
			<input type="hidden" name="save_commission" value="1" />
			<input type="hidden" id="added_ids" value="<?php echo $added_ids; ?>" />
			<div>
				<div>
					<button type="button" class="btn btn-default" rel="#affiliate_dt_overlay_div" id="affiliate_dt_overlay_open"><?php echo $text_add_affiliate;?></button>
				</div>
				<div><a href="<?php echo $link_order; ?>"><?php echo $text_order; ?></a></div>      
				<div>
					<input type="radio" name="do_add" value="0"<?php if (!$do_add) { ?> checked="checked"<?php } ?> ?><?php echo $text_no_do_add; ?><br />
					<input type="radio" name="do_add" value="1"<?php if ($do_add) { ?> checked="checked"<?php } ?> ?><?php echo $text_yes_do_add; ?>
				</div>
			</div>
			<h3><?php echo $heading_edit_commissions; ?></h3>
			<div class="table-responsive">			
				<table class="table table-bordered table-hover" id="ctable">
					<thead>
						<tr>
							<td><?php echo $column_affiliate; ?></td>
							<td><?php echo $column_product; ?></td>
							<td><?php echo $column_commission; ?></td>
							<td>&nbsp;</td>
						</tr>
					</thead>
					<tbody>
<?php foreach ($commissions as $acommissions) { 
		foreach ($acommissions as $_i => $_product) { ?>		
<tr>
	<td><a href="<?php echo $_product['link_affiliate']; ?>" target="_blank"><?php echo $_product['affiliate_name']; ?></a>
	<?php foreach ($_product as $_k => $_v) {
		if ($_k == 'commission' || $_k == 'order_product_id') continue; ?>
	<input type="hidden" name="commissions[<?php echo $_product['affiliate_id']; ?>][<?php echo $_i; ?>][<?php echo $_k; ?>]" value="<?php echo $_v; ?>" />
	<?php } ?>
	</td>
	<td>
		<select name="commissions[<?php echo $_product['affiliate_id']; ?>][<?php echo $_i; ?>][order_product_id]" class="form-control">
		<?php foreach ($order_products as $opid => $_op) { ?>
		<option value="<?php echo $opid; ?>"<?php if ($_product['order_product_id'] == $opid) { ?> selected="selected"<?php } ?>><?php echo $_op['name']; ?> (<?php echo $_op['model']; ?>) x <?php echo $_op['quantity']; ?></option>
		<?php } ?>
		</select>		
	</td>	
	<td><input type="text" class="commission-amount form-control" name="commissions[<?php echo $_product['affiliate_id']; ?>][<?php echo $_i; ?>][commission]" value="<?php echo $_product['commission']; ?>" size="8" /></td>
	<td><button type="button" class="btn btn-default" onclick="javascript:$(this).parent().parent().remove();"><?php echo $text_remove;?></button></td>
</tr>
<?php } 
	}
?>		
			</tbody>
          </table>
		  </div>
<?php if ($added) { ?>                  
<h3><?php echo $heading_readonly_commissions; ?></h3>		
		<div class="table-responsive">
          <table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td><?php echo $column_affiliate; ?></td>
					<td><?php echo $column_product; ?></td>
					<td><?php echo $column_commission; ?></td>
					<td>&nbsp;</td>
				</tr>
			</thead>
			<tbody>
<?php
	foreach ($added as $a) { ?>
<tr>
	<td><a href="<?php echo $a[0]['link_affiliate']; ?>" target="_blank"><?php echo $a[0]['affiliate_name']; ?></a></td>
	<td>
<?php foreach ($a as $_product) { ?>
		<?php echo $_product['product_name']; ?><?php if ($_product['product_model']) { ?> (<?php echo $_product['product_model']; ?>)<?php } ?><?php if ($_product['quantity']) { ?> x <?php echo $_product['quantity']; ?><?php } ?>
<?php } ?>	
	</td>
	<td><?php echo $a[0]['commission_total']; ?></td>
	<td><span id="commission<?php echo $a[0]['affiliate_id']; ?>"><button type="button" class="btn btn-default commission-remove" data-loading-text="<?php echo $text_loading; ?>" id="commission-remove-<?php echo $a[0]['affiliate_id']; ?>"><?php echo $text_commission_remove; ?></button></span></td>
</tr>	
<?php } ?>
</table>
</div>
<div class="help"><?php echo $help_readonly_commissions; ?></span>
<?php } ?>		
</div>
      </form>
    </div>
  </div>
</div>
<div style="background-color:#efefef;border:2px solid #ababab;z-index:99999999;display:none;" id="affiliate_dt_overlay_div"><div style="text-align:right;padding-right:5px;"><a class="overlay_close"><?php echo $oy_close;?></a><div style="text-align:center;font-weight:bold;"><?php echo $oy_title;?><hr /></div><div style="height:400px;width:850px;overflow-y:auto;margin:3px;padding:5px;">
<table cellpadding="0" cellspacing="0" border="0" id="affiliate_dt">
	<thead>
		<tr>
			<th width="5%"><?php echo $oy_id;?></th>
			<th width="20%"><?php echo $oy_name;?></th>
			<th width="20%"><?php echo $oy_email;?></th>
			<th width="20%"><?php echo $oy_scheme;?></th>
			<th width="5%"><?php echo $oy_level;?></th>
			<th width="10%"><?php echo $oy_balance;?></th>			
			<th width="20%"><?php echo $oy_date_added;?></th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan="7" class="dataTables_empty"><?php echo $oy_loading;?></td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<th><?php echo $oy_id;?></th>
			<th><?php echo $oy_name;?></th>
			<th><?php echo $oy_email;?></th>
			<th><?php echo $oy_scheme;?></th>
			<th><?php echo $oy_level;?></th>
			<th><?php echo $oy_balance;?></th>			
			<th><?php echo $oy_date_added;?></th>
		</tr>
	</tfoot>
</table>
</div>
<div style="text-align:right;padding-right:5px;"><hr /><a class="overlay_close"><?php echo $oy_close;?></a></div>
</div></div>
<script type="text/javascript" src="view/javascript/jquery.migrate.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="view/javascript/jquery.tools.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {

var _aff_sizes = <?php echo $aff_sizes; ?>;
var _link_affiliate_tpl = '<?php echo $link_affiliate_tpl; ?>';
var _tr_tpl = '<tr><td><a href="{{link}}" target="_blank">{{name}}</a><input type="hidden" name="commissions[{{id}}][{{i}}][affiliate_id]" value="{{id}}" /></td><td><select name="commissions[{{id}}][{{i}}][order_product_id]" class="form-control">';
		<?php foreach ($order_products as $opid => $_op) { ?>
_tr_tpl += ' <option value="<?php echo $opid; ?>"><?php echo $_op['name']; ?> (<?php echo $_op['model']; ?>) x <?php echo $_op['quantity']; ?></option>';
		<?php } ?>
_tr_tpl += '</select></td><td><input type="text" class="commission-amount form-control" name="commissions[{{id}}][{{i}}][commission]" value="" size="8" placeholder="<?php echo $column_commission; ?>" /></td><td><button type="button" class="btn btn-default" onclick="javascript:$(this).parent().parent().remove();"><?php echo $text_remove;?></button></td></tr>';

    $('#affiliate_dt').dataTable( {
        'bProcessing': true,
        'bServerSide': true,
        'sAjaxSource': '<?php echo $link_datatable; ?>',
        'sServerMethod' : 'POST',
        'sPaginationType' : 'full_numbers',
        'iDisplayLength' : 10,
        'aoColumns': [
        		{ 'mDataProp': 'id', 'bSearchable' : false, 'bSortable' : false },
            { 'mDataProp': 'name' },
            { 'mDataProp': 'email' },
            { 'mDataProp': 'scheme', 'bSearchable' : false, 'bSortable' : false },            
            { 'mDataProp': 'level', 'bSearchable' : false},
            { 'mDataProp': 'balance', 'bSearchable' : false, 'bSortable' : false},
            { 'mDataProp': 'date_added', 'bSearchable' : false  }
        ],
		
    	'fnServerParams': function (aoData) {
			if($('#added_ids').val().length < 1) return;				
      		aoData.push({'name' : 'filter_ids', 'value' : 'exclude'});
      		aoData.push({'name' : 'ids', 'value' : $('#added_ids').val()});
    	},

        'fnDrawCallback': function() {            
            $('.affiliate_dt_row').css({'cursor' : 'pointer'});
            $('.affiliate_dt_row').click( function () {
            	$('#affiliate_dt_overlay_open').overlay().close();            	
				var _id = $(this).attr('id').split('-')[1];
				var _i = 'a'+Math.round(Math.random() * 1000000);
				var _name = $($(this).find('td')[1]).text();
				var _link = _link_affiliate_tpl.replace(/AFFID/g, _id);
				var _tpl = _tr_tpl.replace(/\{\{id\}\}/g, _id);
				_tpl = _tpl.replace(/\{\{link\}\}/g, _link);
				_tpl = _tpl.replace(/\{\{name\}\}/g, _name);
				_tpl = _tpl.replace(/\{\{i\}\}/g, _i);
				$('#ctable').append(_tpl);
			});
        }        
    });   
    
$('#affiliate_dt_overlay_open').overlay({
   	mask: {
		color: '#efefef',
        loadSpeed: 200,
        zIndex: '999999959',
        opacity: 0.9
    },
    top: 10,
    closeOnClick: false
});

$('.overlay_close').on('click', function() {
	$('#affiliate_dt_overlay_open').overlay().close();
});


$('.commission-remove').on('click', function() {
	var _this = $(this);
	var _id = $(this).attr('id').replace(/[^\d]+/g, '');
	$.ajax({
		type: 'POST',
		url: 'index.php?route=sale/order/removecommission&token=<?php echo $token; ?>&order_id=<?php echo $order_id; ?>&affiliate_id='+_id,
		dataType: 'json',
		beforeSend: function() {
			$('.success').hide();
			$('.warning').hide();		
			$(_this).button('loading');
		},
		complete: function() {
			$(_this).button('reset');
		},			
		success: function(json) {						
			if (json['error']) {
				$('#error-warning').html(json['error']);
				$('.warning').fadeIn('slow');
			} else {
				document.location.reload();			
			}
		}
	});
});
});
</script></div>
<?php echo $footer; ?>
