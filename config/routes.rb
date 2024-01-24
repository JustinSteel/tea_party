Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/customers/:id/subscriptions', to: 'customers#subscriptions'
    end
  end
end
