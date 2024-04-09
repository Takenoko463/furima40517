FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    prefecture { 5 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '08027328450' }

    association :user
    association :item
  end
end
