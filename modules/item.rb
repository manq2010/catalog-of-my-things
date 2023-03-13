require 'time'

class Item
  attr_accessor :genre, :published_date, :label, :author
  attr_reader :id, :archived

  def initialize(published_date, archived: true)
    @id = Random.rand(0...1000)
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label(label)
    self.label = (label)
    label.add_item(self) unless label.items.include?(self)
  end

  def add_genre(genre)
    self.genre = (genre)
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    self.author = (author)
    author.add_item(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    (Time.now.year - @published_date) > 10
  end
end
