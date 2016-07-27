# http://classic.battle.net/war3/human/units/footman.shtml
require_relative 'unit'
require_relative 'barracks'

class Footman < Unit

  class TheWalkingDeadError < StandardError
  end

  attr_reader :health_points, :attack_power

  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = 60
    @attack_power = 10
  end

  def attack!(enemy)
    
    if check_if_enemy_is_a_barracks?(enemy)
      ceil = @attack_power / 2
      enemy.damage(ceil)
    else
      super(enemy)
    end

  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  private

  def check_if_enemy_is_a_barracks?(enemy)
    enemy.is_a? Barracks
  end

end



