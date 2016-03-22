class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string "name"
      t.string :tracking_id, :null => false
      t.string "father_name"
      t.string "DOB"
      t.column "SEX", 'CHAR(1)'
      t.string "city"
      t.string "email"
      t.string "phone_number"
      t.string "mailing_address"
      
      t.timestamps null: false
    end
  end
  def down
    drop_table :students
  end
end
