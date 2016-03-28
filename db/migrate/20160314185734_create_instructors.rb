class CreateInstructors < ActiveRecord::Migration
  def up
    create_table :instructors do |t|
      t.string :instructor_id
      t.string :instructor_name
      t.string :email
      t.string :subject_name
      t.string :username
      t.string :password_digest

      t.timestamps null: false
    end
  end
  def down
    drop_table :instructors
  end
end
