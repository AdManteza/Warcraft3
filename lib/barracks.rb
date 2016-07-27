require_relative 'footman'
require_relative 'peasant'

class Barracks 

  attr_reader :gold, :food, :health_points, :lumber

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end

  def can_train_footman?
    return true if self.gold > 135 && self.food > 2
  end

  def can_train_peasant?
    return true if self.gold > 90 && self.food > 5
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2

      Footman.new
    else
      return nil
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5

      Peasant.new
    else
      return nil
    end
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

end








