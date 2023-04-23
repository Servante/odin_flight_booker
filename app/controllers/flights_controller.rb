# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @airport_options = (Airport.all.map {|a| [a.location, a.id]})
    @flights = Flight.where(arrival_airport_id: search_params[:arrival_airport_id], 
                            departure_airport_id: search_params[:departure_airport_id],
                            departure_date: search_params[:departure_date])
  end

  private 

  def search_params
    params.permit(:arrival_airport_id, :departure_airport_id, :departure_date)
  end
end

