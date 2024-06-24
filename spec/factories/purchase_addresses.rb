FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    shipping_origin_id { 2 }
    city { '港区' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '1234567890' }
  end
end
