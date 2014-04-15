require 'spec_helper'

describe "VesselEngines" do
  describe "GET /vessel_engines" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vessel_engines_path
      response.status.should be(200)
    end
  end
end
