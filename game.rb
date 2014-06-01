require_relative 'deck.rb'
require_relative 'player.rb'

class Game
  def initialize(player, dealer, deck)
    @dealer = dealer
    @player = player
    @deck = deck.cards
  end
end