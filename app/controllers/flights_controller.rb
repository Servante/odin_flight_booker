class FlightsController < ApplicationController
  def index
    @user_options = (Flight.all.map {|f| [f.arrival_airport.airport_code, f.arrival_airport.id]}).uniq(&:first)
    @flights = Flight.where(arrival_airport_id: params[:id])
  end
end

