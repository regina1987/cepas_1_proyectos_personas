class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :personas, :projects do |t|
      t.index [:persona_id, :projecto_id]
      t.index [:projecto_id, :persona_id]
    end
  end
end
