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

ActiveRecord::Schema.define(version: 20150709021637) do

  create_table "area_of_knowledges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "teacher_id"
    t.integer  "matter_id"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "courses", ["matter_id"], name: "index_courses_on_matter_id"
  add_index "courses", ["teacher_id"], name: "index_courses_on_teacher_id"

  create_table "matter_teacher_students", force: :cascade do |t|
    t.integer  "matter_id"
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "many"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matter_teachers", force: :cascade do |t|
    t.integer  "matter_id"
    t.integer  "teacher_id"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "matter_teachers", ["matter_id"], name: "index_matter_teachers_on_matter_id"
  add_index "matter_teachers", ["teacher_id"], name: "index_matter_teachers_on_teacher_id"

  create_table "matters", force: :cascade do |t|
    t.string   "name"
    t.text     "descripition"
    t.datetime "created_at",         null: false
    t.integer  "areaOfKnowledge_id"
    t.datetime "updated_at",         null: false
  end

  add_index "matters", ["areaOfKnowledge_id"], name: "index_matters_on_areaOfKnowledge_id"

  create_table "recommendations", force: :cascade do |t|
    t.integer  "rating"
    t.text     "descripition"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.integer  "user_id"
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.text     "formation"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "teachers", force: :cascade do |t|
    t.string   "formation"
    t.datetime "created_at",  null: false
    t.integer  "user_id"
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  add_index "teachers", ["user_id"], name: "index_teachers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "scholarity"
    t.string   "fone"
    t.string   "whatsapp"
    t.string   "skype"
    t.string   "addrress"
    t.string   "state"
    t.string   "country"
    t.date     "date_of_birth"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "is_female",              default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
