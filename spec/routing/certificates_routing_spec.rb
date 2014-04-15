require "spec_helper"

describe CertificatesController do
  describe "routing" do

    it "routes to #index" do
      get("/certificates").should route_to("certificates#index")
    end

    it "routes to #new" do
      get("/certificates/new").should route_to("certificates#new")
    end

    it "routes to #show" do
      get("/certificates/1").should route_to("certificates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/certificates/1/edit").should route_to("certificates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/certificates").should route_to("certificates#create")
    end

    it "routes to #update" do
      put("/certificates/1").should route_to("certificates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/certificates/1").should route_to("certificates#destroy", :id => "1")
    end

  end
end
