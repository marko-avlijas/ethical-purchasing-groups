class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :note
      t.references :producer, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :products, [:producer_id, :title], unique: true
  end
end
