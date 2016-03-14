class CreateInstructors < ActiveRecord::Migration
  def up
    create_table :instructors do |t|
      t.integer :instructor_id
      t.string :instructor_name
      t.string :email
      t.string :subject_name

      t.timestamps null: false
    end
  end
  def down
    drop_table :instructors
  end
end
