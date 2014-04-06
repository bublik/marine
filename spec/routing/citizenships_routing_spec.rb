require "spec_helper"

describe CitizenshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/citizenships").should route_to("citizenships#index")
    end

    it "routes to #new" do
      get("/citizenships/new").should route_to("citizenships#new")
    end

    it "routes to #show" do
      get("/citizenships/1").should route_to("citizenships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/citizenships/1/edit").should route_to("citizenships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/citizenships").should route_to("citizenships#create")
    end

    it "routes to #update" do
      put("/citizenships/1").should route_to("citizenships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/citizenships/1").should route_to("citizenships#destroy", :id => "1")
    end

  end
end
