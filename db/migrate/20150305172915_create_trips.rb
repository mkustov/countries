class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.text :description
      t.date :date

      t.timestamps null: false
    end
  end
end
