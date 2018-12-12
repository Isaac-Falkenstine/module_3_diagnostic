class FuelService

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def stations_json
    get_json("/api/alt-fuel-stations/v1/nearest.json?limit=10&location=#{@zip_code}&fuel_type=ELEC,LPG&radius=6")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.headers["X-API-Key"] = ENV["api_key"]
    end
  end
end
