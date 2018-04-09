class Account < ApplicationRecord
  def self.current_user_accounts(current_user)
    Account.where(user_id: current_user.id)
  end

end
