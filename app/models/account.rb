class Account < ApplicationRecord
  validates :name, presence: true
  validates :user_id, presence: true
  has_many :comments, as: :commentable
  #validates [:name , :user_id] , unique: true
  def self.current_user_accounts(current_user)
    Account.where(user_id: current_user.id)
  end

   # def self.member_accounts(current_user)
   #   User.where(id: (Invitation.select_mem_id(current_user)))
   # end
end
