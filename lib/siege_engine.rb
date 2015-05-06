# http://classic.battle.net/war3/human/units/footman.shtml

require_relative 'unit'


class SiegeEngine < Unit

  attr_reader :attack_power



  
  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = 400
    @attack_power = 50
  end

  def attack!(enemy)
   if enemy.class == Barracks
    enemy.damage(attack_power * 2)
  elsif enemy.class == SiegeEngine
    enemy.damage(attack_power)
  else
   raise ErrorGame.new("test string") , 'SiegeEngine may only attack barracks or other siege engines' 
 end
end

def damage(attack_power)
  @health_points = health_points - attack_power
end


# def method_test
#   @attack_power = 99

# end

end
