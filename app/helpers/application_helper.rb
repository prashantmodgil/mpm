module ApplicationHelper
  def get_email(token)
    Invitation.find_by_token(token).invite_email
  end
end
