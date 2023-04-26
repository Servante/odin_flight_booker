# frozen_string_literal: true

# == Schema Information

# Table name: airports

# id                   :integer
# airport_code         :string
# location             :string
# created_at           :datetime
# updated_at           :datetime


class Airport < ApplicationRecord
  has_many :arriving_flights, class_name: 'Flight', foreign_key: :arrival_airport_id, dependent: :destroy
  has_many :departing_flights, class_name: 'Flight', foreign_key: :departure_airport_id, dependent: :destroy
end
