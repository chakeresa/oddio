FactoryBot.define do
  factory :user, class: User do
    sequence(:username) { |n| "user_#{n}" }
    password { 'password' }
    role { :user }
  end

  factory :admin, parent: :user do
    sequence(:username) { |n| "admin_#{n}" }
    role { :admin }
  end
end
