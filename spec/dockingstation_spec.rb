require 'dockingstation'

describe DockingStation do
  # it "should create a DockingStation" do
  #   expect (DockingStation.new).to be_an_instance_of(DockingStation)
  # end
  let(:working_bike) {double :bike}
  let(:broken_bike) {double :bike}
  it "should respond to a message" do
    expect(subject).to respond_to :release_bike
  end

  it { should respond_to (:release_bike) }

  it "get a working bike" do
    allow(working_bike).to receive(:working?).and_return(true)
    subject.dock(working_bike)
    expect(subject.release_bike.working?).to be true
    # expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  #it "dock a bike" do
    #expect(subject.dock_bike).to be_an_instance_of(Bike)
  #end
  it { should respond_to (:dock) }

  it "should raise an error if no bikes available" do
    expect {subject.release_bike}.to raise_error("Sorry, no bikes!")
  end

  it "should raise and error if docking a bike at a station that already has a bike docked" do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(double(:bike))}
    expect {subject.dock(double(:bike))}.to raise_error("Sorry, no space!")
  end

  it "station has a bike" do
    bike = double(:bike)
    subject.dock(bike)
    expect(subject.bike_store).to include(bike)
  end

  # it { should_not respond_to (:full?) }

  it "should allow capacity to be set on creation" do
    capacity = 5
    station = DockingStation.new(capacity)
    expect(station.capacity).to eq(capacity)
  end

  it 'station should not release broken bikes' do
    allow(broken_bike).to receive(:working?).and_return(false)
    station = DockingStation.new()
    station.dock(broken_bike)
    expect {station.release_bike}.to raise_error("Sorry, all available bikes are broken")
  end
  it "bike_store is accurate length, regardless of bikes broken or not" do
    working_bike = double(:bike)
    broken_bike = double(:bike)
    station = DockingStation.new()
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.bike_store.length).to eq 2
  end

end

# === with Jonathan
 # require 'dockingstation'
#
# describe DockingStation do
#   bike = Bike.new
#   station = DockingStation.new
#   station.dock_bike(bike)
#
#   it { is_expected.to respond_to(:release_bike)}
#
#   it 'creates a new bike object when calling release_bike' do
#     expect(station.release_bike).to an_instance_of(Bike)
#   end
#
#   it 'checks that the bike is working?' do
#     expect(station.release_bike.working?).to eq true
#   end
#
#   it 'responds to method called dock_bike' do
#     expect(subject.dock_bike(bike)).to an_instance_of(Array)
#   end
#
#   it { is_expected.to respond_to(:see_bikes)}
#
#   it 'shows a bike if there is one.' do
#     expect(station.see_bikes[0]).to eq(bike)
#   end
#
#   it "raise error if there are no more bikes" do
#     expect {subject.release_bike}.to raise_error("No more bikes left")
#   end
#
#   it 'DockingStation has DEFAULT_CAPACITY constant' do
#     expect(DockingStation::DEFAULT_CAPACITY).to an_instance_of(Integer)
#   end
#
#   it "raises an error if there is no more space on the rack" do
#     expect {DockingStation::DEFAULT_CAPACITY.times {station.dock_bike(Bike.new)} }.to raise_error("Sorry, the bike rack is full")
#   end
#
#   it "user can overide capacity " do
#     new_station = DockingStation.new(30)
#     expect {25.times {new_station.dock_bike(Bike.new)}}.not_to raise_error
#   end
#
#   it "if capacity not given, DEFAULT_CAPACITY is used" do
#     new_station = DockingStation.new
#     expect {DockingStation::DEFAULT_CAPACITY.times {new_station.dock_bike(Bike.new)}}.not_to raise_error
#     expect {1.times {new_station.dock_bike(Bike.new)}}.to raise_error("Sorry, the bike rack is full")
#   end
#
# end = with Jonathan
