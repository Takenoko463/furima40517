FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.paragraph }
    category_id { Faker::Number.within(range: 2..10) }
    condition_id { Faker::Number.within(range: 2..7) }
    which_delivery_payment_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    time_for_delivery_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..10_000_000) }

    association :user
  end
end
