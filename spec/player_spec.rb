require_relative '../player'
require 'rspec'

describe "Player" do
  let(:player) {Player.new}

  context "#bust?" do
    it "should return true if player's score is over 21" do
      player.stub(:current_score) {22}
      expect(player.bust?).to eq(true)
    end

    it "should return false if player's score is not over 21" do
      player.stub(:current_score) {10}
      expect(player.bust?).to eq(false)
    end
  end

  context "#current_score" do
    it 'should update the players score' do 
      player.hand = ['ct', 'd5', 'h3']
      player.current_score
      expect(player.current_score).to eq(18)
    end    

    it 'should be a soft ace when the score exceeds 21' do 
      player.hand = ['cj', 'd5', 'h3', 'ha']
      player.current_score
      expect(player.current_score).to eq(19)
    end

    it 'should be a hard ace when the score is below 21' do 
      player.hand = ['h3', 'ha']
      player.current_score
      expect(player.current_score).to eq(14)
    end

  end

end
