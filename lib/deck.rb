require_relative "card"

class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = Deck.build_deck
  end

  def self.build_deck
    cards = []
    SUITS.each do |suit|
      RANKS.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards.shuffle!
  end
end
