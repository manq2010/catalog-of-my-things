require_relative '../modules/music_album'
require_relative '../modules/item'
require_relative '../modules/genre'
require 'json'

class MusicAlbumUserInterface
  FILE_LOCATION = './data/music_albums.json'.freeze
  FILE_LOCATION2 = './data/genres.json'.freeze

  attr_accessor :music_albums, :items

  def initialize
    @music_albums = load
    @items = load_two
  end

  def load
    File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))
  end

  def load_two
    File.zero?(FILE_LOCATION2) ? [] : JSON.parse(File.read(FILE_LOCATION2))
  end

  def save
    File.write(FILE_LOCATION, JSON.pretty_generate(@music_albums))
    File.write(FILE_LOCATION2, JSON.pretty_generate(@items))
  end

  def list_all_music_albums
    puts ['No Music Album available', ''] if @music_albums.empty?

    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1}) On Spotify: #{music_album['on_spotify']}"
    end
  end

  def add_a_music_album
    name = handle_label_name_input
    published_date = handle_published_year
    on_spotify = handle_on_spotify_input
    @music_albums << MusicAlbum.new(on_spotify, published_date).to_json
    puts @music_albums
    item = Genre.new(name)
    @items << item.to_json
    item.add_items(@items)
    save
  end

  def items_handle
    @items
  end

  def handle_on_spotify_input
    print 'On_Spotify: '
    gets.chomp.capitalize
  end

  def handle_published_year
    print 'Published year: '
    gets.chomp.to_i
  end

  def list_all_genres
    puts ['No label found', ''] if @items.empty?

    @items.each_with_index do |item, index|
      puts "#{index + 1}) Name: #{item['name']}"
    end
  end

  def handle_label_name_input
    print 'Name: '
    gets.chomp
  end
end
