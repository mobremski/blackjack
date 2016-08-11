require "spec_helper"

RSpec.describe Game do

  it "should have a players hand" do
    Game.new.player_hand.cards.length.should eq(2)
  end
  it "should have a dealers hand" do
    Game.new.dealer_hand.cards.length.should eq(2)
  end
  it "should have a status" do
    Game.new.status.should_not be_nil
  end
  it "should hit when I tell it to" do
    game = Game.new
    game.hit
    game.player_hand.cards.length.should eq(3)
  end

  it "should play the dealer hand when I stand" do
    game = Game.new
    game.stand
    game.status[:winner].should_not be_nil
  end

  describe "#determine_winner" do
    it "should have dealer win when player busts" do
      game = Game.new.determine_winner(22, 15)
      expect(game).to eq(:dealer)
    end
    it "should player win if dealer busts" do
      Game.new.determine_winner(18, 22).should eq(:player)
    end
    it "should have player win if player > dealer" do
      Game.new.determine_winner(18, 16).should eq(:player)
    end
    it "should have push if tie" do
      Game.new.determine_winner(16, 16).should eq(:push)
    end
  end
end
