class InvitationsController < ApplicationController
#  before_action :authenticate_user!, :except => [:index]
  # def new
  #   @invitation =Invitation.new
  # end

  def show
  #   id = params[:id]
  #   @invitation = Invitation.find(id)
  #   if @invitation.present?
  #     #redirect to invitation path
  #     if @invitation.mem_id == nil
  #       #if the member_id is nil in invitationtable send email and invitation id as params
  #       redirect_to new_user_registration_path(email: @invitation.invite_email,invitation_id: @invitation.id)
  #
  #     else
  #       #if member_id is present send invitation account id
  #       redirect_to account_path(@invitation.acc_id),notice: "Invitation Successfully join"
  #     end
  #   else
  #   end
   end
  def create
    #using exception handling
    begin
      #assigning invite email from invitatiion hash to variable email
      if params[:invitation][:invite_email] != current_user.email
      email = params[:invitation][:invite_email]
      @user = User.find_by_email(email)
      if @user.present?
        #if user present create inviatation with the parameters assignmenet
        @invitation = Invitation.create!(acc_id: params[:acc_id],mem_id: @user.id,invite_email: @user.email)
        debugger
      else
        #if user not present then insert in account id and invite email feild
        @invitation = Invitation.create!(acc_id: params[:acc_id],invite_email: params[:invitation][:invite_email])
        debugger
      end
    end
      #logic for sending emailinvitation_path(@invitation.id)
      #invitation path of that inviatation i.e. url,emailand account name

      #InvitationMailer.invitation_mail(invitation_path(@invitation.id),params[:invitation][:invite_email],Account.find(params[:acc_id].to_i).name).deliver_now

      InvitationMailer.invitation_mail("#{user_check_path}?=",params[:invitation][:invite_email],Account.find(params[:acc_id].to_i).name,@invitation.token).deliver_now
      #if sent sucess message else will go to rescue meathod
      redirect_to account_path(params[:acc_id]),notice: "Invitation has sent to #{params[:invitation][:invite_email]}"
      rescue Exception => e
      #will show exception message againts message
      redirect_to account_path(params[:acc_id]),notice: "Something went wrong as #{e.message}"
    end
  end




  def user_check
    #id = params[:id]

    @invitation = Invitation.find(@token)
    debugger
    if @invitation.present?
      #redirect to invitation path
      if @invitation.mem_id == nil
        #if the member_id is nil in invitationtable send email and invitation id as params
        redirect_to new_user_registration_path(email: @invitation.invite_email,invitation_id: @invitation.id)

      else
        #if member_id is present send invitation account id
        redirect_to account_path(@invitation.acc_id),notice: "Invitation Successfully join"
      end
    else
    end
  end
  # private
  # def invite_params
  #    params.require(:invitation).permit(:invite_email,:acc_id)
  # end
end
