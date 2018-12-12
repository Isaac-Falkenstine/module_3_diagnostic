require 'rails_helper'

describe FuelService do

  describe "members" do
    it "finds all CO members" do
      VCR.use_cassette("services/fuel_service") do
        stations = FuelService.new("80203")
        station = station.first

        expect(stations.count).to eq(8)
        expect(station[:name]).to eq("U-Haul")
        expect(station[:distance]).to eq("1.8806")
        expect(station[:address]).to eq("2000 W Lower Colfax Ave")
        expect(station[:fuel_type]).to eq("LPG")
        expect(station[:access_times]).to eq("7am-7pm M-Th and Sat, 7am-8pm F, 9am-5pm Sun")
      end
    end
  end
end
