#frozen_string_literal: true
require 'rails_helper'

RSpec.describe PassengerMailer, type: :mailer do 
  describe 'welcome_email' do 
    #create airports
    let!(:minneapolis) { create(:airport) }
    let!(:new_york_city) { create(:airport) }
    #create flight
    let!(:minneapolis_to_new_york_city) { create(:flight, id: 4200, departure_airport: minneapolis, arrival_airport: new_york_city) }
    #create booking
    let! (:vada_booking) { create(:booking, flight_id: 4200, id: 23) }
    #create passenger
    let! (:passenger) { create(:passenger, booking: vada_booking, name: "Vada", email: "vada@example.com") }
    #create mailer
    let! (:mail) { PassengerMailer.with(booking: vada_booking, passenger: passenger).confirmation_email }

   

    it 'renders the subject' do
      expect(mail.subject).to eq("You have booked your ticket.")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(["#{passenger.email}"])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(["weslarsondev@gmail.com"])
    end

    it 'includes a welcome message in the body' do
      text = "Hello #{passenger.name}, your flight has been booked."
      expect(mail.body.encoded).to match(text)
    end

    it 'sends a confirmation email' do 
      expect {mail.deliver_now}.to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end
end