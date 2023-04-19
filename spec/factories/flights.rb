FactoryBot.define do 
  
  factory :flight do 
    departure_airport { Airport.new(airport_code: 180, location: "san francisco") }
    arrival_airport { Airport.new(airport_code: 195, location: "minneapolis") }
    departure_time { "noon" }
    flight_duration { "8hr" }
  end

end