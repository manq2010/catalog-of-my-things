require_relative '../modules/game'
require 'date'

class GameUserInterface
  FILE_LOCATION = './data/games.json'.freeze
  attr_accessor :games

  def initialize
    @games = load
  end

  def load
    File.size(FILE_LOCATION).zero? ? [] : JSON.parse(File.read(FILE_LOCATION))
  end

  def save
    File.write(FILE_LOCATION, JSON.pretty_generate(@games))
  end

  def list_all_games
    puts 'No games created' if @games.empty?

    @games.each do |game|
      print "Game name: #{game['name']} Publish date: #{game['publish_date']}"
      print " Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}"
    end
  end

  def add_game
    published_date = handle_input_date('Published date: ')
    game_name = handle_input_str('Game name: ')
    last_played_at = handle_input_date('Last played at: ')
    multiplayer = handle_input_str('Mutliplayer(y/n): ')
    @games << Game.new(game_name, published_date, last_played_at, multiplayer).to_json
    save
    puts 'Game created successfully!'
  end

  def handle_input_str(param)
    print param
    gets.chomp.capitalize
  end

  def handle_input_date(param)
    begin
        print param
        date = gets.chomp
        Date.parse(date)
    rescue
        puts 'Invalid date please enter a valid date yy/mm/dd'
        handle_input_date(param)
    end
  end
end
