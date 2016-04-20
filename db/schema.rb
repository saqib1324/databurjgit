# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160407170455) do

  create_table "instructors", force: :cascade do |t|
    t.string   "instructor_id",   limit: 255
    t.string   "instructor_name", limit: 255
    t.string   "email",           limit: 255
    t.string   "phone_number",    limit: 255
    t.string   "subject_name",    limit: 255
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "section_name",  limit: 50
    t.string   "room_location", limit: 255, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sections", ["section_name"], name: "index_sections_on_section_name", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "tracking_id",            limit: 255
    t.float    "matric_percentage",      limit: 24
    t.integer  "monthly_income",         limit: 4
    t.string   "SEX",                    limit: 1
    t.string   "section",                limit: 255
    t.string   "city",                   limit: 255
    t.string   "father_name",            limit: 255
    t.string   "DOB",                    limit: 255
    t.string   "email",                  limit: 255
    t.string   "phone_number",           limit: 255
    t.string   "secondary_phone_number", limit: 255
    t.string   "mailing_address",        limit: 255
    t.string   "username",               limit: 255
    t.string   "password_digest",        limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "students", ["section"], name: "index_students_on_section", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 25
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
