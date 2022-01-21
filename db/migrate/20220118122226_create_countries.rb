class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :local_name, null: false, index: { unique: true }
      t.string :english_name, null: false, index: { unique: true }
      t.string :available_locales, array: true, null: false
      t.string :alpha_2_code, null: false

      t.timestamps
    end
  end
end
