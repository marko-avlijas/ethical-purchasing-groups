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

ActiveRecord::Schema.define(version: 2022_02_08_204155) do

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

  create_table "legacy_deliveries", force: :cascade do |t|
    t.bigint "legacy_offer_id", null: false
    t.bigint "legacy_location_id"
    t.datetime "when", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["legacy_location_id"], name: "index_legacy_deliveries_on_legacy_location_id"
    t.index ["legacy_offer_id"], name: "index_legacy_deliveries_on_legacy_offer_id"
  end

  create_table "legacy_group_offerings", force: :cascade do |t|
    t.bigint "legacy_offer_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_legacy_group_offerings_on_group_id"
    t.index ["legacy_offer_id"], name: "index_legacy_group_offerings_on_legacy_offer_id"
  end

  create_table "legacy_locations", force: :cascade do |t|
    t.string "title", null: false
    t.float "lat"
    t.float "lng"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["title"], name: "index_legacy_offers_on_title", unique: true
  end

  create_table "legacy_offer_items", force: :cascade do |t|
    t.bigint "legacy_offer_id", null: false
    t.string "title", null: false
    t.integer "position", default: 0, null: false
    t.text "note"
    t.boolean "placeholder", default: false, null: false
    t.string "status"
    t.datetime "status_changed_at", precision: 6
    t.decimal "total_available_qty", precision: 7, scale: 1
    t.decimal "min_qty_per_order", precision: 7, scale: 1
    t.string "packaging"
    t.string "packaging_description"
    t.string "unit_bulk"
    t.integer "price_bulk"
    t.string "unit_package"
    t.integer "price_package"
    t.string "unit_vario"
    t.integer "price_vario"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["legacy_offer_id"], name: "index_legacy_offer_items_on_legacy_offer_id"
  end

  create_table "legacy_offers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "note"
    t.datetime "valid_from", precision: 6
    t.datetime "valid_until", precision: 6
    t.string "company_name"
    t.string "company_address"
    t.string "company_oib"
    t.string "dispatch_place"
    t.string "dispatch_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_legacy_offers_on_user_id"
  end

  create_table "legacy_order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "offer_item_id", null: false
    t.decimal "qty", precision: 7, scale: 1, null: false
    t.decimal "min_qty", precision: 7, scale: 1
    t.decimal "solidary_qty", precision: 7, scale: 1
    t.datetime "solidary_qty_changed_at", precision: 6
    t.string "status"
    t.datetime "status_changed_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_item_id"], name: "index_legacy_order_items_on_offer_item_id"
    t.index ["order_id"], name: "index_legacy_order_items_on_order_id"
  end

  create_table "legacy_orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "legacy_offer_id", null: false
    t.bigint "legacy_delivery_id", null: false
    t.text "note"
    t.string "status"
    t.datetime "status_changed_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["legacy_delivery_id"], name: "index_legacy_orders_on_legacy_delivery_id"
    t.index ["legacy_offer_id"], name: "index_legacy_orders_on_legacy_offer_id"
    t.index ["user_id"], name: "index_legacy_orders_on_user_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.text "additional_note"
    t.integer "order"
    t.boolean "active", default: true, null: false
    t.string "type", null: false
    t.string "unit", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.decimal "min_quantity_per_order", precision: 7, scale: 2
    t.decimal "min_weight"
    t.decimal "max_weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_variants_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "note"
    t.bigint "producer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["producer_id", "title"], name: "index_products_on_producer_id_and_title", unique: true
    t.index ["producer_id"], name: "index_products_on_producer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: 6
    t.datetime "confirmation_sent_at", precision: 6
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", precision: 6
    t.boolean "superadmin", default: false, null: false
    t.bigint "group_id"
    t.bigint "requested_group_id"
    t.string "name", null: false
    t.string "phone", null: false
    t.string "neighborhood"
    t.boolean "is_producer", default: false, null: false
    t.text "about_text"
    t.string "about_url"
    t.string "locale", default: "hr", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["requested_group_id"], name: "index_users_on_requested_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "cities", "countries"
  add_foreign_key "groups", "cities"
  add_foreign_key "product_variants", "products"
  add_foreign_key "products", "users", column: "producer_id"
  add_foreign_key "users", "groups", column: "requested_group_id"
end
