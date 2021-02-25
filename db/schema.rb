# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_25_092215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.text "description"
    t.text "requirements"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "duration"
    t.bigint "location_id", null: false
    t.bigint "user_id", null: false
    t.index ["location_id"], name: "index_activities_on_location_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.datetime "opening_time"
    t.datetime "closing_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "tour_activities", force: :cascade do |t|
    t.boolean "completed"
    t.string "start_time"
    t.string "finish_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "tour_id", null: false
    t.bigint "activity_id", null: false
    t.index ["activity_id"], name: "index_tour_activities_on_activity_id"
    t.index ["tour_id"], name: "index_tour_activities_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "tour_id"
    t.index ["tour_id"], name: "index_tours_on_tour_id"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bio"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "locations"
  add_foreign_key "activities", "users"
  add_foreign_key "locations", "users"
  add_foreign_key "tour_activities", "activities"
  add_foreign_key "tour_activities", "tours"
  add_foreign_key "tours", "tours"
  add_foreign_key "tours", "users"
end
