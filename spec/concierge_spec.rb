require 'concierge'
require 'bag'
require 'locker'

describe 'Concierge' do

  before do
    allow_any_instance_of(IO).to receive(:puts)
  end

  let (:concierge) { Concierge.new }


  let (:small_bag) { double :small_bag, size: "small" }
  let (:medium_bag) { double :small_bag, size: "medium" }
  let (:large_bag) { double :small_bag, size: "large" }
  
  let (:all_available_lockers)    { concierge.lockers.select{ |locker| !locker.full? && locker.acceptable?(small_bag) } }
  let (:medium_lockers)           { concierge.lockers.select{ |locker| locker.size == "medium" }                  }
  let (:medium_and_large_lockers) { concierge.lockers.select{ |locker| !(locker.size == "small") }                }

  it 'starts with all lockers available' do
    expect(all_available_lockers.length).to eq concierge.lockers.length
  end 

  context 'when checking in a bag' do

    it 'can check in a bag' do
      concierge.check_in(small_bag)
      expect(concierge.lockers.first.bag).to eq small_bag
    end

    it 'can check in a medium bag into a large locker when medium lockers are full' do
      (medium_lockers.length).times {concierge.check_in(medium_bag)}
      concierge.check_in(medium_bag)
      first_large_locker = concierge.lockers.bsearch {|locker| locker.size == "large"}
      expect(first_large_locker.bag).to eq medium_bag
    end

    it 'knows when there are no more lockers available' do
      (all_available_lockers.length).times {concierge.check_in(small_bag)}
      expect{concierge.check_in(small_bag)}.to raise_error("Uh oh, no more lockers. Sorry.")
    end
  end

  context 'when checking out a bag' do
    it 'can check out a bag with a valid ticket_number' do
      concierge.check_in(small_bag)
      ticket_number = concierge.lockers.first.ticket_number
      expect(concierge.lockers.first).to be_full
      expect(concierge.lockers.first.bag).to eq small_bag

      concierge.check_out(ticket_number)
      expect(concierge.lockers.first).not_to be_full
      expect(concierge.lockers.first.bag).to eq nil
    end

    it 'cannot check out a bag with an invalid ticket_number' do 
      invalid_ticket_number = 00
      expect{concierge.check_out(invalid_ticket_number)}.to raise_error("Your ticket number is invalid.")
    end
  end
end


