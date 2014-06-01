require_relative '../deck.rb'
require_relative '../player.rb'
require 'rspec'

describe "Game" do
  let(:deck) {Deck.new}
  let(:dealer) {Dealer.new}
  let(:player) {Player.new}
  let(:game) {Game.new(player, dealer, deck)}

  context
end