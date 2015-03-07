class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :country_code
      t.string :currency_code
      t.boolean :visited, default: false
      t.integer :currency_id

      t.timestamps null: false
    end
  end
end
