require "classes"

describe DockingStation do
  
  # docking station tests
  it { expect(DockingStation.new).to respond_to(:release_bike) }
  it { expect(DockingStation.new.release_bike).to be_a Bike }

  # bike test
  subject(:bike) { described_class.new.release_bike }
  it { expect(bike).to be_working }

end
