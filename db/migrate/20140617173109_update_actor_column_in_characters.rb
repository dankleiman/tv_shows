class UpdateActorColumnInCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :actor_id, :integer
    remove_column :characters, :actor, :string
  end
end
