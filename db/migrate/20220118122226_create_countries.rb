class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :local_name, null: false, index: { unique: true }
      t.string :english_name, null: false, index: { unique: true }
      t.string :available_locales, array: true, null: false, index: { unique: true }
      t.string :alpha_2_code, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
