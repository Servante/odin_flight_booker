# frozen_string_literal: true

# == Schema Information

# Table name: passengers

# id                   :integer
# name                 :string
# email                :string
# booking_id           :integer
# created_at           :datetime
# updated_at           :datetime

class Passenger < ApplicationRecord
  belongs_to :booking
  has_many :flights, through: :booking
end
