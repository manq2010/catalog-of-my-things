class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
  end

  def to_json(*_args)
    { 'name' => @name }
  end
end
