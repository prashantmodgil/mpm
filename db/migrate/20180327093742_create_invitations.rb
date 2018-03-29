class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :mem_id
      t.integer :acc_id,             null: false
      t.string :invite_email,        null: false

      t.timestamps
    end
    add_index( :invitations, [:acc_id,:invite_email] , unique: true)
  end
end
