require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 5
  attr_reader :bikes,
              :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @quality_report = Bike.new
  end

  def dock(bike)
    fail 'Capacity is full' if full?
    puts 'Is the bike broken?'
    if gets.chomp.capitalize == "Y"
      broken = @quality_report.is_broken
      @bikes << {bike: bike, broken: "#{broken}"}
    else
      @bikes << {bike: bike}
    end
  end

  def release_bike
    fail 'There are no available bikes' if empty?
    number = 0
    while number <= @bikes.length do
      if @bikes[number].include?(:broken)
        number += 1
      else
        @bikes.delete_at(number)
        break
      end
    end
  end

  private
  def full?
    @bikes.count >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end
