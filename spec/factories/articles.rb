FactoryBot.define do
  factory :article do
    address { Faker::Address.full_address }
    shop_name {Faker::Lorem.characters(number: 10)}
    auther_comment {Faker::Lorem.characters(number: 30)}
    wifi {0}
    outlet {0}
    shop_url {Faker::Lorem.characters(number: 30)}
  end
end