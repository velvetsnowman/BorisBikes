require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  # def bikes
  #   @bikes
  # end
DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def dock(bike)
    fail 'Capacity is full' if full?
    @bikes << bike
  end

  def release_bike
    fail 'There are no available bikes' if empty?
    @bikes.pop
  end

  private
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end








end
