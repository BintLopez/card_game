require 'pry'
require 'sinatra'
require './deck'

enable :sessions
set :session_secret, 'setme'

get '/' do
  @deck = Deck.new
  erb(:deck, collection: @deck)
end

get '/card' do

end