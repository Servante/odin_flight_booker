FactoryBot.define do 
  
  factory :flight do 
    departure_airport_id { "" }
    arrival_airport_id { "" }
    departure_time { "noon" }
    departure_date { Time.zone.tomorrow }
    created_at { Time.zone.today }
    updated_at { Time.zone.today }
    flight_duration { "8hr" }
  end

end