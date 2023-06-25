require "rails_helper"

RSpec.describe ViewingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/watch-list").to route_to("viewings#index")
    end

    it "routes to #new" do
      expect(get: "/watch-list/new").to route_to("viewings#new")
    end

    it "routes to #show" do
      expect(get: "/watch-list/1").to route_to("viewings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/watch-list/1/edit").to route_to("viewings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/watch-list").to route_to("viewings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/watch-list/1").to route_to("viewings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/watch-list/1").to route_to("viewings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/watch-list/1").to route_to("viewings#destroy", id: "1")
    end
  end
end
