require_relative 'bike'

class DockingStation
  def initialize
    @bikes = []
  end

  def release_bike
    fail 'There are no available bikes' unless @bike
    @bikes.pop
  end

  def dock(bike)
    fail 'Capacity is full' unless @bikes.length < 20
    @bikes.push(bike)
    @bikes[@bikes.length - 1]
  end

  attr_reader :bikes
  # def bikes
  #   @bikes
  # end
end
