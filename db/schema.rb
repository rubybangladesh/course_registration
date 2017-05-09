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

ActiveRecord::Schema.define(version: 20160609045125) do

  create_table "courses", force: :cascade do |t|
    t.string   "course_no"
    t.string   "course_title"
    t.decimal  "credit",         precision: 3, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "semester"
    t.decimal  "maximum_credit"
  end

  create_table "enrolls", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "semester_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "enrolls", ["semester_id"], name: "index_enrolls_on_semester_id"
  add_index "enrolls", ["user_id"], name: "index_enrolls_on_user_id"

  create_table "registers", force: :cascade do |t|
    t.integer  "enroll_id"
    t.integer  "course_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registers", ["course_id"], name: "index_registers_on_course_id"
  add_index "registers", ["enroll_id"], name: "index_registers_on_enroll_id"

  create_table "semesters", force: :cascade do |t|
    t.string   "sem_name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "status"
    t.decimal  "maximum_credit", default: 5.0
  end

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "roll"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
