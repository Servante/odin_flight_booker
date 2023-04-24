#frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Users can search flights" do
  let!(:los_angeles) { create(:airport, :los_angeles, location: "Los Angeles, CA") }
  let!(:denver) { create(:airport, :denver, location: "Denver, CO") }

  let! (:NYC_LAX) { create(:flight, id: 6000, departure_airport: denver, arrival_airport: los_angeles) }

  scenario "with valid selections" do
    visit "/"
    select("Los Angeles, CA", from: "arrival_airport_id")
    select("Denver, CO", from: "departure_airport_id")
    select(3, from: "ticket_count")
    fill_in("departure_date", with: Time.zone.tomorrow)
    click_on("Search")
    within("#search-results") do
      expect(page).to have_content("LAX")
    end
  end

  scenario "with matching invalid arrival and departure airports" do
    visit "/"
    select("Los Angeles, CA", from: "arrival_airport_id")
    select("Los Angeles, CA", from: "departure_airport_id")
    select(3, from: "ticket_count")
    fill_in("departure_date", with: Time.zone.tomorrow)
    click_on("Search")
    within(".body-2") do
      expect(page).to have_content("Please select two different locations!")
    end
  end

  scenario "with no flights available that day" do
    visit "/"
    select("Los Angeles, CA", from: "arrival_airport_id")
    select("Denver, CO", from: "departure_airport_id")
    fill_in("departure_date", with: Time.zone.today)
    click_on("Search")
    within(".body-2") do
      expect(page).to have_content("We're sorry, there are no available flights for that day.")
    end
  end
end