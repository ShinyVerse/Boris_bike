require 'dockingstation'

describe DockingStation do
  bike = Bike.new
  station = DockingStation.new
  station.dock_bike(bike)

  it { is_expected.to respond_to(:release_bike)}

  it 'creates a new bike object when calling release_bike' do
    expect(station.release_bike).to an_instance_of(Bike)
  end

  it 'checks that the bike is working?' do
    expect(station.release_bike.working?).to eq true
  end

  it 'responds to method called dock_bike' do
    expect(subject.dock_bike(bike)).to an_instance_of(Array)
  end

  it { is_expected.to respond_to(:see_bikes)}

  it 'shows a bike if there is one.' do
    expect(station.see_bikes[0]).to eq(bike)
  end

  it "raise error if there are no more bikes" do
    expect {subject.release_bike}.to raise_error("No more bikes left")
  end

  it 'DockingStation has DEFAULT_CAPACITY constant' do
    expect(DockingStation::DEFAULT_CAPACITY).to an_instance_of(Integer)
  end

  it "raises an error if there is no more space on the rack" do
    expect {DockingStation::DEFAULT_CAPACITY.times {station.dock_bike(Bike.new)} }.to raise_error("Sorry, the bike rack is full")
  end

  it "user can overide capacity " do
    new_station = DockingStation.new(30)
    expect {25.times {new_station.dock_bike(Bike.new)}}.not_to raise_error
  end

  it "if capacity not given, DEFAULT_CAPACITY is used" do
    new_station = DockingStation.new
    expect {DockingStation::DEFAULT_CAPACITY.times {new_station.dock_bike(Bike.new)}}.not_to raise_error
    expect {1.times {new_station.dock_bike(Bike.new)}}.to raise_error("Sorry, the bike rack is full")
  end

end
