require "spec_helper"

describe HairsController do
  describe "routing" do

    it "routes to #index" do
      get("/hairs").should route_to("hairs#index")
    end

    it "routes to #new" do
      get("/hairs/new").should route_to("hairs#new")
    end

    it "routes to #show" do
      get("/hairs/1").should route_to("hairs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/hairs/1/edit").should route_to("hairs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/hairs").should route_to("hairs#create")
    end

    it "routes to #update" do
      put("/hairs/1").should route_to("hairs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/hairs/1").should route_to("hairs#destroy", :id => "1")
    end

  end
end
