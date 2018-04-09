class TeamMember < ApplicationRecord
  def self.select_team_id(current_user)
    TeamMember.select(:team_id).where(mem_id: current_user.id)
  end
end
