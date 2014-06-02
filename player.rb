class Player
  attr_accessor :hand
  def initialize
    @hand = []
  end

  def bust?
    self.current_score > 21
  end

  def current_score
    values = []
    hand.each {|card| values << card[1]}
    score = 0

    values.each do |value|
      score += value.to_i if value =~ /\d/
      score += 10 if value =~ /[t, j, q, k]/
      if value =~ /[a]/
        score + 11 > 21 ? score += 1 : score += 11
      end
    end
    score
  end
end

class Dealer < Player
end
