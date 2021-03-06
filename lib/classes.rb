class DockingStation

  attr_reader :bikes, :capacity_limit
  DEFAULT_CAPACITY = 20
def initialize(capacity_limit = DEFAULT_CAPACITY)
    @bikes = []
    @capacity_limit = capacity_limit
  end

  def check_bike(bike)
    if !bike.is_a? Bike
      raise ArgumentError, "expecting a bike, not #{bike.class}"
    end
  end

  def dock(bike)
    # check_bike(bike)
    if at_capacity?
      raise "adding bike when at capacity"
    else
      @bikes << bike
    end
    self
  end

  def do_release
    @bikes.each do |bike|
      if !bike.broken
        bicicleta = bike
        @bikes.delete(bike)
        return bicicleta
      end
    end
    nil
  end

  def release_bike
    bike = do_release
    return bike unless bike.nil?
    raise RuntimeError, "no working bikes available"
  end

  def capacity
    @bikes.count
  end

  def report_broken
    true
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
  attr_accessor :broken

  def initialize(broken = false)
    @broken = broken
  end

  def working?
    !self.broken
  end

end
