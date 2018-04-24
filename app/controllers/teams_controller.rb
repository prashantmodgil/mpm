class TeamsController < ApplicationController
#before_action :authenticate_user!
  def index
    @team =Team.new
    @teams = Team.all
    @my_teams = Team.my_teams(current_user)
    @other_teams = Team.where(id: TeamMember.select_team_id(current_user))
  end

  def show
    @team = Team.find(params[:id])
    @members = User.where(id: Invitation.select_mem_id(params[:account_id]))
    @team_mem = TeamMember.new
    @tmid = TeamMember.team_id(@team)
    @team_members = User.where(id: @tmid)
    @remaining = @members - @team_members
    @messages =Message.where(team_id: @team)
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
      if  @team.save
      redirect_to account_team_path(params[:account_id],@team.id)
    else
      redirect_to account_path(params[:account_id])
    end
  end

  def addmember
      @userids = params[:ids]
        @userids.each do |a|
        @team_mem = TeamMember.create(team_id: params[:team_id].to_i, mem_id: a.to_i)
      end
  end

  private
  def team_params
   params.require(:team).permit(:name,:user_id,:acc_id)
  end
end
