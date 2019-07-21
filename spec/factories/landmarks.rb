FactoryBot.define do
  factory :landmark do
    sequence(:name) { |n| "Landmark #{n}" }
    sequence(:lat) { |n| 39.739 +  n * 0.001 }
    sequence(:long) { |n|-104.9903 + n * 0.0015}
    sequence(:address) { |n| "Address #{n}" }
    sequence(:phone_number) { |n| "Phone #{n}" }
    category { "park" }
    sequence(:place_id) { |n| "DKJN3443jhjn223h#{n}" }
    sequence(:website) { |n| "Website #{n}" }
    photo_reference { 'CmRaAAAA58Iy6Em8ucPC_-OCxKTJ-p7YKDBUQ4mgVZj4qlFN6j2JhXKSfteprF-Ckca73TjXaYUtNk-trEbhBCWoUcWWsO42KRap_rlw4teWz4hqBU57sAoTl3-myl_4xjOw3LmBEhBTUAINq_SeOPXlwudc8ccKGhSH-pCQxOO6rRE-O1zFKPW1-h3OqA' }
  end
end
