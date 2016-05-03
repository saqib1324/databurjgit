class CreateLms < ActiveRecord::Migration
  def change
    create_table :lms do |t|
      t.string "instructor_id"
      t.string "section_id"
      t.string "subject_name"
      t.string "file_name", :null => false
      t.column "data","MEDIUMBLOB" 
      t.string "mime_type"
      t.timestamps null: false
    end
  end
end
