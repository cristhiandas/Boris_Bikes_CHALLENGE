require "classes"

describe Bike do
  it { expect(Bike.new).to respond_to(:working?)}
  it { expect(Bike.new).to respond_to(:broken)}

  context "If broken"
    it { expect(Bike.new(true).working?).to eq false }

end
