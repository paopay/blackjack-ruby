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
      deal!(player)
      deal!(dealer)
    end
  end

  def deal!(plyr)
    plyr.hand << @deck.pop
    View.card_drawn(plyr)
    plyr.current_score
    View.show_cards_and_score(plyr)
  end

  def player_turn
    View.ask_player_choice
    choice = gets.chomp.downcase

    case choice
    when 'h'
      deal!(player)
      play
    when 's'
      return nil
    else
      View.wrong_choice
      player_turn
    end
  end

  def dealer_turn
    until dealer.current_score >= 17
      deal!(dealer)
      dealer_turn
    end
  end

  def compare_score
    if player.current_score == 21
      View.blackjack!
    elsif player.current_score > 21
      View.player_bust        
    elsif dealer.current_score > 21
      View.dealer_bust
    elsif player.current_score > dealer.current_score
      View.player_wins
    elsif player.current_score < dealer.current_score
      View.player_loses
    elsif player.current_score == dealer.current_score
      View.draw
    end
  end

  def play
    until player.bust?
      break if player.current_score == 21
      break if player_turn == nil
      player_turn
    end
    dealer_turn
    compare_score
  end

end

deck = Deck.new
player = Player.new
dealer = Dealer.new
game = Game.new(player, dealer, deck)
game.play