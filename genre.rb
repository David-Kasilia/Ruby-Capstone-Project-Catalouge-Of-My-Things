class Genre
  attr_accessor :id, :name, :items

  def initialize(_id, name)
    @id = Random.rand(1..999)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    items.add_genre(self)
  end
end
