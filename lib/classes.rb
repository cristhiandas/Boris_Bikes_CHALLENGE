class DockingStation

  attr_reader :bike

  def initialize
    @bike = nil
  end

  def dock(bike)
    if !bike.is_a? Bike
      raise ArgumentError, "expecting a bike, not #{bike.class}"
    end
    @bike = bike
  end

  def release_bike
    Bike.new
  end

end

class Bike
  def working?
    true
  end
end
