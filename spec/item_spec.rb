require_relative '../item'

today = Time.now.strftime('%Y/%m/%d')
item = Item.new('name', today, true)

describe 'Testing Item Class -' do
  it 'checks for the type=Numeric when random id is genereated' do
    expect(item.id).to be_an(Numeric)
  end

  it 'check for today date' do
    expect(item.archived).to be(false)
  end
end
