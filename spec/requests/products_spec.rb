require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) }  # Create a user and confirm their account

  before do
    sign_in user  # Sign in the user before each test
  end

  describe "GET #index" do
    it "returns a successful response" do
      get "/products"
      expect(response).to render_template('index')
    end
  end

  describe "GET #new" do
    it "returns a successful response" do
      get "/products/new"
      expect(response).to render_template('new')
    end
  end

end
