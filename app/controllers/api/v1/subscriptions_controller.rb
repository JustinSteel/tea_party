# class Api::V1::SubscriptionsController < ApplicationController
#   before_action :get_tea, only: %i[ index create update ]

#   def index
#     render json: SubscriptionSerializer.new(@tea.subscriptions)
#   end

#   def create
#     @tea = Tea.find(params[:tea_id])
#     @subscription = @tea.subscriptions.build(subscription_params)
  
#     if @subscription.save
#       render json: { message: "Subscription created successfully" }, status: :created
#     else
#       render json: { errors: @subscription.errors.full_messages }, status: :unprocessable_entity
#     end
#   end
  
#   # def create
#   #   tea = Tea.find(params[:tea_id])
#   #   subscription = @customer.subscriptions.create(subscription_params)
#   #   subscription.teas << tea
#   #   if subscription.save
#   #     render json: SubscriptionSerializer.new(subscription), status: :created
#   #   else
#   #     render json: { error: subscription.errors.full_messages }, status: :unprocessable_entity
#   #   end
#   # end

#   def update
#     subscription = Subscription.find(params[:id])
#     subscription.update(subscription_params)
#     render json: SubscriptionSerializer.new(subscription)
#   end

#   private

#   def get_tea
#     @tea = Tea.find(params[:tea_id])
#   end

#   def subscription_params
#     params.require(:subscription).permit(:title, :price, :frequency, :tea_id)
#   end
# end