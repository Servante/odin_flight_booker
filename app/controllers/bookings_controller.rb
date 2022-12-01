class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, :ticket_count)
  end  
end
