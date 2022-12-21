require 'rails_helper'

RSpec.describe "MysteryLunches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mystery_lunches"
      expect(response).to have_http_status(:success)
    end
  end

end
