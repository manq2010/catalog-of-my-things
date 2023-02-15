require_relative '../modules/label'
class LabelUserInterface
  FILE_LOCATION = './data/labels.json'.freeze
  attr_accessor :labels

  def initialize
    @labels = load
  end

  def load
    File.zero?(FILE_LOCATION) ? [] : JSON.parse(File.read(FILE_LOCATION))
  end

  def list_all_labels
    puts ['No label found', ''] if @labels.empty?

    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end
end
