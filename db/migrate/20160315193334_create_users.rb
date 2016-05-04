class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "username",        limit: 25
      t.string "auth_token"
      t.string   "password_digest", limit: 255
      t.timestamps null: false
    end
  end
end
