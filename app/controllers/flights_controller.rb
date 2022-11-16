class FlightsController < ApplicationController
  def index
    @airport_options = (Airport.all.map {|a| [a.airport_code, a.id]})
    @flights = Flight.where(arrival_airport_id: params[:arrival_airport_id], 
                            departure_airport_id: params[:departure_airport_id])
  end
end

