class TeamsController < ApplicationController
#before_action :authenticate_user!
  def index
    @team =Team.new
    # new_team
    @teams = Team.all
    # all_team
      #@my_teams = Team.where(user_id: current_user.id)
      @my_teams = Team.my_teams(current_user)
      #@temp = TeamMember.select(:team_id).where(mem_id: current_user.id)
      @temp = TeamMember.select_team_id(current_user)
      @other_teams = Team.where(id: @temp)
  end

  def show
    @team = Team.find(params[:id])
    #@temp = Invitation.select(:mem_id).where(acc_id: params[:account_id])
    #@temp = Invitation.select_mem_id(params[:account_id])

    @members = User.where(id: Invitation.select_mem_id(params[:account_id]))
    @team_mem = TeamMember.new
    @tmid = TeamMember.select(:mem_id)
    @team_members = User.where(id: @tmid)
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
      if  @team.save
      redirect_to account_team_path(params[:account_id],@team.id)
      #redirect_to account_path(params[:account_id])
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
