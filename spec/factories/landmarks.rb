FactoryBot.define do
  factory :landmark do
    name { Faker::Address.community }
    lat { Faker::Address.latitude }
    long { Faker::Address.longitude }
    address { Faker::Address.full_address }
    phone_number { Faker::PhoneNumber.phone_number }
    category { "park" }
    place_id { Faker::Crypto.sha1 }
    website { Faker::Internet.url }
    photo_reference { 'https://lh3.googleusercontent.com/p/AF1QipMSRaKMGzPSpTxaKRFQaakq9McSixbA7lIyBtqg' }
  end
end
