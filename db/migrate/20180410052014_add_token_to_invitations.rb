class AddTokenToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :token, :string , unique: true
  end
end
