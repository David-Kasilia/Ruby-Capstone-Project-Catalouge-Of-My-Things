require_relative '../author'

require 'date'

describe Author do
  context 'when the author is not archived' do
    first_name = 'John'
    last_name = 'Doe'
    author = Author.new(first_name, last_name)
    it 'first name should be John' do
      expect(author.first_name).to eq('John')
    end
    it 'last name should be Doe' do
      expect(author.last_name).to eq('Doe')
    end
    it 'should create a new author' do
      expect(author).to be_an_instance_of(Author)
    end
  end
end