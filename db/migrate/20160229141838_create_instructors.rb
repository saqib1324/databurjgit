class CreateInstructors < ActiveRecord::Migration
  def up
    create_table :instructors, :id => false do |t|
      t.integer :id, :null => false
      t.string "instructor_name" , :limit => 100
      t.column "email", 'VARCHAR(254)'
      t.column "subject_name", 'VARCHAR(50)'
      t.timestamps null: false
    end
    add_index :instructors, :id, :unique => true
  end
  def down
    drop_table :instructors
  end
end
