require 'pry'
require 'sinatra'
require './deck'

enable :sessions
set :session_secret, 'setme'

get '/' do
  deck = Deck.new
  content = Deck::STANDARD_SUITS.map do |suit|
    "<div class='row'>" +
    deck.send(suit.to_sym).map { |card| card.display_html }.join +
    "</div>"
  end.join
end

get '/card' do

end