class View

  def self.divider
    p "-=" * 40
  end

  def self.show_cards_and_score(plyr)
    self.divider
    cards = plyr.hand.join(" ")
    puts "#{plyr} cards: #{cards} = #{plyr.current_score} \n"
  end

  def self.wrong_choice
    self.divider
    puts "Please type 'h' to hit or 's' to stay. \n"
  end

  def self.card_drawn(plyr)
    self.divider
    puts "#{plyr} drew: #{plyr.hand.last}"
  end

  def self.ask_player_choice
    self.divider
    puts "Hit or Stay(h/s)? \n"
  end

  def self.player_bust
    self.divider
    puts "Player busted!\nYou lose!"
  end

  def self.dealer_bust
    self.divider
    puts "Dealer busted!\nYou win!"
  end

  def self.player_wins
    self.divider
    puts "You got a higher score.\nYou win!"
  end

  def self.blackjack!
    self.divider
    puts "BLACKJACK! YOU WIN DOUBLE!"
  end

  def self.player_loses
    self.divider
    puts "Dealer scored higher.\nYou lose"
  end

  def self.draw
    self.divider
    puts "It's a draw..."
  end
end