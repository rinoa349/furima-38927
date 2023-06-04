FactoryBot.define do
  factory :item do
    association :user

    name             { Faker::Name.name }
    description      { Faker::Lorem.paragraph }
    item_status_id   { Faker::Number.between(from: 2, to: 7) }
    prefecture_id    { Faker::Number.between(from: 2, to: 48) }
    category_id      { Faker::Number.between(from: 2, to: 11) }
    shipping_cost_id { Faker::Number.between(from: 2, to: 3) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    price            { Faker::Number.between(from: 300, to: 9_999_999) }

    # afterメソッド。itemインスタンスをbuildした後、画像をつける。
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/dog.test.png'), filename: 'dog.test.png')
    end
  end
end
