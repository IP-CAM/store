<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
<div style="float:right;border:1px solid #aba;width:30%;padding-left:10px;padding-right:20px">
<h3><u><?php echo $text_legend;?></u></h3>
<b><?php echo $text_abbr_te;?></b> - <?php echo $text_te;?><br />
<b><?php echo $text_abbr_elm;?></b> - <?php echo $text_elm;?><br />
</div>
<ul class="tree">
	<li>(<a href="javascript:;" rel="<?php echo $aff_id; ?>" class="load_subs" title="Expand"><?php echo $top_count;?></a>)  <b><?php echo $text_shop;?></b><img src="view/image/loading.gif" class="loading" style="display:none;"/></li>
</ul>
	</div>
  </div>
 </div>
<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '.load_subs', function() {
		var _p = $(this).parent();
		var _this = $(this);
		if($(_p).find('ul').length < 1) {
			$(_p).find('.loading').show();
			$.ajax({
				url: document.location.href.replace('mta/affiliate_downline', 'mta/affiliate_downline/l')+'&affiliate_id='+$(_this).attr('rel'), 
				dataType: 'json',
				success: function(_r) {
					$(_p).append('<ul></ul>');
					for(var i = 0; i < _r.length; i++) {
						var _li = '<li>(';
						if(_r[i].c > 0) _li += '<a href="javascript:;" class="load_subs" rel="'+_r[i].affiliate_id+'" title="Expand">';
						_li += _r[i].c;
						if(_r[i].c > 0) _li += '</a>'
						_li += ') <a href="<?php echo $link;?>&affiliate_id='+_r[i].affiliate_id+'" class="aff_name" style="text-decoration:none;color:'+(_r[i].mlm_type > 0 ? 'red' : 'blue')+'" target="_blank">'+_r[i].name+'</a> <a href="mailto:'+_r[i].email+'" style="color:#121;">'+_r[i].email+'</a> '+_r[i].telephone+' <span class="help">';
						_li += '<?php echo $text_abbr_te;?>: ' + _r[i].e_te + ' / ' + '<?php echo $text_abbr_elm;?>: ' + _r[i].e_elm;
						_li += '</span> </li>';
						$(_p).find('ul').append(_li);
					}
					$(_p).find('.loading').hide();
				}
				});
		} else {
			$($(_p).find('ul')[0]).toggle();
		}
	});
}
);
</script>
<?php echo $footer; ?>
