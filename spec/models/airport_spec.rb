require 'rails_helper'

RSpec.describe Airport, type: :model do
  subject(:airport) { described_class.new }

  describe 'associations' do
    it { should have_many(:arriving_flights).dependent(:destroy) }
    it { should have_many(:departing_flights).dependent(:destroy) }
  end
end
