require_relative 'bike'

class DockingStation
  attr_reader :bikes
  # def bikes
  #   @bikes
  # end
DEFAULT_CAPACITY = 20
  def initialize
    @bikes = []
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
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end








end
