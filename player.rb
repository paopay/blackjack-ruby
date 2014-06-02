class Player
  attr_accessor :score, :hand
  def initialize
    @score = 0
    @hand = []
  end

  def bust?
    score > 21
  end

end

class Dealer < Player
end