class Team < ApplicationRecord
  has_many :comments, as: :commentable
  def self.my_teams(current_user)
    Team.where(user_id: current_user.id)
  end
end
