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

ActiveRecord::Schema.define(version: 2022_01_19_153154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["name", "country_id"], name: "index_cities_on_name_and_country_id", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "local_name", null: false
    t.string "english_name", null: false
    t.string "available_locales", null: false, array: true
    t.string "alpha_2_code", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["english_name"], name: "index_countries_on_english_name", unique: true
    t.index ["local_name"], name: "index_countries_on_local_name", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "title", null: false
    t.string "short_description"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_groups_on_city_id"
    t.index ["title", "city_id"], name: "index_groups_on_title_and_city_id", unique: true
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "groups", "cities"
end
