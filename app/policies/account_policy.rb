class AccountPolicy < ApplicationPolicy
   def show?
	if @record.user_id == user.id || Invitation.current_user_invitation(user) == record
    debugger
       return true
     end
   end
end
