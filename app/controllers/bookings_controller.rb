class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight_id])
    ticket_count = params[:ticket_count].to_i
    ticket_count.times {@booking.passengers.build}
  end

  def create
    @booking = Booking.new(passenger_params)
    @flight = Flight.find(passenger_params[:flight_id])
    @flight.bookings << @booking

    if @booking.save
      redirect_to @booking
    else 
      render :show, status: :unprocessable_entity
    end
  end
  

  private

  def passenger_params
    params.require(:booking).permit(:flight_id, :ticket_count, passengers_attributes: [:name, :email])
  end  
end
