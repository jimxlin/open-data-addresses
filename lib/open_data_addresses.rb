require "open_data_addresses/version"

module OpenDataAddresses
  def self.address(city='SF')
    address = ''
    csv = get_csv(city);
    address_line = rand(2..csv[:lines])

    line_num = 1
    IO.foreach(csv[:file]) do |line|
      line_num += 1
      next unless line_num == address_line
      address = line.strip
      break
    end

    format_address(address)
  end

  def self.addresses(amount=10, city='SF')
    addresses = []
    csv = get_csv(city)
    address_lines = uniq_rand_nums(amount, 2, csv[:lines]).sort

    address_line = address_lines.shift
    line_num = 1
    IO.foreach(csv[:file]) do |line|
      line_num += 1
      if line_num == address_line
        addresses << line.strip
        address_line = address_lines.shift
      end
      break if addresses.length == amount
    end

    addresses.map { |address| format_address(address) }
  end

  private

  def self.format_address(string)
    ary = string.split(',')
    { street: ary[0], city: ary[1], state: ary[2], zip: ary[3] }
  end

  def self.get_csv(city)
    files = {
      'SF'  => "#{File.dirname(__FILE__)}/addresses/sanfrancisco_registered_business_locations.csv",
      'NYC' => "#{File.dirname(__FILE__)}/addresses/newyorkcity_legally_operating_businesses.csv"
    }
    lines = File.open(files[city], &:readline).to_i;

    { file: files[city], lines: lines }
  end

  def self.uniq_rand_nums(amount, min, max)
    raise 'Invalid arguments' if max - min + 1 < amount
    nums = amount.times.map { rand(min..max) }
    return nums if nums.uniq.length == amount

    nums.uniq!
    while nums.length < amount do
      num = rand(min..max)
      nums << num unless nums.include?(num)
    end
    nums
  end
end
