require_relative '../books_class/books'

describe Books do
    before(:each) do
        name = 'The Originals'
        publish_date = Time.new(2013, 10, 03)
        publisher = 'Julie Pleck'
        cover_state = 'best'
        @books = Books.new(name, publish_date, publisher, cover_state)
    end
    context 'Unit Test for book class' do
        it 'should create a new Book Instance' do
            expect(@books).to be_an_instance_of(Books)
        end
        it 'should create a new Book Instance' do
            expect(@books).to be_kind_of(Item)
        end
        it 'should have a book name' do
            expect(@books.name).to eq('The Originals')
        end
        it 'should have a book publisher' do
            expect(@books.publisher).to eq('Julie Pleck')
        end
        it 'should have a book cover state' do
            expect(@books.cover_state).to eq('best')
        end
        it 'should have a book publsih date' do
            expect(@books.publish_date).to be_an_instance_of(Time)
        end
    end
end