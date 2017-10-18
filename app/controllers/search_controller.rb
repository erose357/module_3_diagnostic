class SearchController < ApplicationController
  def index
    @conn = Faraday.new(url: https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json) do |faraday|
      faraday.headers['X-Api-Key'] = ENV['nrel_api_key']
      faraday.adapter Faraday.default_adapter
    end
  end
end
