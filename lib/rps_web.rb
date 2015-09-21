require 'sinatra/base'
require_relative 'rpsclass'

class RockPaperScissorsWeb < Sinatra::Base

	enable :sessions
  
  set :views, proc { File.join(root, '..', 'views')}

  get '/' do
    erb :index
  end

  post '/game-setup' do
  	session[:player_name] = params[:player_name]
  	redirect '/game-setup'
  end

  get '/game-setup' do
  	@player_name = session[:player_name]
  	@rps = Rps.new
  	erb :game_setup
  end

  post '/game-result' do
  	session[:player_shape] = params[:player_shape]
  	redirect '/game-result'
  end

  get '/game-result' do
  	"Fuck my life"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
