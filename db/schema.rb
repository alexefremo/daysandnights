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

ActiveRecord::Schema.define(version: 20140107135317) do

  create_table "advertises", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.date     "starts"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "advertise_photo_file_name"
    t.string   "advertise_photo_content_type"
    t.integer  "advertise_photo_file_size"
    t.datetime "advertise_photo_updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.integer  "user_id"
    t.text     "content"
    t.integer  "place_id"
    t.datetime "start_date"
    t.time     "end_time"
    t.time     "start_time"
    t.string   "published"
    t.integer  "like_count",               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "event_photo_file_name"
    t.string   "event_photo_content_type"
    t.integer  "event_photo_file_size"
    t.datetime "event_photo_updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "place_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_galleries", force: true do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "place_types", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "title"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "place_type_id"
    t.text     "content"
    t.string   "address"
    t.integer  "subscribers_count",        default: 0
    t.integer  "subscribers_male",         default: 0
    t.integer  "subscribers_female",       default: 0
    t.time     "mon_start"
    t.time     "mon_end"
    t.time     "tue_start"
    t.time     "tue_end"
    t.time     "wed_start"
    t.time     "wed_end"
    t.time     "thu_start"
    t.time     "thu_end"
    t.time     "fri_start"
    t.time     "fri_end"
    t.time     "sat_start"
    t.time     "sat_end"
    t.time     "sun_start"
    t.time     "sun_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "place_photo_file_name"
    t.string   "place_photo_content_type"
    t.integer  "place_photo_file_size"
    t.datetime "place_photo_updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "place_id"
    t.integer  "user_id"
    t.string   "user_gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "profile_name"
    t.string   "right"
    t.string   "about"
    t.string   "location"
    t.string   "gender"
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
