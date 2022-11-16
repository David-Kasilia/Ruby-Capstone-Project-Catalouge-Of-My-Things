class Genre
  attr_accessor :id, :name, :items

  # def initialize(title, color, id = Random.rand(1..1000)) 

  def initialize(name, id = Random.rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    items.add_genre(self)
  end
end
