class TeamMember < ApplicationRecord
  def self.select_team_id(current_user)
    TeamMember.select(:team_id).where(mem_id: current_user.id)
  end
  def self.team_id(teamid)
    select(:mem_id).where(team_id: teamid)
  end
end
