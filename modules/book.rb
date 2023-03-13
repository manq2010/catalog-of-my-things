require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, published_date, archived: true)
    super(published_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    { 'publisher' => @publisher, 'cover_state' => @cover_state, 'published_date' => @published_date }
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
