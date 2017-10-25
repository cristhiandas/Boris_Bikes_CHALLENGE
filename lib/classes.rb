class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def dock(bike)
    if !bike.is_a? Bike
      raise ArgumentError, "expecting a bike, not #{bike.class}"
    end
    @bikes << bike
    self
  end

  def do_release
    @bikes.pop
  end

  def release_bike
    bike = do_release
    return bike unless bike.nil?
    raise RuntimeError, "no bikes available"
  end

def has_bike?
  !@bikes.empty?
  end

end


class Bike
  def working?
    true
  end
end
