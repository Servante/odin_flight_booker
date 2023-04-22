FactoryBot.define do 

  factory :airport do 
    airport_code { "TOP" }
    location { "Minneapolis, MN" }
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
    id { 33 }
  end

  trait :dallas do
    airport_code { "DFW" }
  end

  trait :orlando do
    airport_code { "MCO" }
  end

  trait :denver do
    airport_code { "DEN" }
    id { 41 }
  end

  trait :minneapolis do 
    airport_code { "HHH" }
    id { 42 }
  end

  trait :phoenix do 
    airport_code { "PHX" }
    id { 43 }
  end
end