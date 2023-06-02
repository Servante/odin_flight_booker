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
    let! (:vada_booking) { create(:booking, flight_id: 4200) }
    #create passenger
    let! (:passenger) { create(:passenger, booking: vada_booking, name: "Vada", email: "vada@example.com") }
    #create mailer
    let! (:mail) { PassengerMailer.welcome_email(passenger) }

   

    it 'renders the subject' do
      expect(mail.subject).to eq('Welcome to Flight Booker')
    end

    xit 'renders the receiver email' do
      expect(mail.to).to eq(user.email)
    end

    xit 'renders the sender email' do
      expect(mail.from).to eq('weslarsondev@gmail.com')
    end

    xit 'includes a welcom message in the body' do
      expect(mail.body).to match ('Welcome to Flight Booker!')
    end
  end
end