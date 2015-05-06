#unit.rb


# http://classic.battle.net/war3/human/units/footman.shtml

class Unit

 attr_reader  :health_points
 # attr_reader :attack_power



 def initialize(health_points, attack_power)
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = health_points
    @attack_power = attack_power

  end


  def attack!(enemy)
    #enemy.damage(10)
    enemy.damage(3)

  end

  def damage(attack_power)

    #@health_points = health_points - damage
    @health_points = health_points - attack_power

  end



end
