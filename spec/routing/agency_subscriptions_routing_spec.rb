require "spec_helper"

describe AgencySubscriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/agency_subscriptions").should route_to("agency_subscriptions#index")
    end

    it "routes to #new" do
      get("/agency_subscriptions/new").should route_to("agency_subscriptions#new")
    end

    it "routes to #show" do
      get("/agency_subscriptions/1").should route_to("agency_subscriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/agency_subscriptions/1/edit").should route_to("agency_subscriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/agency_subscriptions").should route_to("agency_subscriptions#create")
    end

    it "routes to #update" do
      put("/agency_subscriptions/1").should route_to("agency_subscriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/agency_subscriptions/1").should route_to("agency_subscriptions#destroy", :id => "1")
    end

  end
end
