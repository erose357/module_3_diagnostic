class NrelService
  def fuel_stations(zip)
    params_hash = {fuel_type: 'ELEC,LPG',
                   location: zip,
                   limit: 10,
                   radius: 6}

    conn = RestClient::Resource.new("https://api.data.gov/nrel/alt-fuel-stations/v1", :headers => {'X-Api-Key' => ENV['nrel_api_key'], :params => params_hash})

    response = conn['/nearest.json'].get

    raw_stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = raw_stations.map do |raw_station|
      Station.new(raw_station)
    end
  end
end
