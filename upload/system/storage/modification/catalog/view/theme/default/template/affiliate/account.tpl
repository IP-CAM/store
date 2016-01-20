<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2><?php echo $text_my_account; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
	
			
	  <?php //+mod by yp start
			if ($accc) { ?>
	  <li><a href="<?php echo $affiliate_info; ?>"><?php echo $text_affiliate_info; ?></a></li>
	  <li><a href="<?php echo $customer_account; ?>"><?php echo $text_customer_account; ?></a></li>
	  <?php } else { ?>
	  

        <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
	
			
	  <?php } //+mod by yp end
	  ?>
	  

      </ul>
      <h2><?php echo $text_my_tracking; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
      </ul>
      <h2><?php echo $text_my_transactions; ?></h2>
      <ul class="list-unstyled">
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      </ul>


	<?php /* //+mod by yp start */ ?>
	<h2><?php echo $text_signup_link; ?></h2>
	<ul class="list-unstyled">	
		<li><strong><?php echo $signup_link;?></strong><br />
		<?php echo $text_aff_link_any_page;?></li>
	</ul>
	<?php if($show_downline) {?>
	<div class="list-unstyled">
		<ul>
			<li><a href="<?php echo $link_affiliate_downline; ?>"><?php echo $text_affiliate_downline; ?></a></li>
		</ul>
	</div>
	<?php }
	/* //+mod by yp end */ ?>
	

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>