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
    photo_reference { 'CmRaAAAA58Iy6Em8ucPC_-OCxKTJ-p7YKDBUQ4mgVZj4qlFN6j2JhXKSfteprF-Ckca73TjXaYUtNk-trEbhBCWoUcWWsO42KRap_rlw4teWz4hqBU57sAoTl3-myl_4xjOw3LmBEhBTUAINq_SeOPXlwudc8ccKGhSH-pCQxOO6rRE-O1zFKPW1-h3OqA' }
    md5_hash { Faker::Crypto.md5 }
  end
end
