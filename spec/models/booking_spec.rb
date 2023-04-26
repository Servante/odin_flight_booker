#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Booking, type: :model do
  subject(:booking) { described_class.new }

  describe 'associations' do
    it { should have_many(:passengers).dependent(:destroy) }
    it { should belong_to(:flight) }
    it { should accept_nested_attributes_for(:passengers) }
  end
end
