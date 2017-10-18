class SearchController < ApplicationController
  def index
    #@conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1') do |faraday|
      #faraday.headers['X-Api-Key'] = ENV['nrel_api_key']
      #faraday.adapter Faraday.default_adapter
    #end
    
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=ELEC,LPG&location=80203")
    
    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = raw_stations.map do |raw_station|
      Station.new(raw_station)
    end

    
  end
end

class Station
  attr_reader :name, :street_address, :state, :zip, :fuel_types, :distance, :access_times
  
  def initialize(attrs)
    @name = attrs[:station_name]
    @street_address = attrs[:street_address]
    @state = attrs[:state]
    @zip = attrs[:zip]
    @fuel_types = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end
end
