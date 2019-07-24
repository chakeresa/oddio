FactoryBot.define do
  factory :user, class: User do
    sequence(:display_name) { |n| "user_display_name_#{n}" }
    sequence(:email) { |n| "user_email_#{n}" }
    sequence(:first_name) { |n| "user_first_name_#{n}" }
    sequence(:last_name) { |n| "user_last_name_#{n}" }
    role { :user }
  end

  factory :admin, parent: :user do
    sequence(:display_name) { |n| "admin_display_name_#{n}" }
    sequence(:email) { |n| "admin_email_#{n}" }
    sequence(:first_name) { |n| "admin_first_name_#{n}" }
    sequence(:last_name) { |n| "admin_last_name_#{n}" }
    role { :admin }
  end
end
