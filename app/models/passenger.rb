# frozen_string_literal: true

# == Schema Information

# Table name: passengers

# id                   :integer
# name                 :string
# email                :string
# created_at           :datetime
# updated_at           :datetime

class Passenger < ApplicationRecord
  belongs_to :booking
end
