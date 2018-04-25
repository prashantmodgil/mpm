class Account < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true
  #validates [:name , :user_id] , unique: true
  def self.current_user_accounts(current_user)
    Account.where(user_id: current_user.id)
  end

  # def account_added_users
  #   User.where(id: Invitation.select_mem_id([:id]))
  # end
end
