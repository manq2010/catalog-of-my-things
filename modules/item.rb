class Item
  attr_accessor :genre, :author, :published_date
  attr_reader :id, :archived, :label

  def initialize(published_date, archived: true)
    @id = Random.rand(0...1000)
    @published_date = published_date
    @archived = archived
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  # def label=(label)
  #   @label = label
  #   @label.items.push(self) unless label.items.include?(self)
  # end

  def add_author(author)
    self.author = (author)
    author.add_item(self) unless author.items.include?(self)
  end

  private

  def can_be_archived?
    today = Date.today
    years_since_publication = today.year - @published_date.year
    if years_since_publication >= 2
      years_since_last_played = today.year - @last_played_at.year
      years_since_last_played >= 2
    else
      false
    end
  end
end
