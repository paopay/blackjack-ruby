require_relative 'deck.rb'
require_relative 'player.rb'
require_relative 'view.rb'

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
    player.update_current_score
    dealer.update_current_score
  end

  def deal!(plyr)
    plyr.hand << @deck.pop
  end

  def player_turn
    View.ask_player_choice
    choice = gets.chomp.downcase

    case choice
    when 'h'
      deal!(player)
      player.update_current_score
      View.show_cards_and_score(player)
      player_turn
    when 's'
      return 's'
    else
      View.wrong_choice
    end
  end

  def play
    View.show_cards_and_score(player)
    View.show_cards_and_score(dealer)
    until player.score < 21 || player_turn == 's'
      player_turn
    end

  end

end

deck = Deck.new
player = Player.new
dealer = Dealer.new
game = Game.new(player, dealer, deck)
game.play