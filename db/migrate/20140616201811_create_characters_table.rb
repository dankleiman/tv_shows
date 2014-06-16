class CreateCharactersTable < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :role, null: false
      t.string :actor
      t.integer :television_show_id
    end
  end
end
