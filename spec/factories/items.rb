FactoryBot.define do
  factory :item do
    name               { Faker::Name.initials(number: 2) }
    description        { Faker::Lorem.sentence(word_count: 3) }
    category_id        { 2 }
    condition_id       { 2 }
    shipping_charge_id { 2 }
    shipping_origin_id { 2 }
    shipping_day_id    { 2 }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
