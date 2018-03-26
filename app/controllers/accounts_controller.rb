class AccountsController < ApplicationController
  #before_action :authenticate_user!
  def new
    #@account =Account.new
  end
  def create
    byebug
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    @account.save
    byebug
  end
  private
    def account_params
      params.require(:account).permit(:name,:user_id)
      byebug
    end
end
