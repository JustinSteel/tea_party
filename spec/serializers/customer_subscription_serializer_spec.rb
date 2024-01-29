require 'rails_helper'

RSpec.describe CustomerSubscriptionSerializer, type: :serializer do
  let(:subscription) { create(:subscription) }
  let(:customer) { create(:customer) }
  let(:customer_subscription) { create(:customer_subscription, customer: customer, subscription: subscription) }
  
  subject { JSON.parse(JSONAPI::Serializer.serialize(customer_subscription).to_json) }

  it 'includes the expected attributes' do
    expect(subject['data']['attributes'].keys).to contain_exactly('customer-id', 'subscription-id', 'status')
  end

  it 'has the correct values for attributes' do
    attributes = subject['data']['attributes']
    expect(attributes['customer-id']).to eq(customer_subscription.customer_id)
    expect(attributes['subscription-id']).to eq(customer_subscription.subscription_id)
    expect(attributes['status']).to eq(customer_subscription.status)
  end
end