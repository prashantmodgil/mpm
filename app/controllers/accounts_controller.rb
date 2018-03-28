class AccountsController < ApplicationController
  before_action :authenticate_user!

  def index
  #collective accounts of a perticualr user of whome he is admin
  @accounts = Account.where(user_id: current_user.id)
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

  end
  private
    def account_params
      params.require(:account).permit(:name,:user_id)
    end
end
