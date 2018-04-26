class TeamPolicy<ApplicationPolicy

def show?
  if (record.user_id == @user.id) || (TeamMember.where(mem_id: @user.id))
    return true
  end
end
def addmember?
 if (record.user_id == @user.id) || TeamMember.where(mem_id: @user.id)
   return true
  end
 end
end
