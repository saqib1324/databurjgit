class CreateUndertakings < ActiveRecord::Migration
  def change
    create_table :undertakings, id: false do |t|
      t.string "tracking_id"
      t.boolean "status"
      t.boolean "admin_status"
      t.string "file_name", :null => false
      t.column "data", "MEDIUMBLOB"
      t.string "mime_type"
      t.timestamps null: false
    end
    execute "ALTER TABLE undertakings ADD PRIMARY KEY (tracking_id);"
  end
end
