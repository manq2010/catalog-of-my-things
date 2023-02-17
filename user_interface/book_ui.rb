require_relative '../modules/book'
require_relative '../modules/item'
require_relative '../modules/label'
require 'json'
require 'fileutils'

class BookUserInterface
  FILE_LOCATIONS = {
    books: './data/books.json',
    labels: './data/labels.json'
  }.freeze

  def initialize
    @books = load_data(:books)
    @labels = load_data(:labels)
  end

  def list_all_books
    if @books.empty?
      puts 'No published books found.'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Publisher: #{book['publisher']}, Cover State: #{book['cover_state']}"
      end
    end
  end

  def add_a_book
    book = create_book
    @books << book.to_json
    label = create_label
    @labels << label.to_json
    label.add_items(@labels)
    save_data
  end

  def list_all_labels
    if @labels.empty?
      puts 'No labels found.'
    else
      @labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: #{label['title']}, Color: #{label['color']}"
      end
    end
  end

  private

  def load_data(type)
    path = FILE_LOCATIONS[type]

    if File.directory?('data') && File.file?(path)

      File.zero?(path) ? [] : JSON.parse(File.read(path))

    elsif File.directory?('data') && !File.exist?(path)
      FileUtils.touch(path)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(path)
      []
    end
  end

  def save_data
    FILE_LOCATIONS.each do |type, path|
      data = instance_variable_get("@#{type}")
      File.write(path, JSON.pretty_generate(data))
    end
  end

  def create_book
    publisher = prompt_input('Publisher')
    published_date = prompt_input('Published year', &:to_i)
    cover_state = prompt_input('Cover state (e.g. new/bad)')
    Book.new(publisher, cover_state, published_date)
  end

  def create_label
    title = prompt_input('Title')
    color = prompt_input('Color')
    Label.new(title, color)
  end

  def prompt_input(message, &block)
    print "#{message}: "
    input = gets.chomp
    block ? block.call(input) : input
  end
end
