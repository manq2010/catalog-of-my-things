require_relative './user_interface/book_ui'
require_relative './user_interface/music_album_ui'

class Main
  attr_accessor :book, :label, :music_album, :genre

  def initialize
    @book = BookUserInterface.new
    @music_album = MusicAlbumUserInterface.new
    # @genre = GenreUserInterface.new
  end

  def options
    puts [
      '1- List all books',
      '2- List all music albums',
      '3- List all movies',
      '4- List of games',
      '5- List all genres',
      '6- List all labels (e.g. \'Gift\', \'New\')',
      '7- List all authors (e.g. \'Stephen King\')',
      '8- List all sources (e.g. \'From a friend\', \'Online shop\')',
      '9- Add a book',
      '10- Add a music album',
      '11- Add a movie',
      '12- Add a game',
      '13- Exit'
    ]
  end

  def processed_input(input)
    case input
    when 1
      @book.list_all_books
    when 2
      @music_album.list_all_music_albums
    when 3
      puts '3- List all movies'
    when 4
      puts '4- List of games'
    when 5
      @music_album.list_all_genres
    when 6
      @label.list_all_labels
    end
  end

  def processed_input2(input)
    case input
    when 7
      puts '7- List all authors (e.g. \'Stephen King\')'
    when 8
      puts '8- List all sources (e.g. \'From a friend\', \'Online shop\')'
    when 9
      @book.add_a_book
    when 10
      @music_album.add_a_music_album
    when 11
      puts '11- Add a movie'
    when 12
      puts '12- Add a game'
    end
  end
end

def main
  main = Main.new
  input = nil
  until input == 13
    main.options
    input = gets.to_i
    puts 'Invalid choice' if input < 1 || input > 13
    main.processed_input(input)
    main.processed_input2(input)
  end
end

main
