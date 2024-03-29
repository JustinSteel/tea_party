FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    temperature { Faker::Number.between(from: 100, to: 212) }
    description { Faker::ChuckNorris.fact }
    brew_time { Faker::Number.between(from: 1, to: 5) }
  end
end