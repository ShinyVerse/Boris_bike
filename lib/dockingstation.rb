require "./lib/bike.rb"

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bike_rack

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_rack = []
  end

  def release_bike
    raise "No more bikes left" if empty?
    bike = Bike.new
  end

  def dock_bike(object)
    raise "Sorry, the bike rack is full" if full?
    bike_rack.push(object)
  end

  def see_bikes
    bike_rack
  end

  private
  def full?
    bike_rack.count >= @capacity
  end

  def empty?
    bike_rack.count < 1
  end
end
