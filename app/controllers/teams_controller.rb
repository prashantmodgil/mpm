class TeamsController < ApplicationController

  def index
    @team =Team.new
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @temp = Invitation.select(:mem_id).where(acc_id: params[:id])
    debugger
    @members = User.where(id: @temp)

  end
  def create
  @team = Team.create!(team_params)
  if  @team.save
    redirect_to account_team_path(params[:account_id],@team.id)
    #redirect_to account_path(params[:account_id])
  else
    redirect_to account_path(params[:account_id])
  end
end
  private
  def team_params
   params.require(:team).permit(:name,:user_id,:acc_id)
  end
end
