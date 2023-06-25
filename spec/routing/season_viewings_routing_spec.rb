require "rails_helper"

RSpec.describe SeasonViewingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/season-watch-list").to route_to("season_viewings#index")
    end

    it "routes to #new" do
      expect(get: "/season-watch-list/new").to route_to("season_viewings#new")
    end

    it "routes to #show" do
      expect(get: "/season-watch-list/1").to route_to("season_viewings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/season-watch-list/1/edit").to route_to("season_viewings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/season-watch-list").to route_to("season_viewings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/season-watch-list/1").to route_to("season_viewings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/season-watch-list/1").to route_to("season_viewings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/season-watch-list/1").to route_to("season_viewings#destroy", id: "1")
    end
  end
end
