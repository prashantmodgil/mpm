class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name       , unique: true  
      t.integer :acc_id
      t.integer :user_id

      t.timestamps
    end
    add_index( :teams, [:name,:acc_id,:user_id] , unique: true)
  end
end
