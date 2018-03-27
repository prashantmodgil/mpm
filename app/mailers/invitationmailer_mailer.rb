class InvitationmailerMailer < ApplicationMailer
  default from: '@user.email'

  def welcome_email
    @user = params[:id]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'new account invitaion')
  end
end
