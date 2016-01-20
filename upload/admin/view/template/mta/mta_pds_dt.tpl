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
<?php if ($show_save_button) { ?>
<div style="text-align:center;"><hr /><input type="button" id="affiliate_dt_save_button" value="" /></div>
<?php } ?>
<div style="text-align:right;padding-right:5px;"><hr /><a class="overlay_close"><?php echo $oy_close;?></a></div>
</div>
<script type="text/javascript">
TEXT_NONE_MTA = '<?php echo mta_jsstr($text_none); ?>';
</script>
<?php if ($add_js) { ?>
<script type="text/javascript" src="view/javascript/mta/<?php echo $add_js; ?>.js"></script>
<?php } ?>
<?php if ($add_jsp) { ?>
<script type="text/javascript" src="<?php echo $add_jsp; ?>"></script>
<?php } ?>