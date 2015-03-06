class Trip < ActiveRecord::Base
  has_and_belongs_to_many :countries
  after_save :visit_countries, if: :country_ids_present?

  private

  def visit_countries
    diff = (DateTime.parse(date.to_s) - DateTime.now.at_midnight).to_i
    diff <= 0 ? Country.visit!(country_ids) : TripsWorker.perform_in(diff.days, country_ids)
  end

  def country_ids_present?
    country_ids.present?
  end
end
