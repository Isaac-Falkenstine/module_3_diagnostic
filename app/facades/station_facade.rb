class StationFacade
  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations
    @stations ||= station_fetch_result.map do |station_data|
      params = {name: station_data[:name],
                address: station_data[:address],
                fuel_type: station_data[:fuel_type],
                distance: station_data[:distance],
                access_times: station_data[:access_times]}
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
