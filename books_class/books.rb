require_relative '../item'

class Books < Item
  attr_accessor :name, :publish_date, :publisher, :cover_state

  def initialize(name, publisher, publish_date, cover_state, id = Random.rand(1..1000))
    super(id, name, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
