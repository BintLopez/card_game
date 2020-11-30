require_relative "card"
require 'pry'

class Deck
  attr_reader :cards

  STANDARD_SUITS = %w(hearts spades clubs diamonds)
  STANDARD_POINT_VALUES = (2..14).to_a
  DEFAULT_POINT_STRATEGY = 'faces_worth_ten'

  STANDARD_SUITS.each do |suit|
    define_method("#{suit}".to_sym) do
      cards.select { |card| card.suit == suit }
    end
  end
  
  def initialize(point_value_strategy: nil)
    @point_value_strategy =  point_value_strategy || DEFAULT_POINT_STRATEGY
    @cards = (0..51).map do |i|
      Card.new(
        STANDARD_SUITS[i % 4],
        STANDARD_POINT_VALUES[i % 13],
        @point_value_strategy
      )
    end
  end

end