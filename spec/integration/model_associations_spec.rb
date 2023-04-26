#frozen_string_literal: true

require 'rails_helper'

RSpec.describe "model associations" do
  
  # airports
  let!(:minneapolis) { create(:airport) }
  let!(:new_york_city) { create(:airport) }
  let!(:dallas) { create(:airport)}

  # flights
  let!(:minneapolis_to_new_york_city) { create(:flight, id: 6500, departure_airport: minneapolis, arrival_airport: new_york_city) }

  let!(:dallas_to_minneapolis) { create(:flight, id: 6501, departure_airport: dallas, arrival_airport: minneapolis) }

  # bookings
  let!(:wes_booking) { create(:booking, flight_id: 6500) }
  let!(:bria_booking) { create(:booking, flight_id: 6501) }
  let!(:vada_booking) { create(:booking, flight_id: 6500) }

  # passengers
  let!(:wes) { create(:passenger, booking: wes_booking) }
  let!(:bria) { create(:passenger, booking: bria_booking) }
  let!(:vada) { create(:passenger, booking: wes_booking) }
  
  context 'airport' do
    it "includes correct arriving flights" do
      flight = Flight.find(6501)
      expect(minneapolis.arriving_flights).to include(flight)
    end

    it "includes correct departing flights" do
      flight = Flight.find(6500)
      expect(minneapolis.departing_flights).to include(flight)
    end
  end

  context 'passenger' do
    it "includes correct flights" do
      expect(wes.flights).to include(minneapolis_to_new_york_city)
      expect(bria.flights).to include(dallas_to_minneapolis)
    end

    it "includes correct_booking" do
      expect(wes.booking).to eq(wes_booking)
      expect(bria.booking).to eq(bria_booking)
    end
  end

  context 'booking' do
    it "includes correct_passengers" do
      expect(wes_booking.passengers).to include(wes)
      expect(bria_booking.passengers).to include(bria)
    end

    it "includes correct flights" do
      expect(wes_booking.flight).to eq(minneapolis_to_new_york_city)
      expect(bria_booking.flight).to eq(dallas_to_minneapolis)
    end

    it "knows passenger count" do 
      expect(wes_booking.passengers.count).to eq(2)
    end
  end

  context 'flight' do
    it "includes correct passengers" do
      expect(minneapolis_to_new_york_city.passengers).to include(vada, wes)
      expect(dallas_to_minneapolis.passengers).to include(bria)
    end

    it "includes correct booking" do
      expect(minneapolis_to_new_york_city.bookings).to include(wes_booking)
      expect(dallas_to_minneapolis.bookings).to include(bria_booking)
    end
  end
end