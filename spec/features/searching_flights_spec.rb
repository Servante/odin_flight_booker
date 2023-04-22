#frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Users can search flights" do
  let!(:los_angeles) { create(:airport, :los_angeles, location: "Los Angeles, CA") }
  let!(:denver) { create(:airport, :denver, location: "Denver, CO") }

  let (:flight) { create(:flight, id: 1, departure_airport: denver, arrival_airport: los_angeles, departure_date: "2023-04-21") }

  scenario "with valid selections" do
    visit "/"
    select("Los Angeles, CA", from: "arrival_airport_id")
    select("Denver, CO", from: "departure_airport_id")
    select(3, from: "ticket_count")
    fill_in("departure_date", with: "2023-04-21")
    click_on("Search")
    within("#search-results") do
      expect(page).to have_content("LAX")
    end
  end
end