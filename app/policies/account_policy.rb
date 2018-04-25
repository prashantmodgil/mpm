class AccountPolicy < ApplicationPolicy
   def show?
     if (record.account.include? user) || (record.user_id == user.id)
       return true
     end
   end


end
