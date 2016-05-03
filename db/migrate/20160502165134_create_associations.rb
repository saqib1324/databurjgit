class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|

      t.timestamps null: false
    end
  end
end
