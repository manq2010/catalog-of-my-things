require_relative './item'

class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    @id = Random.rand(1..10_000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    return if items.any? { |i| i.id == item.id }

    @items << item
    item.author = self
  end

  def to_json(*_args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items.map(&:id)
    }
  end
end
