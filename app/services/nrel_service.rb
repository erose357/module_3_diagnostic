class NrelService
  def conn(req_params) 
    RestClient::Resource.new("https://api.data.gov/nrel/alt-fuel-stations/v1", :headers => {'X-Api-Key' => ENV['nrel_api_key'], :params => req_params})
  end

  def req_params(zip) 
    {fuel_type: 'ELEC,LPG', location: zip, limit: 10, radius: 6}
  end

  def fuel_stations(zip)
    get_stations(parse_json(conn(req_params(zip))['/nearest.json'].get)[:fuel_stations])
  end

  private
    def parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def get_stations(raw_stations)
      raw_stations.map { |raw_station| Station.new(raw_station) }
    end
end
