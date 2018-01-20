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

ActiveRecord::Schema.define(version: 20180120185215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "changes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "past_day", precision: 8, scale: 2
    t.decimal "percentage", precision: 8, scale: 2
  end

  create_table "coins", force: :cascade do |t|
    t.decimal "total"
    t.string "decimal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "profit", precision: 8, scale: 2
    t.string "global"
    t.string "time"
    t.bigint "user_id"
    t.string "investment", default: "0"
    t.index ["user_id"], name: "index_coins_on_user_id"
  end

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.decimal "qty", precision: 14, scale: 8
    t.integer "decimal"
    t.integer "investment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "yesterday", precision: 8, scale: 2
    t.boolean "day", default: false
    t.string "total", default: "0"
    t.string "value", default: "0"
    t.string "mc", default: "0"
    t.string "one", default: "0"
    t.string "twenty_four", default: "0"
    t.string "pp", default: "0"
    t.string "global", default: "0"
    t.bigint "user_id"
    t.string "exchange"
    t.string "sym"
    t.string "image_url"
    t.string "seven_day"
    t.string "new_exchange"
    t.string "location"
    t.index ["user_id"], name: "index_cryptos_on_user_id"
  end

  create_table "globals", force: :cascade do |t|
    t.string "mc"
    t.string "last_update"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prospects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "usd"
    t.string "btc"
    t.string "mc"
    t.string "one"
    t.string "twenty_four"
    t.string "price"
    t.string "value"
    t.string "image_url"
    t.string "sym"
    t.bigint "user_id"
    t.string "seven_day"
    t.index ["user_id"], name: "index_prospects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "investment", default: "0"
    t.string "portfolio"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "coins", "users"
  add_foreign_key "cryptos", "users"
  add_foreign_key "prospects", "users"
end
