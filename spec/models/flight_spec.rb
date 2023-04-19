require 'rails_helper'

RSpec.describe Flight, type: :model do
  
  before(:all) do 
    @flight1 = create(:flight)
  end

  it "is valid with valid attributes" do
    expect(@flight1).to be_valid
  end
end
