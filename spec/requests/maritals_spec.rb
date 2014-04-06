require 'spec_helper'

describe "Maritals" do
  describe "GET /maritals" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get maritals_path
      response.status.should be(200)
    end
  end
end
