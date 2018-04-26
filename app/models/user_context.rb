class UserContext
  attr_reader :user, :account
  def initialize(current_user, current_account)
    @user = current_user
    @account = current_account
  end
end
