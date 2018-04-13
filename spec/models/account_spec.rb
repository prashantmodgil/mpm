require 'rails_helper'
it {s is_expected.to validate_presence_of(:user_id) }
RSpec.describe  Account, type: "model" do
   it { is_expected.to validate_presence_of(:name) }
   it "shold return all the accounts of current user" do
        user = User.create(email: "pr@gmail" , password: "123456")
        a = []
        a << Account.create(name: "aa", user_id: user.id)
        a << Account.create(name: "aaa", user_id: user.id)
        ac = Account.current_user_accounts(user)
        expect(a).to eq(ac)
      end

    it "shold not return all the accounts of current user (failiure case)" do
         user = User.create(email: "pr@gmail" , password: "123456")
         user2 = User.create(email: "vansh@abc", password: "123456789")
         a = []
         a << Account.create(name: "aa", user_id: user.id)
         a << Account.create(name: "aaa", user_id: user2.id)
         ac = Account.current_user_accounts(user)
         expect(a).to not_equal(ac)
       end
end
