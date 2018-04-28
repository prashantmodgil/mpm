class AccountPolicy < ApplicationPolicy
   def show?
     #admin & member
     if (@account.user_id == @user.id) || (Invitation.current_user_invitation(@user).include? @account.id)
      return true
     end
   end
   def invite?
     #admin only
     if @record.user_id == @user.id
       return true
   end
 end
  end
