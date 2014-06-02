require_relative 'deck'
require_relative 'player'
require_relative 'view'

class Game
  attr_reader :player, :dealer
  def initialize(player, dealer, deck)
    @deck = deck.cards
    @dealer = dealer
    @player = player
    initial_deal
  end

  def play
    player_turn
    dealer_turn
    compare_score
  end

  def deal!(plyr)
    plyr.hand << @deck.pop
    View.card_drawn(plyr)
    plyr.current_score
    View.show_cards_and_score(plyr)
  end
  
  private
  
  def initial_deal
    2.times do
      deal!(player)
      deal!(dealer)
    end
  end


  def player_turn
    View.ask_player_choice
    choice = gets.chomp.downcase

    case choice
    when 'h'
      deal!(player)
      return if player.bust?
      player_turn
    when 's'
      return
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

end
