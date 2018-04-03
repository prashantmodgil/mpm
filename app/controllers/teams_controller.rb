class TeamsController < ApplicationController
  def index
    @team =Team.new
  end

  def show
  end
  def create
    @team = Team.create!(name: params[:name],acc_id: params[:id])
  if  @team.save
    redirect_to 'accounts[:id]'
  else
    redirect_to 'accounts'
  end
end
  #private
  #def team_params
#    params.require(:team).permit(:name,:user_id,:acc_id)
#  end
end
