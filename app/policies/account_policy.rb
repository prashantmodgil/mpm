class AccountPolicy < ApplicationPolicy
   def show?
     if @record.user_id == user.id || (Invitation.current_user_invitation(user).include? record.id)
      return true
     end
   end
   def invite?
     if @record.user_id == user.id
       return true
   end
 end
  end
