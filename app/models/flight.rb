# frozen_string_literal: true

# == Schema Information

# Table name: flights

# id                   :integer
# departure_airport_id :integer
# arrival_airport_id   :integer
# departure_time       :datetime
# flight_duration      :integer
# created_at           :datetime
# updated_at           :datetime



class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport'
  belongs_to :arrival_airport, class_name: 'Airport'
  has_many :bookings, dependent: :destroy
  has_many :passengers, through: :bookings  

 
  #returns flight_duration in hours and minutes
  def time_conversion                    
    m_dtime = flight_duration.to_i
    hours = m_dtime / 60
    mins = m_dtime % 60
    return "#{hours}hr #{mins}min"
  end

end


