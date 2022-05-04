FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username(specifier: 6..15) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
