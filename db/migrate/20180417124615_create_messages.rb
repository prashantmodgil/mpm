class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :account_id
      t.integer :mem_id

      t.timestamps
    end
  end
end
