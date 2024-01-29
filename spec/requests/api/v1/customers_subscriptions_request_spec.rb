require 'rails_helper'

RSpec.describe Api::V1::CustomerSubscriptionsController, type: :controller do
  let(:customer) { create(:customer) }
  let(:subscription) { create(:subscription) }

  describe 'GET #index' do
    it 'returns a success response' do
      create(:customer_subscription, customer: customer, subscription: subscription)
      get :index, params: { customer_id: customer.id, subscription_id: subscription.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { { customer_id: customer.id, subscription_id: subscription.id, status: 'active' } }

    context 'with valid parameters' do
      it 'creates a new CustomerSubscription' do
        expect {
          post :create, params: { customer_subscription: valid_attributes }
        }.to change(CustomerSubscription, :count).by(1)
      end

      it 'renders a JSON response with the new customer_subscription' do
        post :create, params: { customer_subscription: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH #update' do
    let(:customer_subscription) { create(:customer_subscription, customer: customer, subscription: subscription) }
    let(:new_attributes) { { status: 'cancelled' } }

    it 'updates the requested customer_subscription' do
      patch :update, params: { id: customer_subscription.id, customer_subscription: new_attributes }
      customer_subscription.reload
      expect(customer_subscription.status).to eq('cancelled')
    end

    it 'renders a JSON response with the customer_subscription' do
      patch :update, params: { id: customer_subscription.id, customer_subscription: new_attributes }
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to match(a_string_including('application/json'))
    end
  end
end