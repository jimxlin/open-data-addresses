require "spec_helper"

RSpec.describe OpenDataAddresses do
  it "has a version number" do
    expect(OpenDataAddresses::VERSION).not_to be nil
  end

  let(:cities) { ['SF', 'NYC'] }
  let(:street_regex) { /[\w\s]+/ }
  let(:city_regex) { /[A-Za-z\s]+/ }
  let(:state_regex) { /[A-Z][A-Z]/ }
  let(:zip_regex) { /\d\d\d\d\d/ }
  let(:amount) { 10 }

  describe '::address' do
    it 'returns a random address' do
      cities.each do |city|
        address = OpenDataAddresses.address(city)
        expect(address[:street]).to match(street_regex)
        expect(address[:city]).to match(city_regex)
        expect(address[:state]).to match(state_regex)
        expect(address[:zip]).to match(zip_regex)
      end
    end
  end

  describe '::addresses' do
    it 'returns an array of addresses' do
      cities.each do |city|
        addresses = OpenDataAddresses.addresses(amount, city)
        expect(addresses.length).to eq(amount)
        addresses.each do |address|
          expect(address[:street]).to match(street_regex)
          expect(address[:city]).to match(city_regex)
          expect(address[:state]).to match(state_regex)
          expect(address[:zip]).to match(zip_regex)
        end
      end
    end
  end
end
