require 'bag'

describe 'Bag' do
  let (:bag)    { Bag.new }
  let (:locker) { double :locker }

  it 'is not checked in when created' do
    expect(bag).not_to be_checked_in
  end

  it 'can be checked into a locker' do
    expect(locker).to receive(:available_for_check_in).with(bag)
    bag.drop_off_at(locker)
    expect(bag).to be_checked_in
  end

  it 'can be checked out from a locker' do
    expect(locker).to receive(:ready_for_check_out).with(bag)
    bag.pick_up_from(locker)
    expect(bag).not_to be_checked_in
  end

end