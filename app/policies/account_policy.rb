class AccountPolicy < ApplicationPolicy
   def show?
     if (@record.@account.@members.include? user) || (@record.user_id == user.id)
       return true
     end
   end


end
