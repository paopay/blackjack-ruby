class Deck
  attr_accessor :cards
  def initialize
    @cards = []

    suits = %w(c d h s)
    values = %w(2 3 4 5 6 7 8 9 10 j q k a)

    suits.each do |suit|
      values.each do |value|
        @cards << suit+value
      end
    end
    @cards.shuffle!
  end
end

