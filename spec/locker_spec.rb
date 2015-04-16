require 'locker'
require 'bag'

describe 'Locker' do
  let (:locker) { Locker.new(capacity: 5) }
  let (:bag) { Bag.new }

  def fill_locker(locker)
    locker.capacity.times { locker.lock(bag) }
  end
  
  it 'is created with no bags' do
    expect(locker).not_to have_bags
  end

  it 'should accept a bag' do
    locker.lock(bag)
    expect(locker.bags).to eq [bag]
    expect(locker.bag_count).to eq 1
  end

  it 'should know its own bag count' do
    expect(locker.bag_count).to eq 0
  end

  it 'should release a bag' do
    locker.lock(bag)
    locker.release(bag)
    expect(locker.bag_count).to eq 0
  end

  it 'should know when it is full' do
    expect(locker).not_to be_full
    fill_locker(locker)
    expect(locker).to be_full
  end

  it 'should not accept a bag if at capacity' do
    fill_locker(locker)
    expect(lambda {locker.lock(bag)}).to raise_error(RuntimeError)
  end
end