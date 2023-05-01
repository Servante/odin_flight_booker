# frozen_string_literal: true

require "rails_helper"

RSpec.describe FlightGenerator do 
  let(:tomorrow) { Time.zone.tomorrow }
  subject(:flight_generator) { described_class.new(tomorrow) }

  describe "#create_flights" do
    before do 
      create(:airport, airport_code: "SFO", location: "San Francisco, CA")
      create(:airport, airport_code: "NYC", location: "New York City, NY")
      create(:airport, airport_code: "ATL", location: "Atlanta, GA")
      create(:airport, airport_code: "ORD", location: "Chicago, IL")
      create(:airport, airport_code: "LAX", location: "Los Angeles, CA")
      create(:airport, airport_code: "DFW", location: "Dallas, TX")
      create(:airport, airport_code: "MCO", location: "Orlando, FL")
      create(:airport, airport_code: "DEN", location: "Denver, CO")
    end

    it "increases flight count by the daily flight count" do
      airport_pairs = 56
      flights_per_day = 3
      daily_flight_count = airport_pairs * flights_per_day
      expect { flight_generator.call }.to change(Flight, :count).by(daily_flight_count)
    end
  end
end