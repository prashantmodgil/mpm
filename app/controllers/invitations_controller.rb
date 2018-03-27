class InvitationsController < ApplicationController
  def new
    #@invitation =Invitation.new
  end

  def show
    id = params[:id]
    @invitation = Invitation.find(id)
    if @invitation.present?
      if @invitation.mem_id == nil
        redirect_to new_user_registration_path(email: @invitation.invite_email,invitation_id: @invitation.id)
      else
        redirect_to account_path(@invitation.acc_id),notice: "Invitation Successfully Accepted"
      end
    else
    end
  end
  def create
    begin
      email = params[:invitation][:invite_email]
      @user = User.find_by_email(email)
      if @user.present?
        @invitation = Invitation.create!(acc_id: params[:acc_id],mem_id: @user.id,invite_email: @user.email)
      else
        @invitation = Invitation.create!(acc_id: params[:acc_id],invite_email: params[:invitation][:invite_email])
      end
      InvitationMailer.invitation_mail(invitation_path(@invitation.id),params[:invitation][:invite_email],Account.find(params[:acc_id].to_i).name).deliver_now
      redirect_to account_path(params[:acc_id]),notice: "Invitation has sent to #{params[:invitation][:invite_email]}"
    rescue Exception => e
      redirect_to account_path(params[:acc_id]),notice: "Something went wrong as #{e.message}"
    end
  end
  # private
  # def invite_params
  #    params.require(:invitation).permit(:invite_email,:acc_id)
  # end
end
