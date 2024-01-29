# class Api::V1::TeasController < ApplicationController
#   def create
#     @tea = Tea.new(tea_params)
#     if @tea.save
#       render json: TeaSerializer.new(@tea), status: :created
#     else
#       render json: { error: @tea.errors.full_messages }, status: :unprocessable_entity
#     end
#   end
# end