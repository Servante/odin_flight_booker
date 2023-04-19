FactoryBot.define do 

  factory :airport do 
    airport_code { "SFO" }
    location { "San Francisco, CA" }
  end

  trait :new_york_city do
    airport_code { "NYC" }
  end

  trait :atlanta do
    airport_code { "ATL" }
  end

  trait :chicago do
    airport_code { "ORD" }
  end

  trait :los_angeles do 
    airport_code { "LAX" }
  end

  trait :dallas do
    airport_code { "DFW" }
  end

  trait :orlando do
    airport_code { "MCO" }
  end

  trait :denver do
    airport_code { "DEN" }
  end

end