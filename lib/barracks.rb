require_relative 'footman'


class Barracks

  # attr_accessor :gold, :food
  attr_reader :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      return Footman.new
    end
  end

  def can_train_footman?
    #gold >= 135 && food >= 2
    gold >= 135 && food >= 2
  end
  
  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      return Peasant.new
    end
  end

  def can_train_peasant?
   gold >= 90 && food >= 5
   
 end

 def train_siege_engine
  if can_train_peasant?
    @gold -= 200
    @food -= 3
    @lumber -= 60
    return SiegeEngine.new
  end
end

def can_train_siege_engine?
 gold >= 200 && food >= 3 && lumber >= 60
 
end

def damage(attack_power)
    #@health_points = health_points - damage
    @health_points = health_points - attack_power
  end

end
