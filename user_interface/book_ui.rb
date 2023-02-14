require_relative '../modules/book'

class BookUserInterface
  attr_accessor :books

  def initialize
    @books = []
  end

  def list_all_books
    puts ['No published books', ''] if @books.empty?

    @books.each do |book|
      puts "Publisher: #{book.publisher}, Cover State: #{book.cover_state}"
    end
  end

  def add_a_book
    publisher = handle_publisher_input
    cover_state = handle_cover_state_input
    @books << Book.new(publisher, cover_state)
  end

  def handle_publisher_input
    gets.chomp.capitalize
  end

  def handle_cover_state_input
    gets.chomp.capitalize
  end
end
