require_relative 'spec_helper'

# A Barracks should only be able to train footmen if it has enough resources
# Introduce a new method that checks to see if there are enough resources to train one
# Of course, it should then also be leveraged by the train_footman method

describe Unit do

  before :each do
    @unit = Unit.new(10,50)
  end

  describe "#can units die? " do

    it "does unit die if hp < 0 ?" do
     @unit.should_receive(:health_points).and_return(-10)
     expect(@unit.dead?).to be_truthy
   end

     it "does unit die when hp = 0? " do
     @unit.should_receive(:health_points).and_return(0)
     expect(@unit.dead?).to be_truthy
   end

  it "does unit die when hp > 0; it should not die? " do
     @unit.should_receive(:health_points).and_return(10)
     expect(@unit.dead?).to be_falsey
   end








 end


end
