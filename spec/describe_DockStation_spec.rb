require "classes"

describe DockingStation do

  it { expect(DockingStation.new).to respond_to(:release_bike) }
  it { expect(DockingStation.new.release_bike.instance_of? Bike).to eq  true }
  it { expect(DockingStation.new.release_bike.working?).to eq true }
end
