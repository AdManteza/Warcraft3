require_relative 'unit'
require_relative 'barracks'
require_relative 'footman'
require_relative 'peasant'

class SeigeEngine < Unit

  class ShameError < StandardError
  end

  def initialize
    @health_points = 400
    @attack_power = 50
    @cost = { gold: 200, food: 3, lumber: 60 }
  end

  def attack!(enemy)
    raise ShameError, "Shame! Shame! Shame!" if enemy_is_valid?(enemy)

    if enemy_is_a_barracks?(enemy)
      @attack_power *= 2
      enemy.damage(@attack_power)
    else
      super(enemy)
    end
  end

  private

  def enemy_is_valid?(enemy)
    enemy.is_a?(Footman) || enemy.is_a?(Peasant)
  end

  def enemy_is_a_barracks?(enemy)
    enemy.is_a?(Barracks)
  end

end

