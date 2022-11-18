require_relative '../item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date

  def initialize(name, multiplayer, last_played_at, publish_date, archived: false)
    super(id, name, archived, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    remaining_year = current_year - last_played_at
    super() && (remaining_year > 2)
  end
end
