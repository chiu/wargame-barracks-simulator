require_relative 'spec_helper'

# Units that can fight, such as the Footman, have both health points to indicate their health and attack power to indicate how much damage they deal to other units
# As such, they must start off with a certain amount of each

describe SiegeEngine do

  before :each do
    @barracks = Barracks.new 
    @siege_engine = SiegeEngine.new
  end

  describe "#check that the :each do is working good" do
    it "damage siege engine by 200 points" do
      "puts before damage:"
      puts @siege_engine.health_points
      @siege_engine.damage(200)
      "puts after damage:"
      puts @siege_engine.health_points
    end
    it "see if siege engine is rescreated fresh" do
      #expect(@siege_engine.attack_power).to eq(50)
      puts "see if siege_engine was recreated"
      puts @siege_engine.health_points
    end
  end

  describe "#check the variables of the siege engine" do
    it "has and knows its HP (health points)" do
      expect(@siege_engine.health_points).to eq(400)
    end
    it "has and knows its AP (attack power)" do
      expect(@siege_engine.attack_power).to eq(50)
    end
  end

  describe "#the siege engine attacks other clases for the correct damage; double damage for barracks, normal damage for siege engines and cannot attack for everything else" do
    it "check that the siege engine attacks the barracks for double damage" do
      @siege_engine = SiegeEngine.new
      @siege_engine.attack!(@barracks)
      expect(@barracks.health_points).to eq(400) # HP started at 500 but just got hit by ap of 12 but only takes 6 damage (see subject)
    end

    it "check that the siege engine attacks the other siege engine for normal damage" do
      @siege_engine = SiegeEngine.new
      @siege_engine_under_attack = SiegeEngine.new
      #expect(@siege_engine_under_attack.health_points).to eq(400)
      @siege_engine.attack!(@siege_engine_under_attack)
      expect(@siege_engine_under_attack.health_points).to eq(350) # HP started at 500 but just got hit by ap of 12 but only takes 6 damage (see subject)
    end

    it "siege engines cannot attack footman; should throw error" do
      @siege_engine = SiegeEngine.new
      @footman = Footman.new
      expect do 
        @siege_engine.attack!(@footman) 
      end.to raise_error ErrorGame
    end


    it "siege engines cannot attack peasant; should throw error" do
      @siege_engine = SiegeEngine.new
      @peasant = Peasant.new
      expect{@siege_engine.attack!(@peasant)}.to raise_error ErrorGame
    end

    describe "#check construction methods for siege engine" do

      it "barracks knows it can produce siege engine if it has enough resources" do
        #expect(@barracks.can_train_siege_engine?).to be_truthy
        #barracks_poor = double(Barracks)
        #barracks_poor.food = 0
        #@barracks.food = 0
        #@barracks_poor = double(Barracks,0,0,0)
       # expect(@barracks_poor.can_train_siege_engine?).to be_falsey

       #barracks_double = double("Barracks")
       #expect(@barracks).to receive(:gold).with(0)
       expect(@barracks.can_train_siege_engine?).to be_truthy
       expect(@barracks).to receive(:gold).with(0)


      end

      it "barracks knows it cannot produce a siege engine if it doesn't have enough resources" do

      end

      it "barracks can produce a siege_engine" do
        siege_engine_trained = @barracks.train_siege_engine
        expect(siege_engine_trained).to be_an_instance_of(SiegeEngine)
      end

      it "barracks actually use up resources" do
        siege_engine_trained = @barracks.train_siege_engine
        #expect(siege_engine_trained).to be_an_instance_of(SiegeEngine)
        BARRACKS_INITIAL_GOLD = 1000
        SIEGE_ENGINE_GOLD_COST = 200
        expect(@barracks.gold).to eq(BARRACKS_INITIAL_GOLD-SIEGE_ENGINE_GOLD_COST)
        BARRACKS_INITIAL_FOOD = 80
        SIEGE_ENGINE_FOOD_COST = 3
        expect(@barracks.food).to eq(BARRACKS_INITIAL_FOOD-SIEGE_ENGINE_FOOD_COST)
        
      end


    end


    

  end

end
