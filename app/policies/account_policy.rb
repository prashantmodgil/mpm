class AccountPolicy < ApplicationPolicy
   def show?
     if (@account.user_id == @user.id) || (Invitation.current_user_invitation(@user).include? @account.id)
      return true
     end
   end
   def invite?
     if @account.user_id == user.id
       return true
   end
 end
  end
