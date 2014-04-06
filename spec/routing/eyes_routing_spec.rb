require "spec_helper"

describe EyesController do
  describe "routing" do

    it "routes to #index" do
      get("/eyes").should route_to("eyes#index")
    end

    it "routes to #new" do
      get("/eyes/new").should route_to("eyes#new")
    end

    it "routes to #show" do
      get("/eyes/1").should route_to("eyes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/eyes/1/edit").should route_to("eyes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/eyes").should route_to("eyes#create")
    end

    it "routes to #update" do
      put("/eyes/1").should route_to("eyes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/eyes/1").should route_to("eyes#destroy", :id => "1")
    end

  end
end
