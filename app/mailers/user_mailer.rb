class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  SENDEMAIL = "mobby@mobbyart.com"
   def contact_email(params)
   	@params = params
    # @user = user
    # @url  = 'http://example.com/login'
    mail(to:SENDEMAIL, subject: 'Contact Mail')
  end
end
