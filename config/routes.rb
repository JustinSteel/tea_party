Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customer_subscriptions, only: [:create, :index, :update, :destroy]
        # patch '/customer_subscriptions/:id', to: 'customer_subscriptions#update', as: 'update_subscription'
        # get '/customer_subscriptions', to: 'customer_subscriptions#index', as: 'subscriptions'
    end
  end
end