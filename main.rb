require_relative './user_interface/book_ui'
require_relative './user_interface/game_ui'
require_relative './user_interface/author_ui'
require_relative './user_interface/music_album_ui'

class Main
  attr_accessor :book, :label, :game, :music_album, :genre

  def initialize
    @book = BookUserInterface.new
    @game = GameUserInterface.new
    @authors = AuthorUserInterface.new
    @music_album = MusicAlbumUserInterface.new
  end

  def options
    puts [
      '1- List all books',
      '2- List all music albums',
      '3- List of games',
      '4- List all genres',
      '5- List all labels (e.g. \'Gift\', \'New\')',
      '6- List all authors (e.g. \'Stephen King\')',
      '7- Add a book',
      '8- Add a music album',
      '9- Add a game',
      '10- Exit'
    ]
  end

  def processed_input(input)
    case input
    when 1
      @book.list_all_books
    when 2
      @music_album.list_all_music_albums
    when 3
      @game.list_all_games
    when 4
      @music_album.list_all_genres
    when 5
      @book.list_all_labels
    end
  end

  def processed_input2(input)
    case input
    when 6
      @authors.list_authors
      puts ''
    when 7
      @book.add_a_book
    when 8
      @music_album.add_a_music_album
    when 9
      @game.add_game
    end
  end
end

def main
  main = Main.new
  input = nil
  until input == 10
    main.options
    input = gets.to_i
    puts 'Invalid choice' if input < 1 || input > 10
    main.processed_input(input)
    main.processed_input2(input)
  end
end

main
