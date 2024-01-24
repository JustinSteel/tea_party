class Api::V1::CustomersController < ApplicationRecord
  def subscriptions
    customer = Customer.find(params[:id])
    
  end
end