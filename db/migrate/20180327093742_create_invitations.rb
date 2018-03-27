class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.integer :mem_id
      t.integer :acc_id
      t.string :invite_email

      t.timestamps
    end
  end
end
