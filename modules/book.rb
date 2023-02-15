require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publisher)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*_args)
    { 'publisher' => @publisher, 'cover_state' => @cover_state }
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad' ? true : false
  end
end
