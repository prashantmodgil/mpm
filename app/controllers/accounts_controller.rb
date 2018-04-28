class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
  @accounts = Account.current_user_accounts(current_user)
  @aa = Account.where(id: Invitation.current_user_invitation(current_user))
   #@aa = Account.member_accounts(current_user.id)
  end

  def new
    @account =Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id

    if @account.save
      redirect_to '/accounts'
    else
      redirect_to '/accounts/new'
    end
  end

  def show
    @account = Account.find(params[:id])
    authorize @account
    @invitation =Invitation.new
    @members = User.where(id: Invitation.select_mem_id(params[:id])).to_a
    @team = Team.new
  end

  private
    def account_params
      params.require(:account).permit(:name,:user_id)
    end
end
