<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-tracking-discount" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-tracking-discount" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-amount"><?php echo $entry_amount; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_discount_amount" value="<?php echo $tracking_discount_amount; ?>" placeholder="<?php echo $entry_amount; ?>" id="input-amount" class="form-control" size="8" />
            </div>
          </div>
          <div class="form-group">		  
            <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
            <div class="col-sm-10">
              <select name="tracking_discount_type" id="input-type" class="form-control">
                                <?php if ($tracking_discount_type == 'percent') { ?>
                                    <option value="percent" selected="selected"><?php echo $text_percent; ?></option>
                                    <option value="fixed"><?php echo $text_fixed; ?></option>
                                <?php } else { ?>
                                    <option value="percent"><?php echo $text_percent; ?></option>
                                    <option value="fixed" selected="selected"><?php echo $text_fixed; ?></option>
                                <?php } ?>
              </select>
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fixed-max"><span data-toggle="tooltip" title="<?php echo $help_fixed_max; ?>"><?php echo $entry_fixed_max; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_discount_fixed_max" value="<?php echo ($tracking_discount_fixed_max ? $tracking_discount_fixed_max : 50); ?>" placeholder="50" id="input-fixed-max" class="form-control" size="8" />
            </div>
          </div>
          <div class="form-group">		  
            <label class="col-sm-2 control-label" for="input-fixed-per-item"><span data-toggle="tooltip" title="<?php echo $help_fixed_per_item; ?>"><?php echo $entry_fixed_per_item; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_discount_fixed_per_item" id="input-fixed-per-item" class="form-control">
                                <?php if ($tracking_discount_fixed_per_item) { ?>
                                    <option value="0"><?php echo $text_no; ?></option>
                                    <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                                <?php } else { ?>
                                    <option value="0" selected="selected"><?php echo $text_no; ?></option>								
                                    <option value="1"><?php echo $text_yes; ?></option>
                                <?php } ?>
              </select>
            </div>
          </div>	

          <div class="form-group">		  
            <label class="col-sm-2 control-label" for="input-apply-to"><?php echo $entry_apply_to; ?></label>
            <div class="col-sm-10">
              <select name="tracking_discount_apply_to" id="input-apply-to" class="form-control">
				<option value="a"<?php if (!$tracking_discount_apply_to || $tracking_discount_apply_to == 'a') { ?> selected="selected"<?php } ?>><?php echo $text_affiliates; ?></option>
				<option value="m"<?php if ($tracking_discount_apply_to == 'm') { ?> selected="selected"<?php } ?>><?php echo $text_marketing_campaigns; ?></option>				
				<option value="am"<?php if ($tracking_discount_apply_to == 'am') { ?> selected="selected"<?php } ?>><?php echo $text_both; ?></option>
              </select>
            </div>
          </div>
		  
          <div class="form-group">		  
            <label class="col-sm-2 control-label" for="input-when"><span data-toggle="tooltip" title="<?php echo $help_when; ?>"><?php echo $entry_when; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_discount_when" id="input-when" class="form-control">
							<?php foreach(array('all', 'first', 'period') as $_when) {
								if ($tracking_discount_when == $_when) { ?>
                                    <option value="<?php echo $_when; ?>" selected="selected"><?php echo ${'text_when_' . $_when}; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $_when; ?>"><?php echo ${'text_when_' . $_when}; ?></option>
                                <?php } 
								} ?>
              </select>
            </div>
          </div>		  		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-period"><span data-toggle="tooltip" title="<?php echo $help_period; ?>"><?php echo $entry_period; ?></span></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_discount_period" value="<?php echo $tracking_discount_period; ?>" placeholder="7" id="input-period" class="form-control" size="8" />
            </div>
          </div>
          <div class="form-group">		  
            <label class="col-sm-2 control-label" for="input-what"><span data-toggle="tooltip" title="<?php echo $help_what; ?>"><?php echo $entry_what; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_discount_what" id="input-what" class="form-control">
							<?php foreach(array('total', 'all_all', 'all_one', 'min_all', 'min_one', 'max_all', 'max_one') as $_what) {
								if ($tracking_discount_what == $_what) { ?>
                                    <option value="<?php echo $_what; ?>" selected="selected"><?php echo ${'text_what_' . $_what}; ?></option>
                                <?php } else { ?>
                                    <option value="<?php echo $_what; ?>"><?php echo ${'text_what_' . $_what}; ?></option>
                                <?php } 
								} ?>
              </select>
            </div>
          </div>		  		  
          <div class="form-group">		  
            <label class="col-sm-2 control-label" for="input-no-coupon"><span data-toggle="tooltip" title="<?php echo $help_no_coupon; ?>"><?php echo $entry_no_coupon; ?></span></label>
            <div class="col-sm-10">
              <select name="tracking_discount_no_coupon" id="input-no-coupon" class="form-control">
                                <?php if (!$tracking_discount_no_coupon) { ?>
                                    <option value="0" selected="selected"><?php echo $text_yes; ?></option>
                                    <option value="1"><?php echo $text_no; ?></option>
                                <?php } else { ?>
                                    <option value="0"><?php echo $text_yes; ?></option>
                                    <option value="1" selected="selected"><?php echo $text_no; ?></option>
                                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="tracking_discount_status" id="input-status" class="form-control">
                <?php if ($tracking_discount_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_discount_sort_order" value="<?php echo $tracking_discount_sort_order; ?>" placeholder="2" id="input-sort-order" class="form-control" />
            </div>
          </div>		  
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
