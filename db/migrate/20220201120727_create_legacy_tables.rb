class CreateLegacyTables < ActiveRecord::Migration[7.0]
  def change

    create_table "legacy_locations", :force => true do |t|
      t.string   "title",       null: false
      t.float    "lat"
      t.float    "lng"
      t.string   "description"
      t.timestamps
    end
    add_index "legacy_locations", ["title"], :name => "index_legacy_offers_on_title", unique: true
    
    create_table "legacy_offers", :force => true do |t|
      t.references :user,     null: false
      t.string   :title,       null: false
      t.text     "note"
      t.datetime "valid_from"
      t.datetime "valid_until"
      t.string :company_name
      t.string :company_address
      t.string :company_oib
      t.string :dispatch_place
      t.string :dispatch_date

      t.timestamps
    end

    create_table "legacy_deliveries", :force => true do |t|
      t.references  :legacy_offer,    null: false
      t.references  :legacy_location
      t.datetime "when"
      t.timestamps
    end
    
    create_table "legacy_offer_items", :force => true do |t|
      t.references  :legacy_offer, null: false
      t.string   "title", null: false
      t.integer  "position", default: 0, null: false
      t.text     "note"
      t.boolean  "placeholder", default: false, null: false
      t.string   "status"
      t.datetime "status_changed_at"
      t.decimal  "total_available_qty",     precision: 7, scale: 1
      t.decimal  "min_qty_per_order",       precision: 7, scale: 1
      t.string :packaging
      t.string :packaging_description
      t.string :unit_bulk
      t.integer :price_bulk
      t.string :unit_package
      t.integer :price_package
      t.string :unit_vario
      t.integer :price_vario
      t.timestamps
    end
  
    create_table "legacy_orders", :force => true do |t|
      t.references  :user,      null: false
      t.references  :legacy_offer,     null: false
      t.references  :legacy_delivery,  null: false
      t.text     "note"
      t.string   "status"
      t.datetime "status_changed_at"
      t.timestamps
    end
  
    create_table "legacy_order_items", :force => true do |t|
      t.references  :order,           null: false
      t.references  :offer_item,      null: false
      t.decimal  "qty",                null: false, precision: 7, scale: 1
      t.decimal  "min_qty",            precision: 7, scale: 1
      t.decimal  "solidary_qty",       precision: 7, scale: 1
      t.datetime "solidary_qty_changed_at"
      t.string   "status"
      t.datetime "status_changed_at"
      t.timestamps
    end

    create_table "legacy_group_offerings", :force => true do |t|
      t.references  :legacy_offer,    null: false
      t.references  :group,    null: false
      t.timestamps
    end

  end
end
