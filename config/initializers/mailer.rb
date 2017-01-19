Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
  address:              Rails.application.secrets.smtp_host,
  port:                 Rails.application.secrets.smtp_port,
  domain:               'example.com',
  user_name:            Rails.application.secrets.smtp_user,
  password:             Rails.application.secrets.smtp_password,
  authentication:       'plain',
  enable_starttls_auto: true  
}
