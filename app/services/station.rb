class Station
  attr_reader :name, :fuel_types, :distance, :access_times
  
  def initialize(attrs)
    @name = attrs[:station_name]
    @street_address = attrs[:street_address]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @fuel_types = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end

  def address
    "#{@street_address}, #{@state} #{@zip}"
  end
end
