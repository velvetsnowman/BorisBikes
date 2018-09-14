require 'docking_station'

describe DockingStation do

  before do
      allow($stdout).to receive(:write)
  end

  let (:dock) {DockingStation.new}
  let (:bike) {double :bike}
  describe '#capacity' do
    it "has a default capacity" do
      expect(dock.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "gives a capacity of 30" do
      dock = DockingStation.new(30)
      expect(dock.capacity).to eq 30
    end
  end

  it 'should should show bikes that are currently docked' do
    allow(dock).to receive(:gets).and_return("n\n")
    dock.dock(:bike)
    expect(dock.bikes).to include({:bike => :bike})
  end

  it 'should should show bikes that are currently docked, and broken' do
    allow(dock).to receive(:gets).and_return("Y\n")
    dock.dock(:bike)
    expect(dock.bikes).to include({:bike=>:bike, :broken=>"true"})
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes available' do
      expect {dock.release_bike}.to raise_error('There are no available bikes')
    end

    it 'wont release a bike if it is broken' do
      allow(dock).to receive(:gets).and_return("Y\n")
      dock.dock(:bike)
      expect {dock.release_bike}.to raise_error
    end

    it 'wont release a bike if it is broken' do
      allow(dock).to receive(:gets).and_return("Y\n")
      dock.dock(:bike)
      allow(dock).to receive(:gets).and_return("n\n")
      dock.dock(:bike)
      dock.release_bike
      expect(dock.bikes.length).to eq 1
    end
  end

  describe '#dock' do

    it 'raises an error if capacity is reached' do
      allow(dock).to receive(:gets).and_return("n\n")
      dock.capacity.times {dock.dock(:bike)}
      expect {dock.dock(:bike)}.to raise_error('Capacity is full')
    end

    it 'can dock the maximum capacity of bikes' do
      allow(dock).to receive(:gets).and_return("n\n")
      dock.capacity.times {dock.dock(:bike)}
      expect(dock.bikes.length).to eq dock.capacity
    end
  end

end
