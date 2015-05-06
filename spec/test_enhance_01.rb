#test_enhance_01.rb

require_relative 'spec_helper'

# Barracks should also be able to train peasants, much like they could train footmen

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#this barrack has hp of 500" do
    it "barrack has health points of 500" do
      expect(@barracks.health_points).to eq(500) # starts at 1000
    end

    
  end

  describe "#this barrack can be attacked by units at half damage" do
    it "check damage amount" do
      @footman = Footman.new

    
      @footman.attack!(@barracks)

      expect(@barracks.health_points).to eq(495) # HP started at 500 but just got hit by ap of 12 but only takes 6 damage (see subject)
    end
  end

end
