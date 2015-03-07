require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should have_and_belong_to_many :countries }

  describe '#visit_countries' do
    let(:trip) { build :trip }
    let(:country) { create :country }

    it 'without countries does not trigger Country.visit!' do
      expect(Country).not_to receive(:visit)
      trip.save
    end

    it 'triggers Country.visit!' do
      trip.country_ids = country.id
      expect(Country).to receive(:visit!).with([country.id])
      trip.save
    end

    it 'enqueues job if date is in future' do
      trip.country_ids = country.id
      trip.date = 2.days.from_now
      expect(Country).not_to receive(:visit!)
      expect(TripsWorker).to receive(:perform_in)
      trip.save
    end
  end
end
