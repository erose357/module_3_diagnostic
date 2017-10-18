class SearchController < ApplicationController
  def index
    #@conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1') do |faraday|
      #faraday.headers['X-Api-Key'] = ENV['nrel_api_key']
      #faraday.adapter Faraday.default_adapter
    #end
    
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=ELEC,LPG&location=#{params[:q]}&limit=10")

    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = raw_stations.map do |raw_station|
      Station.new(raw_station)
    end

    
  end
end
