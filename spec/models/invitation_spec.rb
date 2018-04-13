require 'rails_helper'
RSpec.describe  Invitation, type: "model" do
  it "should return current user invitations" do
    user = User.create(email: "pr@gmail" , password: "123456")
    debugger
    invitation = Invitation.create (mem_id: user.id, acc_id: "2")
    i = []
    i << Invitation.select(:acc_id).where(mem_id: user.id)
    inv = current_user_invitation(user)
          expect(i).to eq(inv)
  end
end
