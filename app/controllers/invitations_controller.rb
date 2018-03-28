class InvitationsController < ApplicationController
  def new
    #@invitation =Invitation.new
  end

  def show
    id = params[:id]
    @invitation = Invitation.find(id)
    if @invitation.present?
      #redirect to invitation path
      if @invitation.mem_id == nil
        #if the member_id is nil in invitationtable send email and invitation id as params
        redirect_to new_user_registration_path(email: @invitation.invite_email,invitation_id: @invitation.id)
      else
        #if member_id is present send invitatuon account id
        redirect_to account_path(@invitation.acc_id),notice: "Invitation Successfully Joined"
      end
    else
    end
  end
  def create
    #using exception handling
    begin
      #assigning invite email from invitatiion hash to variable email
      email = params[:invitation][:invite_email]
      @user = User.find_by_email(email)
      if @user.present?
        #if user present create inviatation with the parameters assignmenet
        @invitation = Invitation.create!(acc_id: params[:acc_id],mem_id: @user.id,invite_email: @user.email)
      else
        #if user not present then insert in account id and invite email feild
        @invitation = Invitation.create!(acc_id: params[:acc_id],invite_email: params[:invitation][:invite_email])
      end

      #logic for sending email
      #invitation path of that inviatation id,invite email,accountid
      InvitationMailer.invitation_mail(invitation_path(@invitation.id),params[:invitation][:invite_email],Account.find(params[:acc_id].to_i).name).deliver_now
      #if sent sucess message else will go to rescue meathod
      redirect_to account_path(params[:acc_id]),notice: "Invitation has sent to #{params[:invitation][:invite_email]}"
    rescue Exception => e
      #will show exception message againts message
      redirect_to account_path(params[:acc_id]),notice: "Something went wrong as #{e.message}"
    end
  end
  # private
  # def invite_params
  #    params.require(:invitation).permit(:invite_email,:acc_id)
  # end
end