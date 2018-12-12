class StationFacade
  def initialize(user)
    @user = user
  end



  def station_fetch_result
    @station_fetch_result ||= service.stations_json
  end

  def service
    StationService.new(@zip_code)
  end
end
