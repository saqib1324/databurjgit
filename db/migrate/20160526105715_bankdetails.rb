class Bankdetails < ActiveRecord::Migration
  def up
    create_table :bankdetails do |t|
      t.string "bankname"
      
      t.string "deadline"
      t.string "programme"
      t.string "ntn"
      t.string "accountnumber"
      t.string "year"
      t.string "date"
      t.string "hostelfee"
      t.string "securityfee"
      t.timestamps null: false
    end

  end
  
  def down
    drop_table :bankdetails
  end
end
