class Invitation < ApplicationRecord
  before_create :generate_token
  def self.current_user_invitation(current_user)
    Invitation.where(mem_id: current_user.id).pluck(:acc_id)
  end
  def self.select_mem_id(account_id)
    Invitation.where(acc_id: account_id).pluck(:mem_id)
  end
  
  def generate_token
  self.token = Digest::SHA1.hexdigest([Time.now, rand].join).to_s
 end
end
