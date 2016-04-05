class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string "name"
      t.string "tracking_id"
      t.float "matric_percentage"
      t.integer "monthly_income"
      t.column "SEX", 'CHAR(1)'
      t.column "section", 'CHAR(1)'
      t.string "city"
      t.string "father_name"
      t.string "DOB"
      t.string "email"
      t.string "phone_number"
      t.string "secondary_phone_number"
      t.string "mailing_address"
      t.string "username"
      t.string "password_digest"
      t.timestamps null: false
    end
  end
  def down
    drop_table :students
  end
end
