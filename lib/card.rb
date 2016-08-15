require_relative 'deck'

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    if ["J", "Q", "K"].include?(@value)
      10
    elsif @value == "A"
      11
    else
      @value
    end
  end

  def to_s
    "#{@value}-#{suit}"
  end
end
