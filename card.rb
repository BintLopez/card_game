class Card

  attr_reader :suit, :point_value

  def initialize(suit, point_value)
    @suit = suit
    @point_value = point_value
  end 

end