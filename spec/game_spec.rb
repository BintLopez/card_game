require_relative '../game.rb'

describe Game do

  def game_with_x_num_players(num_players)
    Game.new(num_players)
  end

  let(:default_2_player_game) { Game.new(2) }

  it 'a new instance of Game is created' do
    expect(default_2_player_game).to be_an_instance_of(Game)
  end

  it 'creates a deck' do
    expect(default_2_player_game.deck).to be_an_instance_of(Deck)
  end

  context 'for a one player game' do
    let(:one_player_game) { game_with_x_num_players(1) }

    it 'has 1 player' do
      expect(one_player_game.players).to eq(1)
    end

  end

  context 'for a two player game' do

    it 'has 2 players' do
      expect(default_2_player_game.players).to eq(2)
    end

  end
  
end