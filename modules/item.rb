class Item
  attr_accessor :genre, :author, :label, :published_date
  attr_reader :id, :archived

  def initialize(published_date, archived: true)
    @id = Random.rand(0...1000)
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def label=(label)
    @label = label
    @label.items.push(self) unless label.items.include?(self)

  private

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end
end
