class InvitationsController < ApplicationController
  def new
    @invitation =Invitation.new
  end
  def create
    @invitation = Invitation.params(invite_paramas)
  end
private
def invite_parasms
   params.require(:invitation).permit(:invite_email,:acc_id,:mem_id)
end
