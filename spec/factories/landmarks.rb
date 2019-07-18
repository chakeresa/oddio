FactoryBot.define do
  factory :landmark do
    sequence(:name) { |n| "Landmark #{n}" }
    sequence(:lat) { |n| 2n }
    sequence(:long) { |n| 3n }
    sequence(:address) { |n| "Address #{n}" }
    type { "park" }
    sequence(:website) { |n| "Website #{n}" }
    sequence(:phone) { |n| "Phone #{n}" }
    sequence(:photo_url) { |n| "Photo Url #{n}" }
  end
end
