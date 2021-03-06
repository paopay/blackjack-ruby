require_relative '../game'
require 'rspec'

describe "Game" do
  let(:deck) {Deck.new}
  let(:dealer) {Dealer.new}
  let(:player) {Player.new}
  let(:game) {Game.new(player, dealer, deck)}

  context "#initialize" do
    it "should have instances of the player, dealer, and deck class" do
      expect(deck.class).to eq(Deck)
      expect(player.class).to eq(Player)
      expect(dealer.class).to eq(Dealer)
    end
  end

  context "#initial_deal" do    
    it "should deal two cards to the player" do
      expect(game.player.hand.length).to eq(2)
    end

    it "should deal two cards to the dealer" do
      expect(game.player.hand.length).to eq(2)
    end
  end

  context "#deal" do
    it "should deal one card" do
      expect{game.deal!(game.player)}.to change{game.player.hand.length}.by(1)
    end
  end

  context "#start" do
    before(:each) {game.play}
  end
end