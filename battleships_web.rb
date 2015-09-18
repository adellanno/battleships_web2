require 'sinatra/base'
require './lib/water'
require './lib/ship'
require './lib/player'
require './lib/game'
require './lib/cell'
require './lib/board'
require 'pry'

class BattleshipWeb < Sinatra::Base

enable :sessions

$board = Board.new(Cell)

  set :views, proc { File.join(root, 'views')}

  get '/' do
    erb :index
  end

  get '/name' do
    erb :name_form
  end

  get '/board' do
    @name = params[:name] # This needs to change as it is resetting the name to nil everytime the page is refreshed
    # session[:board] = Board.new(Cell)
    $board
    @coordinates = params[:coordinates]
    @ship_type = params[:ship_type]
    @orientation = params[:orientation]
    erb :board
  end

  post '/board' do
    $board
  end

  # def place(ship, coord, orientation = :horizontally)
  #   coords = [coord]
  #   (ship.size - 1).times{coords << next_coord(coords.last, orientation)}
  #   put_on_grid_if_possible(coords, ship)
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
