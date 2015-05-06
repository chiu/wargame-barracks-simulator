require_relative 'footman'


class Barracks

  attr_accessor :gold, :food

  def food
    @food
  end

  def food=(food)
    @food = food
  end

  def initialize
    @gold = 1000
    @food = 80

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
end
