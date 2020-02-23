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

ActiveRecord::Schema.define(version: 2020_02_23_225013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "climbs", force: :cascade do |t|
    t.bigint "route_id"
    t.string "name"
    t.string "climb_type"
    t.string "rating"
    t.float "stars"
    t.integer "pitches"
    t.float "lat"
    t.float "lng"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trip_climbs", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.bigint "climb_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["climb_id"], name: "index_trip_climbs_on_climb_id"
    t.index ["trip_id"], name: "index_trip_climbs_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.string "destination_name"
    t.string "destination_address"
    t.float "lat"
    t.float "lng"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "image"
    t.string "google_token"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "trip_climbs", "climbs"
  add_foreign_key "trip_climbs", "trips"
  add_foreign_key "trips", "users"
end
