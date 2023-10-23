require 'rails_helper'

RSpec.describe "Api::V1::Products", type: :request do
  describe "GET /index" do
    it "returns http success" do
      # Create test products using the factory
      FactoryBot.create_list(:product, 3)

      # Make the GET request to the endpoint
      get "/api/v1/products/index"

      # Expect a successful response
      expect(response).to have_http_status(:success)
    end
  end
end
