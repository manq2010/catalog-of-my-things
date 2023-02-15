require_relative '../modules/music_album'

class MusicAlbumUserInterface
  attr_accessor :music_albums

  def initialize
    @music_albums = []
  end

  def list_all_music_albums
    puts ['No Music Album available', ''] if @music_albums.empty?

    @music_albums.each do |music_album|
      puts "On Spotify: #{music_album.on_spotify}"
    end
  end

  def add_a_music_album
    on_spotify = handle_on_spotify_input
    @music_albums << MusicAlbum.new(on_spotify)
  end

  def handle_on_spotify_input
    gets.chomp.capitalize
  end
end
