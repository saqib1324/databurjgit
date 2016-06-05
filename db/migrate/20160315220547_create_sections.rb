class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string "section_name" , :limit => 50
      t.string "room_location", :null => false
      t.string "session"
      t.timestamps null: false
    end
  end
  def down
    drop_table :sections
  end
end

