require "classes"

describe DockingStation do

  subject(:docking_station) { described_class.new }
  subject(:bike) { Bike.new }

  describe 'when created' do
    it { expect(docking_station.bikes).to be_a Array }
    it { expect(docking_station.bikes).to be_empty }
  end

  describe 'docks bikes' do
    it { expect(docking_station).to respond_to(:dock) }

    it 'accepts bikes for docking' do
      docking_station.dock(bike)
      expect(docking_station.bikes[-1]).to eq bike
    end

    it "doesn't accept non-bikes for docking" do
      expect { docking_station.dock(4) }.to raise_error(ArgumentError)
    end
  end

  describe 'releases bikes' do

    context "supports methods" do
      # it { expect(docking_station).to respond_to(:has_bike?) }
      it { expect(docking_station).to respond_to(:release_bike) }
    end

    context "with no bikes" do

      it "raises " do
        expect { docking_station.release_bike }.to raise_error(RuntimeError)
      end

      # it { expect(docking_station).to_not have_bike }
    end

    context "with bikes" do

      it "It is a Bike" do
        expect(docking_station.dock(Bike.new).release_bike).to be_a Bike
      end

      # it "consumes one bike" do
      #   docking_station.dock(Bike.new)
      #   docking_station.release_bike
      #   expect(docking_station).to_not have_bike
      # end

    end
  end
end
