FactoryBot.define do
  factory :landmark do
    sequence(:name) { |n| "Landmark #{n}" }
    sequence(:lat) { |n| 39.739 +  n * 0.001 }
    sequence(:long) { |n|-104.9903 + n * 0.0015}
    sequence(:address) { |n| "Address #{n}" }
    category { "park" }
    sequence(:phone_number) { |n| "Phone Number #{n}" }
  end
end
