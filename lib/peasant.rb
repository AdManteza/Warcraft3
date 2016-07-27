require_relative 'unit'

class Peasant < Unit
  attr_reader :health_points, :attack_power

  def initialize
    @health_points = 35
    @attack_power = 0
  end
end