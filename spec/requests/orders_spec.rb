require 'rails_helper'

RSpec.describe "Orders", type: :request do
  let(:user) { FactoryBot.create(:user, confirmed_at: Time.now) }

  before do
    sign_in user
  end

  describe "POST /create" do
    it "creates a new order" do
      cart = create(:cart, user: user) # If using FactoryBot for cart creation
      order_attributes = attributes_for(:order) # If using FactoryBot for order attributes

      post '/orders', params: { order: order_attributes }

      expect(response).to have_http_status(:found) # Check for a successful redirect
      expect(Order.count).to eq(1) # Check that an order was created
      expect(Order.first.user).to eq(user) # Check that the order is associated with the user
      expect(cart.line_items).to be_empty 
    end
    
  end
end
