require_relative '../deck'

describe Deck do
  let(:deck) { Deck.new }
  let(:all_suits) { Deck::STANDARD_SUITS }
  let(:standard_values) { Deck::STANDARD_POINT_VALUES }

  def find_cards_of_suit(suit)
    deck.cards.select {|card| card.suit == suit}
  end

  def find_cards_of_point_value(value)
    deck.cards.select { |card| card.point_value == value }
  end

  it 'has 52 cards' do
    expect(deck.cards.count).to eq(52)
  end

  it 'should have 52 Card objects in its @cards array' do
    deck.cards.each do |element|
      expect(element).to be_an_instance_of(Card)
    end  
  end

  it 'has 4 suits' do
    expect(all_suits.count).to eq(4)
  end

  it 'has 13 cards of each suit' do
    all_suits.each do |st_suit|
      expect(find_cards_of_suit(st_suit).count).to eq(13)
    end
  end

  it "has 4 cards of each point value" do
    standard_values.each do |value|
      expect(find_cards_of_point_value(value).count).to eq(4)
    end
  end

  it "has no duplicate cards" do
    expect(deck.cards.count == deck.cards.uniq.count).to be true
  end

  it "each suit has cards with unique point values" do
    points = deck.hearts.map(&:point_value) 
    expect(points.sort).to eq(standard_values) 
  end

end