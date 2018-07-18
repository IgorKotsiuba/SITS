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

ActiveRecord::Schema.define(version: 2018_07_18_205815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "managers", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "customer_name", null: false
    t.string "customer_email", null: false
    t.integer "department_id", null: false
    t.string "subject", null: false
    t.text "body", null: false
    t.string "reference_uuid", null: false
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_uuid"], name: "index_tickets_on_reference_uuid", unique: true
  end

  add_foreign_key "tickets", "managers", column: "owner_id"
end
