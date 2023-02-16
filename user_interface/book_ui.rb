require_relative '../modules/book'
require_relative '../modules/item'
require_relative '../modules/label'
require_relative './label_ui'
require 'json'

class BookUserInterface
  FILE_LOCATION = './data/books.json'.freeze
  FILE_LOCATION2 = './data/labels.json'.freeze

  attr_accessor :books, :items

  def initialize
    @books = load
    @items = load_two
  end

  def load
    File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))
  end

  def load_two
    File.zero?(FILE_LOCATION2) ? [] : JSON.parse(File.read(FILE_LOCATION2))
  end

  def save
    File.write(FILE_LOCATION, JSON.pretty_generate(@books))
    File.write(FILE_LOCATION2, JSON.pretty_generate(@items))
  end

  def list_all_books
    puts ['No published books tests', ''] if @books.empty?

    @books.each do |book|
      puts "Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}"
    end
  end

  def add_a_book
    title = handle_label_title_input
    publisher = handle_publisher_input
    published_date = handle_published_year
    cover_state = handle_cover_state_input
    color = handle_label_color_input
    @books << Book.new(publisher, cover_state, published_date).to_json
    puts @books
    item = Label.new(title, color)
    @items << item.to_json
    item.add_items(@items)
    save
  end

  def items_handle
    @items
  end

  def handle_publisher_input
    print 'Publisher: '
    gets.chomp.capitalize
  end

  def handle_published_year
    print 'Published year: '
    gets.chomp.to_i
  end

  def handle_cover_state_input
    print 'CoverState i.e. new/bad: '
    gets.chomp
  end

  def list_all_labels
    puts ['No label found', ''] if @items.empty?

    @items.each do |item|
      puts "Title: #{item['title']}, Color: #{item['color']}"
    end
  end

  def handle_label_title_input
    print 'Title: '
    gets.chomp
  end

  def handle_label_color_input
    print 'Color: '
    gets.chomp
  end
end
