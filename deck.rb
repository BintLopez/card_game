require_relative "card"
require 'pry'

class Deck
  attr_reader :cards

  STANDARD_SUITS = %w(hearts spades clubs diamonds)
  STANDARD_POINT_VALUES = (2..14).to_a

  STANDARD_SUITS.each do |suit|
    define_method("#{suit}".to_sym) do
      cards.select { |card| card.suit == suit }
    end
  end
  
  def initialize
    @cards = (0..51).map {|i| Card.new(STANDARD_SUITS[i % 4], STANDARD_POINT_VALUES[i % 13]) }
  end

end