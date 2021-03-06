require 'rails_helper'

RSpec.describe  Team, type: "model" do
   it "shold return all the teams of same account current user " do
      user = User.create(email: "pr@gmail" , password: "123456")
      team1 =Team.create(name:"team1", acc_id: 2, user_id:user.id)
      team2 =Team.create(name:"team2" ,acc_id: 2, user_id:user.id)
      team3 =Team.create(name:"team3" ,acc_id: 2, user_id:user.id)
      a = Team.where(user_id: user.id)
      tm = Team.my_teams(user)
      expect(a).to eq(tm)
    end
    it "shold not return all the teams of diffrent user " do
       user = User.create(email: "pr@gmail" , password: "123456")
       team1 =Team.create(name:"team1", acc_id: 2, user_id:user.id)
       team2 =Team.create(name:"team2" ,acc_id: 2, user_id:user.id)
       team3 =Team.create(name:"team3" ,acc_id: 2, user_id:user.id)
       a = Team.where(user_id: (~user.id).abs)
       tm = Team.my_teams(user)
       expect(a).not_to eq(tm)
     end

end
