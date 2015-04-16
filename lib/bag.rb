class Bag

  def initialize
    @checked_in = false
  end

  def checked_in?
    @checked_in
  end

  def check_in!
    @checked_in = true
    self
  end

  def check_out!
    @checked_in = false
    self
  end

  def drop_off_at(locker)
    locker.available_for_check_in(self)
    self.check_in!
  end

  def pick_up_from(locker)
    locker.ready_for_check_out(self)
  end
end