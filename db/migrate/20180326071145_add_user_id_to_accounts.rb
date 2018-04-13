class AddUserIdToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :user_id, :integer, null: false
  end
  #add_index :accounts :user_id
  #add_index :accounts, [:user_id,:name] , unique: true
end
