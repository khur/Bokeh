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

ActiveRecord::Schema.define(version: 20150518135200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "criteria"
    t.boolean  "active",     default: true
    t.integer  "user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "score",              default: 1400
    t.integer  "user_id"
    t.integer  "contest_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image"
    t.integer  "vote_counter",       default: 1
    t.integer  "opponent_score_sum", default: 0
    t.integer  "win_total",          default: 0
    t.integer  "loss_total",         default: 0
  end

  add_index "photos", ["contest_id"], name: "index_photos_on_contest_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "image"
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "photos", "contests"
  add_foreign_key "photos", "users"
end
