class AccountsController < ApplicationController
  before_action :authenticate_user!
  def index
  @accounts = current_user.accounts.all
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
  private
    def account_params
      params.require(:account).permit(:name,:user_id)
    end
end
