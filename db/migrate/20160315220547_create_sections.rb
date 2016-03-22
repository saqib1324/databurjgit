class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.string :section_id, :null => false
      t.string "section_name" , :limit => 50
      t.string "instructor_id", :null => false
       # t.column :id, 'int(11) PRIMARY KEY'
      # t.primary_key :section_id
      # t.integer "position"
      # t.boolean "visible", :default => true,:NULL => false
      # t.string "content_type"
      # t.text "content"
      t.timestamps null: false
    end
  end
  def down
    drop_table :sections
  end
end

