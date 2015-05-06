require_relative 'spec_helper'

# A Barracks should only be able to train footmen if it has enough resources
# Introduce a new method that checks to see if there are enough resources to train one
# Of course, it should then also be leveraged by the train_footman method

describe Unit do

  before :each do
    @unit = Unit.new(100,10)
    @enemy = Unit.new(100,10)
  end

  describe "#can units die? " do

    it "does unit die if hp < 0 ?" do
     @unit.should_receive(:health_points).and_return(-10)
     expect(@unit.dead?).to be_truthy
   end

     it "expect dead unit to not be able to attack? " do
     @unit.should_receive(:health_points).and_return(-10)
     expect { @unit.attack!(@enemy) }.to raise_error ErrorGame
   end


      it "expect alive unit to be able to attack just fine? " do
     @unit.should_receive(:health_points).and_return(100)
     #@enemy.should_receive(:health_points).and_return(50)
  
     @unit.attack!(@enemy)
     expect(@enemy.health_points).to eql(90)
   end


 end
end
