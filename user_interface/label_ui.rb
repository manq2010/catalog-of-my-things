require_relative '../modules/label'
require_relative './book_ui'

class LabelUserInterface
  FILE_LOCATION = './data/labels.json'.freeze
  attr_accessor :labels, :item

  def initialize
    @labels = load
  end

  def load
    File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))
  end

  def save(items)
    File.write(FILE_LOCATION, JSON.pretty_generate(items))
  end

  def list_all_labels
    puts ['No label found', ''] if @labels.empty?

    @labels.each do |label|
      puts "Title: #{label['title']}, Color: #{label['color']}"
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
