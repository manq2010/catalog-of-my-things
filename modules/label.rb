class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = Random.rand(0..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_items(item)
    @items << item
    item.label = self
  end

  def to_json(*_args)
    { 'title' => @title, 'color' => @color }
  end
end
