ActionMailer::Base.smtp_settings = {
  domain: 'https://odin-flight-booker-wes.herokuapp.com/',
  address:        "smtp.sendgrid.net",
  port:            587,
  authentication: :plain,
  user_name:      'apikey',
  password:       ENV['SENDGRID_API_KEY']
}