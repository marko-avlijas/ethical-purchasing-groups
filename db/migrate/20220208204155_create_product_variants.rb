class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.text :additional_note
      t.integer :order
      t.boolean :active, null: false, default: true
      t.string :type, null: false
      t.string :unit, null: false
      t.decimal :price, null: false, precision: 10, scale: 2
      t.decimal :min_quantity_per_order, precision: 7, scale: 2
      t.decimal :min_weight
      t.decimal :max_weight

      t.timestamps
    end
  end
end
