#frozen_string_literal: true

class PassengerMailer < ApplicationMailer
  default from: 'weslarsondev@gmail.com'

  def confirmation_email
    @booking = Booking.find(params[:booking].id)
    @url = booking_url(@booking)
    mail(to: params[:passenger].email,
          subject: 'You have booked your ticket.')
  end
end
