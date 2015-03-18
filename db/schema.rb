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

ActiveRecord::Schema.define(version: 20150317033220) do

  create_table "credits", force: true do |t|
    t.integer  "completed"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "student_id"
    t.integer  "track_id"
  end

  add_index "credits", ["student_id"], name: "index_credits_on_student_id", using: :btree
  add_index "credits", ["track_id"], name: "index_credits_on_track_id", using: :btree

  create_table "electives", primary_key: "elective_code", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",          limit: 150
    t.string   "units",         limit: 1
    t.string   "description",   limit: 140
    t.string   "semester",      limit: 1
    t.integer  "slots"
    t.string   "prerequisites", limit: 40
  end

  create_table "requirements", force: true do |t|
    t.string   "semester",    limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "elective_id"
    t.integer  "track_id"
  end

  add_index "requirements", ["elective_id"], name: "index_requirements_on_elective_id", using: :btree
  add_index "requirements", ["track_id"], name: "index_requirements_on_track_id", using: :btree

  create_table "students", primary_key: "id_number", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "year_level"
    t.string   "course",                  limit: 20
    t.string   "track",                   limit: 25
    t.string   "specialization",          limit: 25
    t.string   "email_address",           limit: 30
    t.string   "contact_number",          limit: 11
    t.boolean  "advisement_accomplished",            default: false
  end

  create_table "tracks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "track_code",  limit: 30
    t.string   "name",        limit: 25
    t.string   "description", limit: 140
  end

  create_table "transcripts", force: true do |t|
    t.boolean  "status",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "student_id"
    t.integer  "elective_id"
  end

  add_index "transcripts", ["elective_id"], name: "index_transcripts_on_elective_id", using: :btree
  add_index "transcripts", ["student_id"], name: "index_transcripts_on_student_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
