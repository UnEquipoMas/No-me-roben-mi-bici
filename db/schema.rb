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

ActiveRecord::Schema.define(version: 20171105062121) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bycicles", force: :cascade do |t|
    t.string "serial", null: false
    t.boolean "state", null: false
    t.string "color", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_bycicle_id"
    t.bigint "brand_id"
    t.bigint "user_id"
    t.boolean "del", default: false
    t.index ["brand_id"], name: "index_bycicles_on_brand_id"
    t.index ["type_bycicle_id"], name: "index_bycicles_on_type_bycicle_id"
    t.index ["user_id"], name: "index_bycicles_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "report_id"
    t.bigint "user_id"
    t.index ["report_id"], name: "index_comments_on_report_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "modes", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "attachable_type"
    t.bigint "attachable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["attachable_type", "attachable_id"], name: "index_photos_on_attachable_type_and_attachable_id"
  end

  create_table "reports", force: :cascade do |t|
    t.date "date"
    t.time "hour"
    t.text "description"
    t.boolean "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_report_id"
    t.bigint "user_id"
    t.bigint "mode_id"
    t.bigint "bycicle_id"
    t.index ["bycicle_id"], name: "index_reports_on_bycicle_id"
    t.index ["mode_id"], name: "index_reports_on_mode_id"
    t.index ["type_report_id"], name: "index_reports_on_type_report_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", null: false
    t.string "lat", null: false
    t.string "lng", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "report_id"
  end

  create_table "type_bycicles", force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_reports", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "doc"
    t.string "nick"
    t.integer "phone"
    t.string "photo"
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "bycicles", "brands"
  add_foreign_key "bycicles", "type_bycicles"
  add_foreign_key "bycicles", "users"
  add_foreign_key "comments", "reports"
  add_foreign_key "comments", "users"
  add_foreign_key "reports", "bycicles"
  add_foreign_key "reports", "modes"
  add_foreign_key "reports", "type_reports"
  add_foreign_key "reports", "users"
end
