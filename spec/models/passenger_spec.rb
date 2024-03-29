#frozen_string_literal: true

require 'rails_helper'

RSpec.describe Passenger, type: :model do
  subject(:passenger) { described_class.new }

  describe 'associations' do
    it { should belong_to(:booking) }
    it { should have_many(:flights) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
  end
end 
