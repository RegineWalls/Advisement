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

ActiveRecord::Schema.define(version: 20150304145218) do

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

  create_table "electives", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "units"
    t.string   "description"
    t.integer  "semester"
    t.integer  "slots"
    t.string   "elective_code"
  end

  add_index "electives", ["elective_code"], name: "index_electives_on_elective_code", using: :btree

  create_table "students", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "id_number"
    t.string   "name"
    t.integer  "year_level"
    t.string   "course"
    t.string   "track"
    t.string   "specialization"
    t.string   "email_address"
    t.string   "contact_number"
    t.boolean  "advisement_accomplished"
  end

  add_index "students", ["id_number"], name: "index_students_on_id_number", using: :btree

  create_table "tracks", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "track_code"
    t.string   "type"
  end

  add_index "tracks", ["track_code"], name: "index_tracks_on_track_code", using: :btree

  create_table "transcripts", force: true do |t|
    t.boolean  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "student_id"
    t.integer  "elective_id"
  end

  add_index "transcripts", ["elective_id"], name: "index_transcripts_on_elective_id", using: :btree
  add_index "transcripts", ["student_id"], name: "index_transcripts_on_student_id", using: :btree

end
