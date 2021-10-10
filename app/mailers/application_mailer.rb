class ApplicationMailer < ActionMailer::Base
  default from: ENV['SEND_MAIL']
  default to: ENV['SEND_MAIL']
  layout 'mailer'
end
