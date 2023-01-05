# frozen_string_literal: true

# == Schema Information

# Table name: bookings

# id                   :integer
# flight_id            :integer
# created_at           :datetime
# updated_at           :datetime

class Booking < ApplicationRecord
  belongs_to :flight, foreign_key: :flight_id
  has_many :passengers, dependent: :destroy
  accepts_nested_attributes_for :passengers
end
