class DockingStation

  attr_reader :bikes, :capacity_limit

  def initialize(capacity_limit = 20)
    @bikes = []
    @capacity_limit = capacity_limit
  end

  def check_bike(bike)
    if !bike.is_a? Bike
      raise ArgumentError, "expecting a bike, not #{bike.class}"
    end
  end

  def dock(bike)
    check_bike(bike)
    if at_capacity?
      raise "adding bike when at capacity"
    else
      @bikes << bike
    end
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

  def capacity
    @bikes.count
  end

  private

  def at_capacity?
    @capacity_limit <= capacity
  end

  def has_bike?
    !@bikes.empty?
  end


end
 public
class Bike
  def working?
    true
  end
end
