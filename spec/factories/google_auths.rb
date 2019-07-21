FactoryBot.define do
  factory :google_auth do
    user { nil }
    sequence(:uid) { |n| (100000 + n).to_s }
    sequence(:token) { |n| 'token' + (100000 + n).to_s }
  end
end
