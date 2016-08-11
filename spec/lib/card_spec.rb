require "spec_helper"

describe Card do

  it "should accept suit and value when building" do
    card = Card.new(:clubs, 10)
    card.suit.should eq(:clubs)
    card.value.should eq(10)
  end

  it "should have a value of 10 for facecards" do
    cards = ["J", "Q", "K"]
    cards.each do |facecard|
      card = Card.new(:hearts, facecard)
      card.value.should eq(10)
    end
  end

  it "should have a value of 7 for the 7 of diamonds" do
    card = Card.new(:diamonds, 7)
    card.value.should eq(7)
  end
end
