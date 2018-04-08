FactoryBot.define do
  factory :comment do
    description { Faker::Lorem.sentence(3, true) }
    movie
    user
  end
end
