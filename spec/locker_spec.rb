require 'locker'
require 'bag'

describe 'Locker' do
  let (:small_locker)  { Locker.new("small", 1)  }
  let (:medium_locker) { Locker.new("medium", 2) }
  let (:large_locker)  { Locker.new("large", 3)  }
  let (:medium_bag)    { Bag.new("medium")       }

  it 'is created empty' do
    expect(medium_locker).not_to be_full
  end

  it 'has a size' do
    expect(medium_locker.size).to eq "medium"
  end

  it 'has a ticket_number' do
    expect(medium_locker.ticket_number).to eq 2
  end

  it 'can accept a bag' do
    medium_locker.accept(medium_bag)
    expect(medium_locker).to be_full
    expect(medium_locker.bag).to eq medium_bag
  end

  it 'does not accept a bag that is too big' do
    expect{small_locker.accept(medium_bag)}.to raise_error("This locker ain't big enough!")
  end

  it 'does not accept a bag if it is already full' do
    medium_locker.accept(medium_bag)
    expect(medium_locker).to be_full
    expect{medium_locker.accept(medium_bag)}.to raise_error("This locker is full, fool!")
  end

  it 'can release a bag' do
    medium_locker.accept(medium_bag)
    expect(medium_locker).to be_full
    medium_locker.release_bag
    expect(medium_locker).not_to be_full
  end

end