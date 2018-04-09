class Invitation < ApplicationRecord
  def self.current_user_invitation(current_user)
    Invitation.select(:acc_id).where(mem_id: current_user.id)
  end
  def self.select_mem_id(account_id)
    Invitation.select(:mem_id).where(acc_id: account_id)
  end
  def self.current_account_mem_id(account_id)
  Invitation.select(:mem_id).where(acc_id: account_id)
  end
  
end
