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

ActiveRecord::Schema.define(version: 20160901021804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hours", force: :cascade do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "user_id"
    t.integer  "purpose_flight_id"
    t.integer  "plane_registration_id"
    t.integer  "landings"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["plane_registration_id"], name: "index_hours_on_plane_registration_id", using: :btree
    t.index ["purpose_flight_id"], name: "index_hours_on_purpose_flight_id", using: :btree
    t.index ["user_id"], name: "index_hours_on_user_id", using: :btree
  end

  create_table "plane_classes", force: :cascade do |t|
    t.string   "name"
    t.string   "nick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plane_registrations", force: :cascade do |t|
    t.string   "prefix"
    t.string   "suffix"
    t.integer  "year"
    t.integer  "plane_id"
    t.integer  "plane_class_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "power"
    t.index ["plane_class_id"], name: "index_plane_registrations_on_plane_class_id", using: :btree
    t.index ["plane_id"], name: "index_plane_registrations_on_plane_id", using: :btree
  end

  create_table "planes", force: :cascade do |t|
    t.string   "manufacturer"
    t.string   "model"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "purpose_flights", force: :cascade do |t|
    t.string   "name"
    t.string   "nick"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

  add_foreign_key "hours", "plane_registrations"
  add_foreign_key "hours", "purpose_flights"
  add_foreign_key "hours", "users"
  add_foreign_key "plane_registrations", "plane_classes"
  add_foreign_key "plane_registrations", "planes"
end
