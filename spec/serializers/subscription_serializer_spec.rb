require 'rails_helper'

RSpec.describe SubscriptionSerializer, type: :serializer do
  let(:subscription) { create(:subscription) }
  
  subject { JSON.parse(JSONAPI::Serializer.serialize(subscription).to_json) }

  it 'includes the expected attributes' do
    expect(subject['data']['attributes'].keys).to contain_exactly('title', 'price', 'status', 'frequency')
  end

  it 'has the correct values for attributes' do
    attributes = subject['data']['attributes']
    expect(attributes['title']).to eq(subscription.title)
    expect(attributes['price']).to eq(subscription.price)
    expect(attributes['status']).to eq(subscription.status)
    expect(attributes['frequency']).to eq(subscription.frequency)
  end
end