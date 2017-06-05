require "spec_helper"

RSpec.describe OpenDataAddresses do
  it "has a version number" do
    expect(OpenDataAddresses::VERSION).not_to be nil
  end

  let(:cities) { ['SF', 'NYC'] }
  let(:address_regex) { /[\w\s]+,[A-Za-z\s]+,[A-Z][A-Z],\d\d\d\d\d/ }
  let(:amount) { 10 }

  describe '::address' do
    it 'returns a random address' do
      cities.each do |city|
        address = OpenDataAddresses.address(city)
        expect(address).to match(address_regex)
      end
    end
  end

  describe '::addresses' do
    it 'returns an array of addresses' do
      cities.each do |city|
        addresses = OpenDataAddresses.addresses(amount, city)
        expect(addresses.length).to eq(amount)
        addresses.each {|address| expect(address).to match(address_regex)}
      end
    end
  end
end
