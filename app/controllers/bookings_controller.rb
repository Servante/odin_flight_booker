#frozen_string_literal: true

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

    respond_to do |format|
      if @booking.save
        @booking.passengers.each do |passenger|
          PassengerMailer.with(passenger: passenger, booking: @booking, url: bookings_url(@booking.id)).confirmation_email.deliver_now
        end
        format.html { redirect_to booking_url(@booking) }
      else 
        format.html { render :new, status: unprocessable_entity }
      end
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = Flight.find(@booking.flight_id)
  end
  

  private

  def passenger_params
    params.require(:booking).permit(:flight_id, :ticket_count, passengers_attributes: [:name, :email])
  end  
end
