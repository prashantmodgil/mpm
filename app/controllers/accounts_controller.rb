class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
  #collective accounts of a perticualr user of whome he is admin
  #@accounts = Account.where(user_id: current_user.id)
     @accounts = Account.current_user_accounts(current_user)
  #stores all accounts in variable for current user
  #@invitation_acc = Invitation.select(:acc_id).where(mem_id: current_user.id)
      #@invitation_acc = Invitation.current_user_invitation(current_user)
  @aa = Account.where(id: Invitation.current_user_invitation(current_user))
#  @aa = Account.member_acc(current_user)
  end

  def new
    #declaring new insatnce variable
    @account =Account.new
  end

  def create
    #assing diffrent parameters to insatnce variable
    @account = Account.new(account_params)
    #assigning current user_id to account user_id
    @account.user_id = current_user.id

    #redirection path
    if @account.save
      #all accounts of a user
      redirect_to '/accounts'
    else
      #add new account page
      redirect_to '/accounts/new'
    end
  end

  def show
    #to show perticular account number
    @account = Account.find(params[:id])
    #declaring insatnce variable for invitation
    @invitation =Invitation.new
    #@temp = Invitation.select(:mem_id).where(acc_id: params[:id])
    @temp = Invitation.select_mem_id(params[:id])  
    @members = User.where(id: @temp)
    @team = Team.new

  end
  private
    def account_params
      params.require(:account).permit(:name,:user_id)
    end
end
