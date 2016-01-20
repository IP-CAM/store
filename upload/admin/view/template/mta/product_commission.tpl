<div class="form-group">
	<label class="col-sm-2 control-label" for="input-product-scheme-id"><?php echo $entry_product; ?></label>
	<div class="col-sm-10">
		<select name="product_scheme_id" class="form-control" id="input-product-scheme-id">
		<?php foreach($schemes0 as $_sid => $_sname) { ?>
			<option value="<?php echo $_sid; ?>"<?php if($_sid == $product_scheme_id) { ?> selected="selected"<?php } ?>><?php echo $_sname; ?></option>
		<?php } ?>
		</select>
	</div>
</div>
<div style="padding:5px;"><a id="product_affiliates_link" href="javascript:;"><?php echo $text_aff_schemes; ?></a>
	<?php foreach($schemes as $_sid => $_sname) { ?>
	<input type="hidden" id="product_affiliates_<?php echo $_sid; ?>" name="_product_affiliates[<?php echo $_sid; ?>]" value="" />
	<?php } ?>
</div>
<h4><?php echo $entry_coupons; ?></h4>

<table class="table table-striped">
	<thead>
		<tr>
			<td class="text-right"><?php echo $column_coupon; ?></td>
			<td class="text-left"><?php echo $column_mta_scheme; ?></td>
		</tr>
	</thead>
	<tbody>
	<?php foreach($coupons as $coupon) { ?>
		<tr>
			<td class="text-right"><?php echo $coupon['description']; ?></td>
			<td class="text-left">				
					<select name="product_coupon_scheme_id[<?php echo $coupon['id']; ?>]" class="form-control">
					<?php foreach($schemes0 as $_sid => $_sname) { ?>
						<option value="<?php echo $_sid; ?>"<?php if($_sid == $coupon['scheme_id']) { ?> selected="selected"<?php } ?>><?php echo $_sname; ?></option>
					<?php } ?>
					</select>					
				<div style="padding:5px;"><a id="product_coupon_<?php echo $coupon['id']; ?>_affiliates_link" href="javascript:;"><?php echo $text_aff_schemes; ?></a>
				<?php foreach($schemes as $_sid => $_sname) { ?>
					<input type="hidden" id="product_coupon_<?php echo $coupon['id']; ?>_affiliates_<?php echo $_sid; ?>" name="_product_coupon_affiliates[<?php echo $coupon['id']; ?>][<?php echo $_sid; ?>]" value="" />
				<?php } ?>
				</div>								
			</td>
		</tr>
	<?php } ?>
	<?php if ($pagination) { ?>
		<tr><td colspan="2" class="text-right"><?php echo $pagination; ?></td></tr>
	<?php } ?>
	</tbody>
</table>
<script type="text/javascript">
$('a[id$="_affiliates_link"]')._make_aff_table();
$('.coupon-page-link').on('click', function() {
	var _page = parseInt($(this).attr('rel'));
	$.ajax({
		url : '<?php echo $link_commission_tab; ?>&coupon_page='+_page,
		method : 'GET',
		dataType : 'html',
		success : function(_r) {
			$('#tab-scheme').html(_r);
		}
	});
});
</script>