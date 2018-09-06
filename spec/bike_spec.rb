require "./lib/bike.rb"

describe Bike do
  it { should respond_to (:working?) }

  it 'check if bike is working' do
    expect(subject.working?).to eq true
  end

  it 'should allow a user to report the bike as broken' do
    subject.report_broken
    expect(subject.working?).to be false
  end

end


# require 'bike' == With Jonathan
#
# describe Bike do
#   it 'expects an object from the Bike class to respond to the working? method' do
#     expect(Bike.new()).to respond_to(:working?)
#   end
# end
