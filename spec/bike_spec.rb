require 'bike'
describe Bike do
  let (:bike) { Bike.new }
  it 'should say if a bike is broken or not' do
    expect(bike.is_broken).to be true
  end
end
