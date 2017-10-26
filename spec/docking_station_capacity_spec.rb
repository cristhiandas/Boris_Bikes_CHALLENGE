require "classes"

describe DockingStation do

  subject { described_class.new }

  # describe "can check whether there are bikes" do
  #
  #   it "responds to `has_bike?`" do
  #     is_expected.to respond_to :has_bike?
  #   end
  #
  #   it "return false with no bikes" do
  #     is_expected.to_not have_bike
  #   end
  #
  #   it "return true when has bikes" do
  #     expect(described_class.new.dock(double(:bike))).to have_bike
  #   end
  #
  # end

  describe "has capacity limit" do

    it "responds to `capacity_limit`" do
      is_expected.to respond_to :capacity_limit
    end

    it "created with capacity limit of 20" do
      expect(described_class.new.capacity_limit).to eq 20
    end

    it "created with custom capacity limit" do
      expect(described_class.new(5).capacity_limit).to eq 5
    end

  end

  describe "knows capacity" do

    it "responds to `capacity`" do
      is_expected.to respond_to :capacity
    end

    it "created with 0 capacity" do
      expect(described_class.new.capacity).to eq 0
    end

    it "correctly checks capacity" do
      ds = described_class.new
      5.times { ds.dock(double(:bike)) }
      expect(ds.capacity).to eq 5
    end

  end

  # describe "knows when at capacity" do
  #
  #   it "responds to `at_capacity?`" do
  #     is_expected.to respond_to :at_capacity?
  #   end
  #
  #   it "false when below capacity" do
  #     is_expected.to_not be_at_capacity
  #   end
  #
  #   it "true when at capacity" do
  #     expect(described_class.new(0)).to be_at_capacity
  #   end
  #
  # end

end
