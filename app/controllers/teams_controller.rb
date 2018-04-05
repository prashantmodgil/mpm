class TeamsController < ApplicationController

  def index
    @team =Team.new
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @temp = Invitation.select(:mem_id).where(acc_id: params[:account_id])
    @members = User.where(id: @temp)
    #@team_mem = TeamMembers.new
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

  def add_members
    @userids = params[:ids]
    @userids.each do |a|
    @team_mem = TeamMember.create(team_id: params[:id],mem_id: a,acc_id: params[:account_id])
  end
end

  private
  def team_params
   params.require(:team).permit(:name,:user_id,:acc_id)
  end
end
