class CreateTeamMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :mem_id

      t.timestamps
    end
    add_index( :team_members, [:team_id,:mem_id] , unique: true)
  end
end
