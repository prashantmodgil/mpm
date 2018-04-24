class TeamMember < ApplicationRecord
  def self.select_team_id(current_user)
    TeamMember.where(mem_id: current_user.id)
  end
  def self.team_id(teamid)
    #select(:mem_id).where(team_id: teamid)
    TeamMember.where(team_id: teamid).pluck(:mem_id)
  end
end
