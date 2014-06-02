class Player
  attr_accessor :score, :hand
  def initialize
    @score = 0
    @hand = []
  end

  def bust?
    self.score > 21
  end

  def update_current_score
    values = []
    hand.each {|card| values << card[1]}
    @score = 0

    values.each do |value|
      @score += value.to_i if value =~ /\d/
      @score += 10 if value =~ /[t, j, q, k]/
      if value =~ /[a]/
        @score + 11 > 21 ? @score += 1 : @score += 11
      end
    end
  end
end

class Dealer < Player
end
