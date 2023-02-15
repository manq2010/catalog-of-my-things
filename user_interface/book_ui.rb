require_relative '../modules/book'
require 'json'

class BookUserInterface
  FILE_LOCATION = './data/books.json'.freeze
  attr_accessor :books

  def initialize
    @books = load
  end

  def load
    File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))
  end

  def save
    File.write(FILE_LOCATION, JSON.pretty_generate(@books))
  end

  def list_all_books
    puts ['No published books tests', ''] if @books.empty?

    @books.each do |book|
      puts "Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}"
    end
  end

  def add_a_book
    publisher = handle_publisher_input
    cover_state = handle_cover_state_input
    @books << Book.new(publisher, cover_state).to_json
    save
  end

  def handle_publisher_input
    puts 'Publisher: '
    gets.chomp.capitalize
  end

  def handle_cover_state_input
    puts 'CoverState: '
    gets.chomp.capitalize
  end
end
