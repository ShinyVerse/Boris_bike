require 'bike'


class DockingStation

 DEFAULT_CAPACITY = 20
 attr_reader :bike_store, :capacity

 def initialize(capacity = DEFAULT_CAPACITY)
   @bike_store = []
   @capacity = capacity
 end

 def release_bike
   fail "Sorry, no bikes!" if empty?
   @bike_store.each do |bike|
     return @bike_store.delete(bike) if bike.working?
   end
   fail 'Sorry, all available bikes are broken'
 end

 def dock(bike)
   fail "Sorry, no space!" if full?
   @bike_store << bike
 end

 private

 def full?
   @bike_store.count >= DEFAULT_CAPACITY
 end

 def empty?
   @bike_store.empty?
 end

end

# class DockingStation == With Jonathan
#
#   DEFAULT_CAPACITY = 20
#   attr_reader :bike_rack
#
#   def initialize(capacity = DEFAULT_CAPACITY)
#     @capacity = capacity
#     @bike_rack = []
#   end
#
#   def release_bike
#     raise "No more bikes left" if empty?
#     bike = Bike.new
#   end
#
#   def dock_bike(object)
#     raise "Sorry, the bike rack is full" if full?
#     bike_rack.push(object)
#   end
#
#   def see_bikes
#     bike_rack
#   end
#
#   private
#   def full?
#     bike_rack.count >= @capacity
#   end
#
#   def empty?
#     bike_rack.count < 1
#   end
# end
