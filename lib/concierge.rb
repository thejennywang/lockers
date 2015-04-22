class Concierge

  attr_accessor :lockers

  def initialize
    @lockers ||= []

    (0..3000).each do |i| 
      @lockers[i] = Locker.new("small", i + 1) if i >= 0 && i < 1000
      @lockers[i] = Locker.new("medium", i + 1) if i >= 1000 && i < 2000
      @lockers[i] = Locker.new("large", i + 1) if i >= 2000 && i < 3000
    end 
  end

  def find_a_locker_for(bag)
    self.lockers.detect{ |locker| !locker.full? && locker.acceptable?(bag) }
  end

  def look_up_locker_by(ticket_number)
    self.lockers.detect{ |locker| locker.ticket_number == ticket_number }
  end
    
  def check_in(bag)
    if self.find_a_locker_for(bag)
      assigned_locker = self.find_a_locker_for(bag)
      assigned_locker.accept(bag)
      self.print_ticket_with(assigned_locker)
    else
      raise "Uh oh, no more lockers. Sorry."
    end
  end

  def check_out(ticket_number)
    if self.look_up_locker_by(ticket_number)
      locker = self.look_up_locker_by(ticket_number)
      locker.bag.display
      locker.release_bag
    else
      raise "Your ticket number is invalid."
    end
  end

  def print_ticket_with(assigned_locker)
    puts "Your ticket number is #{assigned_locker.ticket_number}."
  end
end