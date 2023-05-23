#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flight, type: :model do
  subject(:flight) { described_class.new }

  describe 'associations' do
    it { should belong_to(:departure_airport) }
    it { should belong_to(:arrival_airport) }
    it { should have_many(:bookings).dependent(:destroy) }
    it { should have_many(:passengers) }
  end

  context 'for methods that return' do
    let(:atlanta) { create(:airport, :atlanta) }
    let(:chicago) { create(:airport, :chicago) }
    subject(:flight_to_ORD) do
      create(:flight, 
            departure_airport_id: atlanta.id,
            arrival_airport_id: chicago.id, 
            flight_duration: 224)
    end

    describe "#time_conversion" do 
      it 'returns flight duration in hours and minutes' do 
        expect(flight_to_ORD.time_conversion).to_eq("3hr 44min")
      end
    end
  end
end