<?php
class ModelCatalogAskquestion extends Model {
	public function addAskquestion($product_id, $data) {
			$this->load->model('catalog/product');
			$product_info = $this->model_catalog_product->getProduct($product_id);
			$subject = sprintf($this->language->get('text_subject_e_ask'), html_entity_decode($data['name1'], ENT_QUOTES, 'UTF-8'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8'));
			$message  = sprintf($this->language->get('text_product_e_ask'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_url_e_ask'), html_entity_decode($this->url->link('product/product', '&product_id=' . $this->db->escape(html_entity_decode($product_info['product_id']))))) . "\n\n";
			$message .= sprintf($this->language->get('text_name_e_ask'), html_entity_decode($data['name1'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_email_e_ask'), html_entity_decode($data['email1'], ENT_QUOTES, 'UTF-8')) . "\n\n\n";
			$message .= $this->language->get('text_question_e_ask') . "\n\n";
			$message .= html_entity_decode($data['text1'], ENT_QUOTES, 'UTF-8') . "\n\n";
			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom(html_entity_decode($data['email1']));
			$mail->setSender(html_entity_decode($data['name1'], ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();
			$emails = explode(',', $this->config->get('config_mail_alert'));
			foreach ($emails as $email) {
				if ($email && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
	}
}