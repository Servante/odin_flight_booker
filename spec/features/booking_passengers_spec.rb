#frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Users can create passengers" do
  let!(:los_angeles) { create(:airport, :los_angeles, location: "Los Angeles, CA") }
  let!(:denver) { create(:airport, :denver, location: "Denver, CO") }
  
  let! (:NYC_LAX) { create(:flight, id: 5000, departure_airport: denver, arrival_airport: los_angeles) }

  scenario "with valid attributes" do
    visit "/bookings/new/?ticket_count=1&flight_id=5000&commit=Book+Flight"
    fill_in("booking_passengers_attributes_0_name", with: "Jesse James")
    fill_in("booking_passengers_attributes_0_email", with: "example@wildwest.com")
    click_on("Book Flight")
    within(".body-1") do
      expect(page).to have_content("Jesse James")
      expect(page).to have_content("Los Angeles, CA")
    end
  end
end