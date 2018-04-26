class TeamPolicy<ApplicationPolicy

def show?
 record.user_id == user.id || TeamMember.where(mem_id: user.id)
end
def addmember?
 record.user_id == user.id || TeamMember.where(mem_id: user.id)
end

end
