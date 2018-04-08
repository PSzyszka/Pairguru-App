FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "user#{n}@mail.com"
    end
    sequence :name do |n|
      "user#{n}"
    end
    confirmed_at Time.current
    password 'password'
    password_confirmation 'password'

    trait :with_comments do
      after(:create) do |user|
        create_list :comment, 5, user: user
      end
    end
  end
end
