 require 'rails_helper'
 RSpec.describe User, type: "model" do
  it "Allows creation of individual user and account " do
      user = User.create(email: "pr@gmail" , password: "123456")
      account = Account.create(name: "Flipkart" , user_id: user.id)
    end
end
