class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string :section_id, :null => false, foreign_key: false
      t.string "section" , primary_key: true, unique: true, :limit => 50
      t.string "room_location", :null => false
      t.timestamps null: false
    end
  end
  def down
    drop_table :sections
  end
end

