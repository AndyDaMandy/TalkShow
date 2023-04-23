require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /privacy" do
    it "returns http success" do
      get "/home/privacy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /tmdb" do
    it "returns http success" do
      get "/home/tmdb"
      expect(response).to have_http_status(:success)
    end
  end

end
