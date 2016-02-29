class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students, :id => false do |t|
      t.string "name"
      t.integer :tracking_id, :null => false
      t.string "father_name"
      t.string "DOB"
      t.column "SEX", 'CHAR(1)'
      t.string "city"
      t.string "email"
      t.integer "phone_number", :limit => 11
      t.string "mailing_address"
      
      t.timestamps null: false
    end
    add_index :students, :tracking_id, :unique => true
  end
  def down
    drop_table :students
  end
end
