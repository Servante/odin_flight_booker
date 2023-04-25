#frozen_string_literal: true

require 'rails_helper'

RSpec.describe "model associations" do
  
  # airports
  let!(:minneapolis) { create(:airport) }
  let!(:new_york_city) { create(:airport) }
  let!(:dallas) { create(:airport)}

  # flights
  let!(:HHH_NYC) { create(:flight, id: 6500, departure_airport: minneapolis, arrival_airport: new_york_city) }

  let!(:DFW_HHH) { create(:flight, id: 6501, departure_airport: dallas, arrival_airport: minneapolis) }

  # bookings
  let!(:wes_booking) { create(:booking, flight_id: 6500) }
  let!(:bria_booking) { create(:booking, flight_id: 6501) }

  # passengers
  let!(:wes) { create(:passenger, booking: wes_booking) }
  let!(:bria) { create(:passenger, booking: bria_booking)}
  
  context 'airport' do
    it "includes correct arriving flights" do
      flight = Flight.find(6501)
      expect(minneapolis.arriving_flights).to include(flight)
    end

    it "includes correct departing flights" do
      flight = Flight.find(6500)
      expect(minneapolis.departing_flights). to include(flight)
    end
  end

  context 'passenger' do
    xit "includes correct flights" do
      #add associations 
    end

    xit "includes correct_booking" do
    end
  end

  context 'booking' do
    xit "includes correct_passengers" do
    end

    xit "includes correct flights" do
    end

    xit "knows passenger count" do 
    end
  end

  context 'flight' do
    xit "includes correct passengers" do
    end

    xit "includes correct booking" do
    end
  end
end