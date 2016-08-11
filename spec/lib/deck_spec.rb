require "spec_helper"

RSpec.describe Deck do
  it "should have 52 cards when new deck" do
    Deck.new.cards.length.should eq(52)
  end
end
