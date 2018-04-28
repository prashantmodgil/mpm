class TeamPolicy<ApplicationPolicy

def show?
  #creater of team & teammember
  if (record.user_id == @user.id) || (TeamMember.where(mem_id: @user.id))
    return true
  end
end
def addmember?
  # creater of team and team member
 if (record.user_id == @user.id) || TeamMember.where(mem_id: @user.id)
   return true
  end
 end
end
