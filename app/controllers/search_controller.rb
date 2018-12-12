class SearchController < ApplicationController
  def index
    @facade = StationFacade.new(params[:zip_code])
  end
end
