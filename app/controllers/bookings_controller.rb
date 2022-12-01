class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    ticket_count = params[:ticket_count].to_i
    ticket_count.times {@booking.passengers.build}
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :ticket_count)
  end  
end
