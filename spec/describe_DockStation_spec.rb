require "DockingStation_class"

describe DockingStation do
  it { expect(DockingStation.new).to respond_to(:release_bike) }
end
