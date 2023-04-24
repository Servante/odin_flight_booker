# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    @airport_options = (Airport.all.map {|a| [a.location, a.id]})
    return if search_params.empty?


    @flights = find_flights
  end

  private 

  def search_params
    params.permit(:arrival_airport_id, :departure_airport_id, :departure_date, :ticket_count, :commit)
  end

  def find_flights 
    if search_params[:arrival_airport_id] === params[:departure_airport_id] 
      flash.now[:alert] = "Please select two different locations!"
      render :index
    else
      return flights = Flight.where(arrival_airport_id: search_params[:arrival_airport_id], 
        departure_airport_id: search_params[:departure_airport_id],
        departure_date: search_params[:departure_date])
    end
  end
end

