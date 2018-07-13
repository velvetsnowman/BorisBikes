require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }
  it { is_expected.to respond_to(:bikes) }
  it { is_expected.to respond_to(:dock).with(1).argument }

  it "should say if a bike is working or not" do
    subject.dock(Bike.new)
    bike = subject.release_bike
    expect(bike.working?).to be true
  end

  it 'should respond to bikes that are currently docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes[0]).to eq bike
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
    it 'docks a bike' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'raises an error if capacity of 20 is reached' do
      20.times {subject.dock(Bike.new)}
      expect {subject.dock(Bike.new)}.to raise_error('Capacity is full')
    end

    it 'can dock 20 bikes' do
      20.times {subject.dock(Bike.new)}
      expect(subject.bikes.length).to eq 20
    end
  end

end
