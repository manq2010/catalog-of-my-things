class Genre < Item
  attr_accessor :name

  def initialize(name)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item; end
end