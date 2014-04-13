require "spec_helper"

describe CertsController do
  describe "routing" do

    it "routes to #index" do
      get("/certs").should route_to("certs#index")
    end

    it "routes to #new" do
      get("/certs/new").should route_to("certs#new")
    end

    it "routes to #show" do
      get("/certs/1").should route_to("certs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/certs/1/edit").should route_to("certs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/certs").should route_to("certs#create")
    end

    it "routes to #update" do
      put("/certs/1").should route_to("certs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/certs/1").should route_to("certs#destroy", :id => "1")
    end

  end
end
