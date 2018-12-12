class StationFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    @stations ||= station_fetch_result[:fuel_stations].map do |station_data|
      params = {name: station_data[:station_name],
                address: station_data[:street_address],
                fuel_type: station_data[:fuel_type_code],
                distance: station_data[:distance],
                access_times: station_data[:access_days_time]}
    Station.new(params)
    end
  end

  private

  def station_fetch_result
    @station_fetch_result ||= service.stations_json
  end

  def service
    FuelService.new(@zip_code)
  end
end
