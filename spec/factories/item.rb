FactoryBot.define do
  factory :item do
    name                      { Faker::Name.initials }
    product_description       { 'サンプルです' }
    category_id               { Faker::Number.between(from: 2, to: 11) }
    condition_id              { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id        { Faker::Number.between(from: 2, to: 3) }
    shipping_area_id          { Faker::Number.between(from: 2, to: 48) }
    estimated_shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/image/output-image1.png'), filename: 'output-image1.png')
    end
  end
end
