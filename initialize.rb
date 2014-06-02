require_relative 'game'

deck = Deck.new
player = Player.new
dealer = Dealer.new
game = Game.new(player, dealer, deck)
game.play