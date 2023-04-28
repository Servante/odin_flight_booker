#frozen_string_literal: true

require 'rails_helper'

RSpec.describe "add booking", type: :system do 
  it "allows a user to search flights, select a booking option, and create a booking" do
    los_angeles = create(:airport, :los_angeles, location: "Los Angeles, CA")
    minneapolis = create(:airport, :minneapolis, location: "Minneapolis, MN")
    phoenix = create(:airport, :phoenix, location: "Phoenix, AZ")

    create(:flight, id: 1, departure_airport: minneapolis, arrival_airport: phoenix)
    create(:flight, id: 2, departure_airport: los_angeles, arrival_airport: minneapolis)

    visit "/"
    select("Phoenix, AZ", from: "arrival_airport_id")
    select("Minneapolis, MN", from: "departure_airport_id")
    select(3, from: "ticket_count")
    fill_in("departure_date", with: Time.zone.tomorrow)
    click_on("Search")
    within("#search-results") do
      expect(page).to have_content("Minneapolis, MN")
    end
    choose 'flight_id_1'
    click_on("Book Flight")
    fill_in("booking_passengers_attributes_0_name", with: "Wes Larson")
    fill_in("booking_passengers_attributes_0_email", with: "wes@example.com")
    fill_in("booking_passengers_attributes_1_name", with: "Bria Larson")
    fill_in("booking_passengers_attributes_1_email", with: "bria@example.com")
    fill_in("booking_passengers_attributes_2_name", with: "Vada Larson")
    fill_in("booking_passengers_attributes_2_email", with: "vada@example.com")
    click_on("Book Flight")
    within(".body-1") do
      expect(page).to have_content("Wes Larson")
      expect(page).to have_content("Bria Larson")
      expect(page).to have_content("Vada Larson")
      expect(page).to have_content("Minneapolis, MN")
      expect(page).not_to have_content("Los Angeles, CA")
    end
  end
end
