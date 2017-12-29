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

ActiveRecord::Schema.define(version: 20171229084156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "changes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "past_day", precision: 8, scale: 2
    t.decimal "percentage", precision: 8, scale: 2
  end

  create_table "coins", force: :cascade do |t|
    t.string "total"
    t.string "decimal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "profit", precision: 8, scale: 2
    t.string "global"
    t.string "time"
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
  end

end
