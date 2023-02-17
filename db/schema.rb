# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_02_17_035435) do

  create_table "pool_services", force: :cascade do |t|
    t.datetime "date"
    t.integer "pools_id", null: false
    t.integer "services_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pools_id"], name: "index_pool_services_on_pools_id"
    t.index ["services_id"], name: "index_pool_services_on_services_id"
  end

  create_table "pools", force: :cascade do |t|
    t.string "address"
    t.integer "size"
    t.boolean "saltwater"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.boolean "cleaning"
    t.boolean "chemical_balance"
    t.integer "quote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "pool_services", "pools", column: "pools_id"
  add_foreign_key "pool_services", "services", column: "services_id"
end
