require_relative '../modules/label'
class LabelUserInterface
  attr_accessor :labels

  def initialize
    @labels = []
  end

  def list_all_labels
    puts ['No label found', ''] if @labels.empty?

    @labels.each do |label|
      puts "Title: #{label.title}, Color: #{label.color}"
    end
  end
end
