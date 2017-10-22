class SearchPresenter
  def stations(zip)
    raw_stations = NrelService.new.fuel_stations(zip)
  end
end
