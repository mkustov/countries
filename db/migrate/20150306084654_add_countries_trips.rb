class AddCountriesTrips < ActiveRecord::Migration
  def change
    create_table :countries_trips, id: false do |t|
      t.belongs_to :country, index: true
      t.belongs_to :trip, index: true
    end
  end
end
