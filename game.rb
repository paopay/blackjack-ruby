require_relative 'deck.rb'
require_relative 'player.rb'

class Game
  attr_reader :player, :dealer
  def initialize(player, dealer, deck)
    @deck = deck.cards
    @dealer = dealer
    @player = player
    initial_deal
  end

  def initial_deal
    2.times do
      dealer.hand << @deck.pop
      player.hand << @deck.pop
    end
  end


  def start!
  end
end