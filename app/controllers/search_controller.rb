class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: 'https://api.data.gov/nrel/alt-fuel-stations/v1') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['nrel_api_key']
      faraday.adapter Faraday.default_adapter
    end
    
    response = @conn.get('/nearest.json?fuel_type=ELEC,LPG&location=80203')
    binding.pry
    stations = JSON.parse(response.body, symbolize_names: true)
  end
end
