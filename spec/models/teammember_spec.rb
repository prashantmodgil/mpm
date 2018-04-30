require 'rails_helper'
RSpec.describe  TeamMember, type: "model" do
   it "shold return all the teams of same account current user " do
      user = User.create(email: "pr@gmail" , password: "123456")
      teamm1 =TeamMember.create(team_id:1 ,mem_id: user.id)
      teamm2 =TeamMember.create(team_id:4 ,mem_id: user.id)
      teamm3 =TeamMember.create(team_id:2,mem_id: user.id)
      a = TeamMember.where(mem_id: user.id)
      tm = TeamMember.select_team_id(user)
      expect(a).to eq(tm)
    end

    it "shold not return all the teams of same account current user " do
       user = User.create(email: "pr@gmail" , password: "123456")
       teamm1 =TeamMember.create(team_id:1 ,mem_id: (~user.id).abs)
       teamm2 =TeamMember.create(team_id:4 ,mem_id: (~user.id).abs)
       teamm3 =TeamMember.create(team_id:2,mem_id: (~user.id).abs)
       a = TeamMember.where(mem_id: (~user.id).abs)
       tm = TeamMember.select_team_id(user)
       expect(a).not_to eq(tm)
     end

     it "shold return all themembers of team " do
        user1 = User.create(email: "pr@gmail" , password: "123456")
        user2 = User.create(email: "pra@gmail" , password: "123456")
        user3 = User.create(email: "pras@gmail" , password: "123456")
        team = Team.create(name:"team" ,acc_id: 1, user_id: 1)
        teamm1 =TeamMember.create(team_id:team.id ,mem_id: user1.id)
        teamm2 =TeamMember.create(team_id:team.id ,mem_id: user2.id)
        teamm3 =TeamMember.create(team_id:team.id ,mem_id: user3.id)
        a = TeamMember.where(team_id: team.id).pluck(:mem_id)
        tm = TeamMember.team_id(team.id)
        expect(a).to eq(tm)
      end

      it "shold not return the members of  diffrent team " do
         user1 = User.create(email: "pr@gmail" , password: "123456")
         user2 = User.create(email: "pra@gmail" , password: "123456")
         user3 = User.create(email: "pras@gmail" , password: "123456")
         team = Team.create(name:"team" ,acc_id: 1, user_id: 1)
         teamm1 =TeamMember.create(team_id:((~team.id).abs) ,mem_id: user1.id)
         teamm2 =TeamMember.create(team_id:((team.id).abs) ,mem_id: user2.id)
         teamm3 =TeamMember.create(team_id:team.id ,mem_id: user3.id)
         a = TeamMember.where(team_id: ((team.id).abs).pluck(:mem_id)
         tm = TeamMember.team_id(team.id)
         expect(a).to eq(tm)
       end
 end
