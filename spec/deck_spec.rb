require_relative '../deck.rb'
require 'rspec'

describe "Deck" do
  let(:deck) {Deck.new}

  context "initialize" do
    it "should create a card array" do
      expect(deck.cards).to be_an(Array)
    end

    it "should have 52 cards in the array" do
      expect(deck.cards.length).to eq(52)
    end
  end

end