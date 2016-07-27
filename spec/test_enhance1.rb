require_relative 'spec_helper'

describe Barracks do
  before do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  it "starts off with 500 health_points" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "health_points will be reduced by tha attack_power specified" do
      @barracks.damage(5)
      expect(@barracks.health_points).to eq(495)
    end

    it "damage amount should be a Fixnum" do
      expect(@barracks.damage(5)).to be_a Fixnum
    end
  end
end

describe Footman do
  before do
    @footman = Footman.new
    @barracks = Barracks.new
  end

  describe "#attack!" do
    context "if enemy is a barracks" do
      it "attack power is reduced in half" do
        @footman.attack!(@barracks)
        expect(@barracks.health_points).to eq(495)
      end
    end
    context "if enemy is not a barracks" do
      it "attack power is normal" do
        @enemy = Footman.new
        @footman.attack!(@enemy)
        expect(@enemy.health_points).to eq(50)
      end
    end
  end
end