class InvitationMailer < ApplicationMailer
  default from: 'prashantdevelop@gmail.com'

  def invitation_mail(url,email,account_name)
    @url = "http://192.168.3.3:3000" + url
    @email = email
    @account_name = account_name
    mail(to: email, subject: "Invitation for #{account_name}")
  end
end
