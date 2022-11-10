# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Airport.create!(airport_code: "ANC", location: "Anchorage, AK")
Airport.create!(airport_code: "BJI", location: "Bemidji, MN")
Airport.create!(airport_code: "DRY ", location: "Derry, ME ")
Airport.create!(airport_code: "DFW", location: "Dallas/Fort Worth, TX")
Airport.create!(airport_code: "MSP", location: "Minneapolis, MN")
Airport.create!(airport_code: "PDX", location: "Portland, OR")
Airport.create!(airport_code: "PHX", location: "Phoenix, AZ")
Airport.create!(airport_code: "DEN", location: "Denver, CO")
Airport.create!(airport_code: "LAX", location: "Los Angeles")
Airport.create!(airport_code: "HNL", location: "Honolulu, HI ")


Flight.create!(departure_airport_id: 1, arrival_airport_id: 2, start: Time.now, flight_duration: '10hr')
Flight.create!(departure_airport_id: 1, arrival_airport_id: 3, start: Time.now, flight_duration: '9hr')
Flight.create!(departure_airport_id: 2, arrival_airport_id: 5, start: Time.now, flight_duration: '8hr')
Flight.create!(departure_airport_id: 8, arrival_airport_id: 10, start: Time.now, flight_duration: '7hr')
Flight.create!(departure_airport_id: 2, arrival_airport_id: 4, start: Time.now, flight_duration: '6hr')
Flight.create!(departure_airport_id: 6, arrival_airport_id: 7, start: Time.now, flight_duration: '5hr')
Flight.create!(departure_airport_id: 6, arrival_airport_id: 1, start: Time.now, flight_duration: '4hr')
Flight.create!(departure_airport_id: 3, arrival_airport_id: 8, start: Time.now, flight_duration: '3hr')
Flight.create!(departure_airport_id: 6, arrival_airport_id: 10, start: Time.now, flight_duration: '2hr')
Flight.create!(departure_airport_id: 3, arrival_airport_id: 6, start: Time.now, flight_duration: '1hr')
Flight.create!(departure_airport_id: 2, arrival_airport_id: 6, start: Time.now, flight_duration: '1hr')