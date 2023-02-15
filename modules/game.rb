require 'date'
require_relative './item'

class Game < Item
  attr_accessor :last_played_at, :name

  def initialize(name, publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
    @name = name
  end

  def can_be_archived?
    super && Date.today.year - @last_played_at.year > 2
  end
end
