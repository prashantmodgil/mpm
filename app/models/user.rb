class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   after_create :account_create
  attr_accessor :name,:invitation_id

  private
  def account_create
    #not null
    if self.invitation_id != ''
    #  update_invitation
      Invitation.where(id: self.invitation_id).where(invite_email: self.email).last.update(mem_id: self.id)
    else
    #  create_new_account
      Account.create(name: name, user_id: self.id)
    end
  end

end
