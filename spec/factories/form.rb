FactoryBot.define do
  factory :form do
    post_code { '123-4567' }
    shipping_area_id { Faker::Number.between(from: 2, to: 48) }
    municipalities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011110000' }
    token { 2000 }

    association :user
    association :item
  end
end
