class Item
  attr_reader :id, :archived, :genre, :author, :label
  attr_accessor :publish_date, :name

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(_id, name, publish_date, archived = false)
    @id = Random.rand(1..1000)
    @name = name
    @publish_date = publish_date
    @archived = archived
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def add_genre(genre)
    @genre = genre
    @genre.items.push(self) unless @genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    @author.items.push(self) unless @author.items.include?(self)
  end

  def add_source(source)
    @source = source
    @source.items.push(self) unless @source.items.include?(self)
  end

  def add_label(label)
    @label = label
    @label.items.push(self) unless @label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - @publish_date[:year] > 10
  end
end
