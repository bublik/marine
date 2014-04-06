require "spec_helper"

describe OverallsizesController do
  describe "routing" do

    it "routes to #index" do
      get("/overallsizes").should route_to("overallsizes#index")
    end

    it "routes to #new" do
      get("/overallsizes/new").should route_to("overallsizes#new")
    end

    it "routes to #show" do
      get("/overallsizes/1").should route_to("overallsizes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/overallsizes/1/edit").should route_to("overallsizes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/overallsizes").should route_to("overallsizes#create")
    end

    it "routes to #update" do
      put("/overallsizes/1").should route_to("overallsizes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/overallsizes/1").should route_to("overallsizes#destroy", :id => "1")
    end

  end
end
