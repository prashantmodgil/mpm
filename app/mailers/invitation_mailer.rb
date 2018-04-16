class InvitationMailer < ApplicationMailer
  default from: 'prashantdevelop@gmail.com'

  def invitation_mail(url,email,account_name,token)
    @url = "http://192.168.3.3:3000" + url + token
    @email = email
    @account_name = account_name
    @token = token
    mail(to: email, subject: "Invitation for #{account_name}")
  end
end
