require "spec_helper"

describe VesselTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/vessel_types").should route_to("vessel_types#index")
    end

    it "routes to #new" do
      get("/vessel_types/new").should route_to("vessel_types#new")
    end

    it "routes to #show" do
      get("/vessel_types/1").should route_to("vessel_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vessel_types/1/edit").should route_to("vessel_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vessel_types").should route_to("vessel_types#create")
    end

    it "routes to #update" do
      put("/vessel_types/1").should route_to("vessel_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vessel_types/1").should route_to("vessel_types#destroy", :id => "1")
    end

  end
end
