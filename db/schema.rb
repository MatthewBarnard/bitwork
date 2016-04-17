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

ActiveRecord::Schema.define(version: 20160417211539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adverts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.float    "payment"
    t.text     "description"
    t.text     "location"
    t.boolean  "is_active"
    t.boolean  "is_claimed"
    t.integer  "user_claimed_id"
    t.float    "user_claimed_amount"
    t.datetime "date_expiry"
    t.datetime "date_required"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_paid"
    t.boolean  "has_rated",           default: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "advert_id"
    t.float    "amount"
    t.boolean  "is_lead"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "comment"
    t.boolean  "is_accepted"
    t.boolean  "is_active",   default: true
  end

  create_table "hits", force: :cascade do |t|
    t.boolean  "is_hit",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating_from"
    t.integer  "rating_to"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_type"
    t.string   "email"
    t.string   "password"
    t.string   "full_name"
    t.string   "cellphone"
    t.string   "address"
    t.integer  "rating"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "jobs"
    t.float    "money"
    t.text     "profile_picture", default: "default.png"
    t.boolean  "is_active",       default: true
  end

  add_foreign_key "adverts", "users"
  add_foreign_key "adverts", "users", column: "user_claimed_id"
  add_foreign_key "bids", "adverts"
  add_foreign_key "bids", "users"
  add_foreign_key "ratings", "users", column: "rating_from"
  add_foreign_key "ratings", "users", column: "rating_to"
end
