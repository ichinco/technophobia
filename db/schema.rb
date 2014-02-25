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

ActiveRecord::Schema.define(version: 20140225025134) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
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

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "languages", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses", force: true do |t|
    t.text     "name"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses_technologies", id: false, force: true do |t|
    t.integer "license_id"
    t.integer "technology_id"
  end

  add_index "licenses_technologies", ["technology_id", "license_id"], name: "index_licenses_technologies_on_technology_id_and_license_id"
  add_index "licenses_technologies", ["technology_id"], name: "index_licenses_technologies_on_technology_id"

  create_table "numeric_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "technology_id"
    t.integer  "review_type_id"
    t.integer  "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "numeric_reviews", ["review_type_id"], name: "index_numeric_reviews_on_review_type_id"
  add_index "numeric_reviews", ["technology_id"], name: "index_numeric_reviews_on_technology_id"
  add_index "numeric_reviews", ["user_id"], name: "index_numeric_reviews_on_user_id"

  create_table "review_types", force: true do |t|
    t.string   "review_type"
    t.string   "display_name"
    t.string   "min_name"
    t.string   "max_name"
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
    t.boolean  "is_open_source"
  end

  add_index "technologies", ["technology_type_id"], name: "index_technologies_on_technology_type_id"

  create_table "technologies_licenses_tables", force: true do |t|
  end

  create_table "technology_compatible_with", id: false, force: true do |t|
    t.integer "technology_a_id", null: false
    t.integer "technology_b_id", null: false
  end

  create_table "technology_properties", force: true do |t|
    t.integer  "technology_type_id"
    t.string   "display_name"
    t.string   "property_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technology_properties", ["technology_type_id"], name: "index_technology_properties_on_technology_type_id"

  create_table "technology_property_values", force: true do |t|
    t.integer  "technology_property_id"
    t.text     "value"
    t.integer  "technology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "technology_property_values", ["technology_id"], name: "index_technology_property_values_on_technology_id"
  add_index "technology_property_values", ["technology_property_id"], name: "index_technology_property_values_on_technology_property_id"

  create_table "technology_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "technology_id"
    t.integer  "review_type_id"
    t.text     "review"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "text_reviews", ["review_type_id"], name: "index_text_reviews_on_review_type_id"
  add_index "text_reviews", ["technology_id"], name: "index_text_reviews_on_technology_id"
  add_index "text_reviews", ["user_id"], name: "index_text_reviews_on_user_id"

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
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
