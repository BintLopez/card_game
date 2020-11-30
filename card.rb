require_relative 'deck'

class Card
  FACE_VALUES_MAP = {
     2 => 'two',
     3 => 'three',
     4 => 'four',
     5 => 'five',
     6 => 'six',
     7 => 'seven',
     8 => 'eight',
     9 => 'nine',
    10 => 'ten',
    11 => 'jack',
    12 => 'queen',
    13 => 'king',
    14 => 'ace'
  }

  POINT_VALUE_STRATEGIES = [
    'faces_worth_ten',
    'face_values_increment',
    'faces_10_aces_15'
  ]

  attr_reader :suit, :value, :point_value_strategy

  def initialize(suit, value, point_value_strategy='faces_worth_ten')
    raise ArgumentError.new("Unsupported point value strategy") unless POINT_VALUE_STRATEGIES.include?(point_value_strategy)

    @suit = suit
    @value = value
    @point_value_strategy = point_value_strategy
  end

  def name
    "#{face_value} of #{suit}"
  end

  def point_value
    case point_value_strategy
    when 'faces_worth_ten'
      faces_worth_ten
    when 'face_values_increment'
      face_values_increment
    when 'faces_10_aces_15'
      faces_10_aces_15
    end
  end

  def suit_image
    Deck::SUIT_IMAGERY[suit.to_sym]
  end

  def face_value
    FACE_VALUES_MAP[value]
  end

  def faces_worth_ten
    if value > 10
      10
    else
      value
    end
  end

  def face_values_increment
    value
  end

  def faces_10_aces_15
    if value > 10
      10
    elsif value == 14
      15
    else
      value
    end
  end

end