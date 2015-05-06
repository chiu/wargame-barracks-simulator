require_relative 'spec_helper'

# Resources allow you to create units. In our case (for simplicity), these resources will be stored directly within the barracks

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  it "starts off with 500 lumber" do
    expect(@barracks.lumber).to eq(500)
  end





end