require 'rails_helper'

RSpec.describe Flight, type: :model do
  subject(:flight) { described_class.new }

  describe 'associations' do
    it { should belong_to(:departure_airport) }
    it { should belong_to(:arrival_airport) }
    it { should have_many(:bookings).dependent(:destroy) }
    it { should have_many(:passengers) }
  end
end
