class Booking < ApplicationRecord
  belongs_to :flight, foreign_key: :flight_id
  has_many :passengers
end
