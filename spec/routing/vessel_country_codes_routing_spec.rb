require "spec_helper"

describe VesselCountryCodesController do
  describe "routing" do

    it "routes to #index" do
      get("/vessel_country_codes").should route_to("vessel_country_codes#index")
    end

    it "routes to #new" do
      get("/vessel_country_codes/new").should route_to("vessel_country_codes#new")
    end

    it "routes to #show" do
      get("/vessel_country_codes/1").should route_to("vessel_country_codes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vessel_country_codes/1/edit").should route_to("vessel_country_codes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vessel_country_codes").should route_to("vessel_country_codes#create")
    end

    it "routes to #update" do
      put("/vessel_country_codes/1").should route_to("vessel_country_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vessel_country_codes/1").should route_to("vessel_country_codes#destroy", :id => "1")
    end

  end
end
