require 'rails_helper'

RSpec.describe  Invitation, type: "model" do
  it "should return current user invitations" do
    user = User.create(email: "pr@gmail" , password: "123456")
    invitation1 = Invitation.create(mem_id: user.id, acc_id: 2, invite_email: user.email)
    invitation2 = Invitation.create(mem_id: user.id, acc_id: 7,invite_email: user.email)
    invitation3 = Invitation.create(mem_id: user.id, acc_id: 4,invite_email: user.email)
    inn = Invitation.where(mem_id: user.id).pluck(:acc_id)
    inv = Invitation.current_user_invitation(user)
    expect(inn).to eq(inv)
  end

  it "should not return current user invitations if member id not current user" do
    user = User.create(id: 2 ,email: "pra@gmail" , password: "123456")
    invitation1 = Invitation.create(mem_id: (~user.id).abs, acc_id: 2,invite_email: user.email)
    invitation2 = Invitation.create(mem_id: (~user.id).abs, acc_id: 7,invite_email: user.email)
    invitation3 = Invitation.create(mem_id: (~user.id).abs, acc_id: 4,invite_email: user.email)
    #@inn = Invitation.select(:acc_id).where(mem_id: (~user.id).abs)
    inn = Invitation.where(mem_id: (~user.id).abs).pluck(:acc_id)
    inv = Invitation.current_user_invitation(user)
    expect(inv).to_not eq(inn)
  end

  it "should return members of current account" do
    user1 = User.create(email: "pras@gmail" , password: "123456")
    user2 = User.create(email: "prash@gmail" , password: "123456")
    user3 = User.create(email: "prasha@gmail" , password: "123456")
    account1 = Account.create(id: 1,name: account1 ,user_id: user1.id)
    invitation1 = Invitation.create(mem_id: 2, acc_id: account1.id,invite_email: user1.email)
    invitation2 = Invitation.create(mem_id: 3, acc_id: account1.id,invite_email: user2.email)
    invitation3 = Invitation.create(mem_id: 4, acc_id: account1.id,invite_email: user3.email)
  #  @inn = Invitation.select(:mem_id).where(acc_id: account1.id)

    inn = Invitation.where(acc_id: account1.id).pluck(:mem_id)
    inv = Invitation.select_mem_id(account1)
    expect(inn).to eq(inv)
  end
  it "should not return members of another account" do
    user1 = User.create(email: "pras@gmail" , password: "123456")
    user2 = User.create(email: "prash@gmail" , password: "123456")
    user3 = User.create(email: "prasha@gmail" , password: "123456")
    account1 = Account.create(id: 1,name: account1 ,user_id: user1.id)
    invitation1 = Invitation.create(mem_id: 2, acc_id: account1.id,invite_email: user1.email)
    invitation2 = Invitation.create(mem_id: 3, acc_id: account1.id,invite_email: user2.email)
    invitation3 = Invitation.create(mem_id: 4, acc_id: account1.id,invite_email: user3.email)
    @inn = Invitation.select(:mem_id).where(acc_id: ~account1.id)
    inv = Invitation.select_mem_id(account1)
    expect(@inn).to_not eq(inv)
  end
end
