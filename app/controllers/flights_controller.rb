class FlightsController < ApplicationController
  def index
    @arrival_options = (Flight.all.map {|f| [f.arrival_airport.airport_code, f.arrival_airport.id]}).uniq(&:first)
    @departure_options = (Flight.all.map {|f| [f.departure_airport.airport_code, f.departure_airport.id]}).uniq(&:first)
    @flights = Flight.where(arrival_airport_id: params[:arrival_airport_id], departure_airport_id: params[:departure_airport_id])
  end
end

