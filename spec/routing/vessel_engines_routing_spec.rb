require "spec_helper"

describe VesselEnginesController do
  describe "routing" do

    it "routes to #index" do
      get("/vessel_engines").should route_to("vessel_engines#index")
    end

    it "routes to #new" do
      get("/vessel_engines/new").should route_to("vessel_engines#new")
    end

    it "routes to #show" do
      get("/vessel_engines/1").should route_to("vessel_engines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vessel_engines/1/edit").should route_to("vessel_engines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vessel_engines").should route_to("vessel_engines#create")
    end

    it "routes to #update" do
      put("/vessel_engines/1").should route_to("vessel_engines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vessel_engines/1").should route_to("vessel_engines#destroy", :id => "1")
    end

  end
end
