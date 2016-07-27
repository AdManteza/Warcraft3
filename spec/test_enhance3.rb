require_relative 'spec_helper'

describe Barracks do 

  it "starts off with 500 lumber" do
    @barracks = Barracks.new
    expect(@barracks.lumber).to eq(500)
  end
  
end

describe SeigeEngine do

  before do
    @seige_engine = SeigeEngine.new
  end
  
  describe "#attack!" do
    context "enemy is not a barracks" do
      it "raises an exception" do
        @footman = Footman.new
        expect{ @seige_engine.attack!(@footman) }.to raise_error(SeigeEngine::ShameError)
      end
    end
    context "enemy is a barracks" do
      it "has twice the attack_power" do
        @barracks = Barracks.new
        @seige_engine.attack!(@barracks)
        expect(@barracks.health_points).to eq(400)
      end
    end
    context "enemy is another seige_engine" do
      it "has the normal attack_power" do
        @seige_engine1 = SeigeEngine.new
        @seige_engine.attack!(@seige_engine1)
        expect(@seige_engine1.health_points).to eq(350)
      end
    end

  end

end