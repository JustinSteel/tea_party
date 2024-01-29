# class Api::V1::CustomersController < ApplicationRecord

#   def create
#     @customer = Customer.new(customer_params)

#     if @customer.save
#       render json: CustomerSerializer.new(@customer), status: :created
#     else
#       render json: { error: @customer.errors.full_messages }, status: :unauthorized
#     end
#   end

#   private

#   def customer_params
#     params.permit(:first_name, :last_name, :email, :address)
#   end
# end