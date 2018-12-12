require 'rails_helper'

describe FuelService do

  describe "members" do
    it "finds all CO members" do
      VCR.use_cassette("services/fuel_service") do
        stations = FuelService.new("80203")
        station = stations.stations_json[:fuel_stations].first

        expect(station[:station_name]).to eq("UDR")
        expect(station[:distance]).to eq(0.31422)
        expect(station[:street_address]).to eq("800 Acoma St")
        expect(station[:fuel_type_code]).to eq("ELEC")
        expect(station[:access_days_time]).to eq("24 hours daily")
      end
    end
  end
end
