require "spec_helper"

describe BlockedPhoneNumbersController do
  describe "routing" do

    it "routes to #index" do
      get("/blocked_phone_numbers").should route_to("blocked_phone_numbers#index")
    end

    it "routes to #new" do
      get("/blocked_phone_numbers/new").should route_to("blocked_phone_numbers#new")
    end

    it "routes to #show" do
      get("/blocked_phone_numbers/1").should route_to("blocked_phone_numbers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/blocked_phone_numbers/1/edit").should route_to("blocked_phone_numbers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/blocked_phone_numbers").should route_to("blocked_phone_numbers#create")
    end

    it "routes to #update" do
      put("/blocked_phone_numbers/1").should route_to("blocked_phone_numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/blocked_phone_numbers/1").should route_to("blocked_phone_numbers#destroy", :id => "1")
    end

  end
end
