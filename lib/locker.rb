class Locker
  DEFAULT_CAPACITY = 5
  
  def initialize(options = {})
    @capacity = options[:capacity] || DEFAULT_CAPACITY
    @bags = []
  end

  def has_bags?
    bags.any?
  end

  def bags  
    @bags ||= []
  end

  def capacity
    @capacity
  end

  def lock(bag)
    raise 'Locker is full' if full?
    bags << bag
  end

  def bag_count
    bags.count
  end

  def release(bag)
    bags.delete(bag)
  end

  def full?
    bag_count == @capacity
  end
end