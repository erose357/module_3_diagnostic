class SearchController < ApplicationController
  def index
    @stations = SearchPresenter.new.stations(params[:q])
  end
end
