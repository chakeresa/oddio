FactoryBot.define do
  factory :tour do
    user
    sequence(:title) { |n| "tour_title_#{n}" }
  end
end
