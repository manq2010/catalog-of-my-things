require_relative '../modules/music_album'
require_relative '../modules/item'
require_relative '../modules/genre'
require 'json'
require 'fileutils'

class MusicAlbumUserInterface
  FILE_LOCATION = './data/music_albums.json'.freeze
  FILE_LOCATION2 = './data/genres.json'.freeze

  attr_accessor :music_albums, :genres

  def initialize
    @music_albums = load
    @genres = load_two
  end

  def load
    if File.directory?('data') && File.file?(FILE_LOCATION)

      File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))

    elsif File.directory?('data') && !File.exist?(FILE_LOCATION)
      FileUtils.touch(FILE_LOCATION)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_LOCATION)
      []
    end
  end

  def load_two
    if File.directory?('data') && File.file?(FILE_LOCATION2)

      File.zero?(FILE_LOCATION2) ? [] : JSON.parse(File.read(FILE_LOCATION2))

    elsif File.directory?('data') && !File.exist?(FILE_LOCATION2)
      FileUtils.touch(FILE_LOCATION2)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_LOCATION2)
      []
    end
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
    @genres << Genre.new(name).to_json
    save
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
    puts ['No genres found', ''] if @genres.empty?

    @genres.each_with_index do |genre, index|
      puts "#{index + 1}) Name: #{genre['name']}"
    end
  end

  def handle_label_name_input
    print 'Name: '
    gets.chomp
  end
end
