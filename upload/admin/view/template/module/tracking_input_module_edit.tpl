<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-carousel" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-carousel" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[name]" value="<?php echo $module['name']; ?>" placeholder="<?php echo $entry_name; ?>" id="input-module-name" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-language"><?php echo $entry_language; ?></label>
            <div class="col-sm-10">
				<select name="tracking_input_module[language_id]" class="form-control" id="input-module-language">
				 <?php foreach($languages as $language) { ?>
					<option value="<?php echo $language['language_id']; ?>"<?php if($module['language_id'] == $language['language_id']) { ?> selected="selected"<?php } ?>><?php echo $language['name'];?></option>
                  <?php } ?>
                </select>
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-text"><?php echo $entry_text; ?></label>
            <div class="col-sm-10">				
              <textarea name="tracking_input_module[text]" placeholder="<?php echo $entry_text; ?>" id="input-module-text" class="form-control"><?php echo $module['text']; ?></textarea>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-text-heading"><?php echo $entry_text_heading; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[text_heading]" value="<?php echo $module['text_heading']; ?>" placeholder="<?php echo $entry_text_heading; ?>" id="input-module-text-heading" class="form-control" />
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-text-thankyou"><?php echo $entry_text_thankyou; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[text_thankyou]" value="<?php echo $module['text_thankyou']; ?>" placeholder="<?php echo $entry_text_thankyou; ?>" id="input-module-text-thankyou" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-button"><?php echo $entry_button; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[button]" value="<?php echo $module['button']; ?>" placeholder="<?php echo $entry_button; ?>" id="input-module-button" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-error-message"><?php echo $entry_error_message; ?></label>
            <div class="col-sm-10">
              <input type="text" name="tracking_input_module[error_message]" value="<?php echo $module['error_message']; ?>" placeholder="<?php echo $entry_error_message; ?>" id="input-module-error-message" class="form-control" />
            </div>
          </div>		  
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-module-template"><?php echo $entry_head_template; ?></label>
            <div class="col-sm-10">
				<select name="tracking_input_module[template]" class="form-control" id="input-module-template">				 
				 <?php foreach($templates as $tpl) { ?>
					<option value="<?php echo $tpl; ?>"<?php if ($module['template'] == $tpl) { ?> selected="selected"<?php } ?>><?php echo $templates_display[$tpl]; ?></option>
                  <?php } ?>
                </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_module_status; ?></label>
            <div class="col-sm-10">
              <select name="tracking_input_module[status]" id="input-status" class="form-control">
                <?php if ($module['status']) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>		  
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>