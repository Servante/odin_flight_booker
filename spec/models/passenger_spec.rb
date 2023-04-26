require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject(:passenger) { described_class.new }

  describe 'associations' do
    it { should belong_to(:booking) }
    it { should have_many(:flights) }
  end
end 