class Api::V1::CustomerSubscriptionsController < ApplicationController
  before_action :get_customer, only: %i[ index ]
  before_action :get_subscription, only: %i[ index ]
  # get /api/v1/customer_subscriptions
  def index
    @customer_subscription = CustomerSubscription.where(customer_id: @customer.id, subscription_id: @subscription.id)
    @customer_subscriptions = CustomerSubscription.all
    if @customer_subscription.empty?
      render json: { error: "Customer subscription not found" }, status: :not_found
    else
      render json: CustomerSubscriptionSerializer.new(@customer_subscription)
    end
  end

  #  post /api/v1/customer_subscriptions
  def create
    @customer_subscription = CustomerSubscription.new(customer_subscription_params)
    if @customer_subscription.save
      @customer_subscription.subscription.update(status: "active") && @customer_subscription.update(status: "active")
      render json: CustomerSubscriptionSerializer.new(@customer_subscription), status: :created
    else
      render json: { error: @customer_subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end
# patch api/v1/customer_subscriptions/:customer_subscription_id
  def update
    @customer_subscription = CustomerSubscription.find(params[:id])
    if @customer_subscription.update(status: customer_subscription_params[:status])
      render json: CustomerSubscriptionSerializer.new(@customer_subscription), status: :ok
    else
      render json: { error: @customer_subscription.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def cancel_subscription
  #   @customer_subscription = CustomerSubscription.find(params[:id])
  #   @customer_subscription.update(status: "cancelled")
  #   if @customer_subscription.save
  #     render json: CustomerSubscriptionSerializer.new(@customer_subscription), status: :created
  #   else
  #     render json: { error: @customer_subscription.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  private

  def get_customer
    @customer = Customer.find(params[:customer_id])
  end

  def get_subscription
    @subscription = Subscription.find(params[:subscription_id])
  end

  def customer_subscription_params
    params.require(:customer_subscription).permit(:status, :customer_id, :subscription_id)
  end
end