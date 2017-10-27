require "classes"

describe DockingStation do

  let(:bike) { double :bike }
  subject(:docking_station) { described_class.new }

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

    it "accepts broken bikes" do
        allow(bike).to receive(:broken).and_return(bike)
        docking_station.dock(bike.broken(true))
        expect(docking_station.bikes[-1]).to eq bike
    end

    # it "doesn't accept non-bikes for docking" do
    #   expect { docking_station.dock(4) }.to raise_error(ArgumentError)
    # end
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

      # it "It is a Bike" do
      #   allow(bike).
      #   expect(docking_station.dock(double(:bike)).release_bike).to be_a Bike
      # end
      it "Doesn't release broken bikes" do
        allow(bike).to receive(:broken).and_return(bike)
        expect { docking_station.dock(bike.broken(true)).release_bike }.to raise_error(RuntimeError)
      end


      # it "consumes one bike" do
      #   docking_station.dock(double(:bike))
      #   docking_station.release_bike
      #   expect(docking_station).to_not have_bike
      # end

    end
  end

  describe "It can be reported Broken" do
    it { expect(docking_station).to respond_to(:report_broken) }
    it { expect(docking_station.report_broken).to eq true }
    # it "It reports broken" do
    # # allow(bike).to receive(:broken).and_return(b)
    # puts "MIRAR AQUI"
    # allow(bike).to receive(:broken).and_return(bike)
    # allow(bike).to receive(:working?).and_return(false)
    # expect(bike.broken.working?).to eq false
    # end
  end
end
