require "classes"

describe DockingStation do
  
  subject(:docking_station) { described_class.new }

  context 'when created' do

    it { expect(docking_station.bike).to be_nil }

  end

  context 'docks bikes' do

    it { expect(docking_station).to respond_to(:dock) }

    it 'accepts bikes for docking' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.bike).to eq bike
    end

    it "doesn't accept non-bikes for docking" do
      expect { docking_station.dock(4) }.to raise_error(ArgumentError)
    end

  end

  context 'releases bikes' do

    subject(:bike) { described_class.new.release_bike }

    it { expect(docking_station).to respond_to(:release_bike) }
    it { expect(docking_station.release_bike).to be_a Bike }
    it { expect(bike).to be_working }

  end


end
