require "spec_helper"

describe SeaservicesController do
  describe "routing" do

    it "routes to #index" do
      get("/seaservices").should route_to("seaservices#index")
    end

    it "routes to #new" do
      get("/seaservices/new").should route_to("seaservices#new")
    end

    it "routes to #show" do
      get("/seaservices/1").should route_to("seaservices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/seaservices/1/edit").should route_to("seaservices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/seaservices").should route_to("seaservices#create")
    end

    it "routes to #update" do
      put("/seaservices/1").should route_to("seaservices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/seaservices/1").should route_to("seaservices#destroy", :id => "1")
    end

  end
end
