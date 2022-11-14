class Item
    attr_reader :id, :archived, :genre, :author, :label
    attr_accessor :publish_date

    def initialize(id = Random.rand(1..1000), publish_date, archived: false)
        @id = id
        @publish_date = publish_date
        @archived = archived
    end
    
    def add_genre = (genre)
        @genre = genre
        @genre.items.push(self) unless @genre.items.include?(self)
    end
    
    def add_author = (author)
        @author = author
        @author.items.push(self) unless @author.items.include?(self)
    end
    
    def add_source = (source)
        @source = source
        @source.items.push(self) unless @source.items.include?(self)
    end
    
    def add_label = (label)
        @label = label
        @label.items.push(self) unless @label.items.include?(self)
    end
end

