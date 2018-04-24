class InvitationMailer < ApplicationMailer
  default from: 'prashantdevelop@gmail.com'

  def invitation_mail(email,account_name,token)
    @email = email
    @account_name = account_name
    @token = token
    mail(to: email, subject: "Invitation for #{account_name}")
  end
end
