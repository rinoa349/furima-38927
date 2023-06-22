FactoryBot.define do
  factory :order_form do
    
    post_code     {1234567.to_s.insert(3, "-")}
    prefecture_id {Faker::Number.between(from:2, to: 48)}
    city          {Faker::Address.city}
    adress        {Faker::Address.street_address}
    building_name {Faker::Address.street_address}
    phone_number  {Faker::Number.leading_zero_number(digits: 11)}
    token         {Faker::Internet.device_token}
  end
end
