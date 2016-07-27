# require_relative ''

class Unit
  
  class TheWalkingDeadError < StandardError
  end

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def health_points
    @health_points
  end

  def attack!(enemy_unit)
    if enemy_unit.dead?
      raise TheWalkingDeadError, "Respect the DEAD dude!"
    elsif self.dead?
      raise TheWalkingDeadError, "You are not a Zombie!!!"
    else
      enemy_unit.damage(@attack_power)
    end
  end

  def damage(attack_power)
    if @health_points < attack_power
      @health_points -= @health_points #instant death!
    else
      @health_points -= attack_power
    end
  end

  def dead?
    if @health_points == 0
      return true
    else
      return false
    end
  end
end

