require "spec_helper"

describe MaritalsController do
  describe "routing" do

    it "routes to #index" do
      get("/maritals").should route_to("maritals#index")
    end

    it "routes to #new" do
      get("/maritals/new").should route_to("maritals#new")
    end

    it "routes to #show" do
      get("/maritals/1").should route_to("maritals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/maritals/1/edit").should route_to("maritals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/maritals").should route_to("maritals#create")
    end

    it "routes to #update" do
      put("/maritals/1").should route_to("maritals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/maritals/1").should route_to("maritals#destroy", :id => "1")
    end

  end
end
