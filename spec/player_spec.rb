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

  context "#update_current_score" do
    it 'should update the players score' do 
      player.hand = ['ct', 'd5', 'h3']
      player.update_current_score
      expect(player.score).to eq(18)
    end
  end

end
