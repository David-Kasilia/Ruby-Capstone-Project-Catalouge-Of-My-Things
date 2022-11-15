require_relative '../books_class/label'
require_relative '../books_class/books'
require_relative '../item'

describe Label do
  before(:each) do
    @fantasy_label = Label.new('Fantasy', 'pink', [])
    @super_label = Label.new('Supernatural', 'red', [])
    @drama_label = Label.new('Drama', 'brown', [])
    @book_one = Books.new('The Originals', Time.new(2013, 10, 0o3), 'Julie Pleck', 'best')
    @book_two = Books.new('Bel Air', Time.now, 'Will Smith', 'best')
    @book_three = Books.new('After', Time.now, 'Hardan', 'bad')
    @book_four = Books.new('Teen Wolf', Time.new(2014, 10, 10), 'Scott Mcall', 'good')
    @book_five = Books.new('Purple Hearts', Time.new(2012, 10, 16), 'Tessa', 'bad')
    @book_one.add_label(@super_label)
    @book_two.add_label(@drama_label)
    @book_three.add_label(@fantasy_label)
    @book_four.add_label(@super_label)
    @book_five.add_label(@fantasy_label)
  end
  context 'Unit Test For Label Class' do
    it 'should test add_item method for super label' do
      expect(@super_label.items.length).to eq 2
      expect(@super_label.items[0]).to be @book_one
      expect(@super_label.items[1].name).to eql('Teen Wolf')
      expect(@super_label.items[0].publisher).to eql('Julie Pleck')
    end
    it 'should test add_item method for fantasy label' do
      expect(@fantasy_label.items.length).to eq 2
      expect(@fantasy_label.items[0]).to be @book_three
      expect(@fantasy_label.items[0].name).to eql('After')
      expect(@fantasy_label.items[1].publisher).to eql('Tessa')
    end
    it 'should test add_item method for drama label' do
      expect(@drama_label.items.length).to eq 1
      expect(@drama_label.items[0]).to be @book_two
      expect(@drama_label.items[0].name).to eql('Bel Air')
      expect(@drama_label.items[0].publisher).to eql('Will Smith')
    end
  end
end
