require_relative '../books_class/label'

describe Label do
    before(:each) do
        items = []
        title = 'New'
        color = 'red'
        @label = Label.new(items, title, color) 
    end
    context 'Unit Test For Label Class' do
        it 'should return a new instance for label' do
            expect(@label).to be_an_instance_of(Label)
        end
        it 'should return a new instance for label' do
            expect(@label.title).to eql('New')
        end
        it 'should return a new instance for label' do
            expect(@label.color).to eql('red')
        end
        it 'should return a new instance for label' do
            expect(@label.items).to eql []
        end
    end
end