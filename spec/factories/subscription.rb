FactoryBot.define do
  factory :subscription do
    title { Faker::FunnyName.name }
    price { Faker::Number.between(from: 1, to: 100) }
    status { Faker::Number.between(from: 0, to: 1) }
    frequency { Faker::Number.between(from: 1, to: 100) }
  end
end