require_relative '../genre'
require_relative '../item'
require 'date'

describe Genre do
  before(:each) do
    items = []
    name = 'classical-song'
    @genre = Genre.new(items, name)
  end
  context 'Unit tests for Genre Class' do
    it 'should return a new instance for genre' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'should return an empty array for items' do
      expect(@genre.items).to eql []
    end

    it 'should return name classical-song' do
      expect(@genre.name).to eq('classical-song')
    end
  end
end
