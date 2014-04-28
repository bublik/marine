require "spec_helper"

describe LangsController do
  describe "routing" do

    it "routes to #index" do
      get("/langs").should route_to("langs#index")
    end

    it "routes to #new" do
      get("/langs/new").should route_to("langs#new")
    end

    it "routes to #show" do
      get("/langs/1").should route_to("langs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/langs/1/edit").should route_to("langs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/langs").should route_to("langs#create")
    end

    it "routes to #update" do
      put("/langs/1").should route_to("langs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/langs/1").should route_to("langs#destroy", :id => "1")
    end

  end
end
