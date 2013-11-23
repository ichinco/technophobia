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

ActiveRecord::Schema.define(version: 20131123182450) do

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "technology_id"
    t.string   "version_used"
    t.integer  "overall_rating"
    t.integer  "development_status"
    t.integer  "community"
    t.integer  "maturity"
    t.text     "what_makes_it_unique"
    t.text     "what_is_it_good_at"
    t.text     "what_is_it_bad_at"
    t.text     "general_comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reviews", ["technology_id"], name: "index_reviews_on_technology_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "technologies", force: true do |t|
    t.integer  "technology_type_id"
    t.string   "name"
    t.text     "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technologies", ["technology_type_id"], name: "index_technologies_on_technology_type_id"

  create_table "technology_compatible_with", id: false, force: true do |t|
    t.integer "technology_a_id", null: false
    t.integer "technology_b_id", null: false
  end

  create_table "technology_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
