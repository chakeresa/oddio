FactoryBot.define do
  factory :recording do
    sequence(:title) { |n| "title_#{n}" }
    sequence(:url) { |n| "url_#{n}.mp3" }
    user
    landmark
  end
end
