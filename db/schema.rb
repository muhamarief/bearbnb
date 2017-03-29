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

ActiveRecord::Schema.define(version: 20170329145730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "property_type"
    t.integer  "room_type"
    t.string   "google_address"
    t.date     "start_date",                     null: false
    t.date     "end_date",                       null: false
    t.integer  "user_id"
    t.integer  "accomodate",     default: 1
    t.integer  "bathroom"
    t.boolean  "wifi"
    t.boolean  "kitchen"
    t.integer  "bed",            default: 1
    t.boolean  "parking_spot",   default: false
    t.boolean  "smoke",          default: false
    t.boolean  "pet",            default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "price"
    t.string   "city"
    t.json     "photos"
    t.index ["user_id"], name: "index_listings_on_user_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.integer  "rating"
    t.string   "comment"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "total_price"
    t.boolean  "paid",        default: false
    t.index ["listing_id"], name: "index_reservations_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                                      null: false
    t.string   "encrypted_password", limit: 128,             null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "passport_number"
    t.string   "nationality"
    t.string   "city"
    t.string   "phone_number"
    t.integer  "gender"
    t.date     "birthday"
    t.string   "currency"
    t.integer  "role",                           default: 0
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_token"], name: "index_users_on_remember_token", using: :btree
  end

  add_foreign_key "reservations", "listings"
  add_foreign_key "reservations", "users"
end
