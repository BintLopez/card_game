require_relative "deck"

class Game

  attr_reader :deck, :players

  def initialize(num_players)
    @deck = Deck.new
    @players = num_players
  end

end