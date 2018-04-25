class InvitationsController < ApplicationController
#  before_action :authenticate_user!, :except => [:index]
  def create
    begin
      if params[:invitation][:invite_email] != current_user.email
      email = params[:invitation][:invite_email]
      @user = User.where(email: email)
      if @user.present?
        @invitation = Invitation.create!(acc_id: params[:acc_id],mem_id: @user.id,invite_email: @user.email)
      else
        @invitation = Invitation.create!(acc_id: params[:acc_id],invite_email: params[:invitation][:invite_email])
      end
    end
    InvitationMailer.invitation_mail(params[:invitation][:invite_email],Account.find(params[:acc_id].to_i).name,@invitation.token).deliver_now
      redirect_to account_path(params[:acc_id]),notice: "Invitation has sent to #{params[:invitation][:invite_email]}"
      rescue Exception => e
      redirect_to account_path(params[:acc_id]),notice: "Something went wrong as #{e.message}"
    end
  end

  def user_check
    token = params[:token]
    @invitation = Invitation.find_by_token(token)
    if @invitation.present?
      if @invitation.mem_id == nil
        redirect_to new_user_registration_path(token: @invitation.token)
      else
        redirect_to account_path(@invitation.acc_id, token:@token),notice: "Invitation Successfully join"
      end
    else
    end
  end
end
