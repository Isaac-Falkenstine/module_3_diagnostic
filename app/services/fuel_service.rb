class FuelService

  def initialize(token, zip_code)
    @token = token
    @zip_code = zip_code
  end

  def stations_json
    get_json("/api/alt-fuel-stations/v1.json?zip=#{@zip_code}")
  end

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(:url => 'https://developer.nrel.gov') do |faraday|
      faraday.headers['api_key'] = @token
      # https://developer.nrel.gov/api/alt-fuel-stations/v1.json?limit=1&api_key=YOUR_KEY_HERE'
      faraday.adapter  Faraday.default_adapter
    end
  end
end
