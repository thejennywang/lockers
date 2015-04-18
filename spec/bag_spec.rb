require 'bag'

describe 'Bag' do
  let (:bag)    { Bag.new("small") }

  it 'has a size' do
    expect(bag.size).to eq "small"
  end
end