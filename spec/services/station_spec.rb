require 'rails_helper'

RSpec.describe Station do
  attrs = {
            station_name: "City of Denver",
            street_address: "201 W Colfax Ave",
            state: "CO",
            zip: "80202",
            fuel_type_code: "ELEC",
            distance: "0.75",
            access_days_time: "City fleet use only"
          }

  let (:station) { Station.new(attrs) }

  context "Class methods" do
    it "is instantiated with valid attributes" do
      expect(station.name).to eq("City of Denver")
      expect(station.fuel_types).to eq("ELEC")
      expect(station.distance).to eq("0.75")
    end
  end

  context "Instance methods" do
    it "#address" do
      expect(station.address).to eq("201 W Colfax Ave, CO 80202")
    end
  end

end
