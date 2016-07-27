require_relative 'spec_helper'

describe Unit do

  describe "#dead?" do
    context "health_points is more than zero" do
      it "returns false" do
        @unit = Unit.new(10, 5)
        expect(@unit.dead?).to eq(false)
      end
    end
  end

  describe "#attack!" do
    context "when the enemy_unit is dead" do
      it "raises an Exception" do
        @attacker = Unit.new(10, 20)
        @enemy_unit = Unit.new(0, 20)
        expect{ @attacker.attack!(@enemy_unit) }.to raise_error(Unit::TheWalkingDeadError)
      end
    end
    context "when the attacker is dead" do
      it "raises an exception" do
        @attacker = Unit.new(0, 20)
        @enemy_unit = Unit.new(10, 20)
        expect{ @attacker.attack!(@enemy_unit) }.to raise_error(Unit::TheWalkingDeadError)
      end
    end
  end

  describe "#damage" do
    context "health_points is less than attack_power" do
      it "health_points will be zero" do
        @unit = Unit.new(10, 20)
        @unit.damage(20)
        expect(@unit.health_points).to eq(0)
      end
    end
  end
end