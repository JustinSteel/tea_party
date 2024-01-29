require 'rails_helper'

RSpec.describe CustomerSerializer, type: :serializer do
  let(:customer) { create(:customer) }
  
  subject { JSON.parse(JSONAPI::Serializer.serialize(customer).to_json) }

  it 'includes the expected attributes' do
    expect(subject['data']['attributes'].keys).to contain_exactly('first-name', 'last-name', 'email', 'address')
  end

  it 'has the correct values for attributes' do
    attributes = subject['data']['attributes']
    expect(attributes['first-name']).to eq(customer.first_name)
    expect(attributes['last-name']).to eq(customer.last_name)
    expect(attributes['email']).to eq(customer.email)
    expect(attributes['address']).to eq(customer.address)
  end
end