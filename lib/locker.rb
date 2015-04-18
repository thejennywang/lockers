class Locker

  attr_reader :size, :ticket_number
  attr_accessor :full, :bag
  
  def initialize(size, ticket_number)
    @full = false
    @size = size
    @ticket_number = ticket_number
    @bag = nil
  end

  def full?
    @full
  end

  def accept(bag)
    raise "This locker is full, fool!" if full?
    raise "This locker ain't big enough!" if !acceptable?(bag)
    @full = true
    @bag = bag
  end

  def release_bag
    raise "There ain't nothin' here." if !full?
    @bag = nil
    @full = false
  end

  def acceptable?(bag)
    if self.size == "large"
      true
    elsif self.size == "medium" && ( bag.size == "medium" || bag.size == "small" )
      true
    elsif self.size == "small" && bag.size == "small"
      true
    else
      false
    end 
  end
end