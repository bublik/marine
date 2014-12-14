require "spec_helper"

describe VacanciesController do
  describe "routing" do

    it "routes to #index" do
      get("/vacancies").should route_to("vacancies#index")
    end

    it "routes to #new" do
      get("/vacancies/new").should route_to("vacancies#new")
    end

    it "routes to #show" do
      get("/vacancies/1").should route_to("vacancies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vacancies/1/edit").should route_to("vacancies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vacancies").should route_to("vacancies#create")
    end

    it "routes to #update" do
      put("/vacancies/1").should route_to("vacancies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vacancies/1").should route_to("vacancies#destroy", :id => "1")
    end

  end
end
