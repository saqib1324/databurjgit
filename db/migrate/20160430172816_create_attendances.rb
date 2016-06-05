class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
    t.string "instructor_id"
    t.string "section_name"
    t.date "date"
    t.string "tracking_id"
    t.boolean "attendance_status"
    t.string :session
      t.timestamps null: false
    end
  end
end
