# Open Data Addresses

This is a generator for real addresses, meant to be used for developing and testing applications that require them, such as geocoding. Data is taken from various U.S. government open data websites, more information [here](https://www.data.gov/open-gov/).

Data sets used:

[San Francisco](https://datasf.org/): Registered Business Locations  
[New York City](https://opendata.cityofnewyork.us/): Legally Operating Businesses

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_data_addresses'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install open_data_addresses

## Usage

```ruby
# Two region are currently supported:
#   'SF'  => San Francisco (default)
#   'NYC' => New York City

OpenDataAddresses.address('SF') #=> { street: '1955 Leavenworth St', city: 'San Francisco', state: 'CA', zip: '94133' }

# Defaults to 10 addresses
# Addresses are guaranteed to be unique
OpenDataAddresses.addresses(2, 'SF') #=> [{ street: '1455 Market St', city: 'San Francisco', state: 'CA', zip: '94103' }, { street: '840 Post St', city: 'San Francisco', state: 'CA', zip: '94109' }]
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
