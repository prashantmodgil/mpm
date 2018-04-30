class User < ApplicationRecord
  attr_accessor :name, :token
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   after_create :account_create

  private
  def account_create

    if  token != ''
    #  update_invitation
      Invitation.where(token: self.token).where(invite_email: self.email).update(mem_id: self.id)
    else
    #  create_new_account
      Account.create(name: name, user_id: self.id)
    end
  end

end
