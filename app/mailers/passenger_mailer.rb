class PassengerMailer < ApplicationMailer
  default from: 'wesley.larson73@gmail.com'

  def confirmation_email
    @booking = Booking.find(params[:booking].id)
    @url = booking_url(@booking)
    mail(to: params[:passenger].email,
          subject: 'You have booked your ticket.')
  end
end
