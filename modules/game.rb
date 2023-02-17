require 'date'
require_relative './item'

class Game < Item
  attr_accessor :last_played_at, :name

  def initialize(name, published_date, last_played_at, multiplayer)
    super(published_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @name = name
  end

  def to_json(*_args)
    {
      'name' => @name,
      'published_date' => @published_date,
      'last_played_at' => @last_played_at,
      'multiplayer' => @multiplayer
    }
  end

  private

  def can_be_archived?
    super && (Time.now.year - @published_date) > 2
  end
end

# def can_be_archived?
#   today = Date.today
#   years_since_publication = today.year - @published_date.year
#   if years_since_publication >= 2
#     years_since_last_played = today.year - @last_played_at.year
#     years_since_last_played >= 2
#   else
#     false
#   end
# end
