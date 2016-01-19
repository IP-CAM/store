<div class="form-group required">
  <div class="col-sm-offset-2 col-sm-10">
                  <div class="form-group">
                    <div class="col-sm-12">
                     <?php if ((in_array('review', (array)$config_captcha_page)) && (in_array('askaquestion', (array)$config_captcha_page))) { ?>
						<script type="text/javascript">
						  var verifyCallback = function(response) {
							alert(response);
						  };
						  var widgetId1;
						  var widgetId2;
						  var onloadCallback = function() {
							widgetId1 = grecaptcha.render('reviewrecaptcha', {
							  'sitekey' : '<?php echo $site_key; ?>',
							});
							widgetId2 = grecaptcha.render('askquestionrecaptcha', {
							  'sitekey' : '<?php echo $site_key; ?>',
							});
						  };
						</script>
                     <?php } else { ?>
						<script type="text/javascript">
						  var verifyCallback = function(response) {
							alert(response);
						  };
						  var widgetId1;
						  var onloadCallback = function() {
							widgetId1 = grecaptcha.render('reviewrecaptcha', {
							  'sitekey' : '<?php echo $site_key; ?>',
							});
						  };
						</script>
                     <?php } ?>
						<div id="reviewrecaptcha"></div>
						<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
                    </div>
                  </div>
  </div>
</div>
