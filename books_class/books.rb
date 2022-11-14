require_relative '../item'

class Book < Item

    attr_accesor :name, :publish_date, :publisher, :cover_state

    def initialize(id = Random.rand(1..1000), name, publish_date, publisher, cover_state)
        super(id, name, publish_date)
        @publisher = publisher
        @cover_state = cover_state
    end

    private
    def can_be_archived?
        super || @cover_state == 'bad'
    end

end