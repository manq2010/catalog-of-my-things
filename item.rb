class Item
  attr_accessor :genre, :author, :label, :published_date, :published_
  attr_reader :id, :archived

  def initialize(genre, author, label, published_date, archived: true)
    @id = rand(0...1000)
    @genre = genre
    @author = author
    @label = label
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    (Time.now.year - @published_date.year) > 10
  end
end
