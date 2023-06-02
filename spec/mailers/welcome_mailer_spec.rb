#frozen_string_literal: true

RSpec.describe PassengerMailer, type: :mailer do 
  describe 'welcome_email' do 
    let (:passenger) { create(:passenger, name: "Vada", email: "vada@example.com") }
    let(:mail) { welcome_mailer}
  end
end