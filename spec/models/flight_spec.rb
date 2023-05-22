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
      create (:flight, 
              departure_id: atlanta.id,
              arrival_id: chicago.id,
              flight_duration: 224)
      end

    describe
  end
end