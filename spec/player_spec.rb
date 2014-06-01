require_relative '../player.rb'
require 'rspec'

describe "Player" do
  let(:player) {Player.new}

  context "#bust?" do
    it "should return true if player's score is over 21" do
      player.score = 22
      expect(player.bust?).to eq(true)
    end

    it "should return false if player's score is not over 21" do
      player.score = 10
      expect(player.bust?).to eq(false)
    end
  end
end
