FactoryBot.define do
  factory :customer_subscription do
    customer
    subscription
    status { Faker::Number.between(from: 0, to: 1) }
  end
end