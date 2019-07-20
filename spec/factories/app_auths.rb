FactoryBot.define do
  factory :app_auth do
    user { nil }
    sequence(:username) { |n| "user_#{n}" }
    password { "password" }
  end
end
