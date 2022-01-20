class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :title, null: false
      t.string :short_description
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end

    add_index :groups, [:title, :city_id], unique: true
  end
end
