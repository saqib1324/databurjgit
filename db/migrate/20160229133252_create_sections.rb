class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections, :id => false do |t|
      t.integer :id, :null => false
      t.string "section_name" , :limit => 50
      t.integer "instructor_id"
       # t.column :id, 'int(11) PRIMARY KEY'
      # t.primary_key :section_id
      # t.integer "position"
      # t.boolean "visible", :default => true,:NULL => false
      # t.string "content_type"
      # t.text "content"
      t.timestamps null: false
    end
    add_index :sections, :id, :unique => true
  end
  def down
    drop_table :sections
  end
end

