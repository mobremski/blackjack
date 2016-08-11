require "spec_helper"

RSpec.describe Hand do
  it "should calculate the value correctly" do
    deck = double(:deck, :cards => [Card.new(:clubs, 4), Card.new(:diamonds, 10)])
    hand = Hand.new
    2.times { hand.hit!(deck) }
    hand.value.should eq(14)
  end

  it "should take from the top of the deck" do
    club4 = Card.new(:clubs, 4)
    diamond7 = Card.new(:diamonds, 7)
    clubK = Card.new(:clubs, "K")

    deck = double(:deck, :cards => [club4, diamond7, clubK])
    hand = Hand.new
    2.times { hand.hit!(deck) }
    hand.cards.should eq([club4, diamond7])

  end

  describe "#play_as_dealer" do
    it "should hit below 17" do
      deck = double(:deck, :cards => [Card.new(:clubs, 10), Card.new(:diamonds, 7)])
      hand = Hand.new
      2.times { hand.hit!(deck) }
      hand.play_as_dealer(deck)
      hand.value.should eq(17)
    end

    it "should not hit above 17" do
      deck = double(:deck, :cards => [Card.new(:clubs, 8), Card.new(:diamonds, 10)])
      hand = Hand.new
      2.times { hand.hit!(deck) }
      hand.play_as_dealer(deck)
      hand.value.should eq(18)
    end

    it "should stop on 21" do
      deck = double(:deck, :cards => [Card.new(:clubs, 4),
                                    Card.new(:diamonds, 7),
                                    Card.new(:clubs, "K")])
      hand = Hand.new
      2.times { hand.hit!(deck) }
      hand.play_as_dealer(deck)
      hand.value.should eq(21)
    end
  end
end
