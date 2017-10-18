class SearchController < ApplicationController
  def index
    #@conn = Faraday.new(:url => 'https://api.data.gov/nrel/alt-fuel-stations/v1') do |faraday|
      #faraday.headers['X-Api-Key'] = ENV['nrel_api_key']
      #faraday.adapter Faraday.default_adapter
    #end
    
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['nrel_api_key']}&fuel_type=ELEC,LPG&location=80203")
    
    stations = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end
end
