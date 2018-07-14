require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:bikes) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#capacity' do
    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "gives a capacity of 35" do
      expect(DockingStation.new(30).capacity).to eq 30
    end
  end

  it 'should should show bikes that are currently docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
  end

  describe '#working?' do
    it "should say if a bike is working or not" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike.working?).to be true
    end
  end

  describe '#release_bike' do
    it 'raises an error if there are no bikes available' do
      expect {subject.release_bike}.to raise_error('There are no available bikes')
    end

    it 'should release a bike if there is an available bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe '#dock' do

    it 'raises an error if capacity is reached' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error('Capacity is full')
    end

    it 'can dock the maximum capacity of bikes' do
      subject.capacity.times {subject.dock(Bike.new)}
      expect(subject.bikes.length).to eq subject.capacity
    end
  end

end
