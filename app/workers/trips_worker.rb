class TripsWorker
  include Sidekiq::Worker
  def perform(country_ids)
    Country.visit!(country_ids)
  end
end
