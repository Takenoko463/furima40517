FactoryBot.define do
  factory :order_shipping_address_form do
    postal_code { '123-4567' }
    prefecture_id { 5 }
    city { '東京都' }
    house_num { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0992511923' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
