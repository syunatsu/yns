FactoryBot.define do
  factory :article do
    name        {Faker::Name.name}
    address     {Faker::Address.city}
    url         {Faker::Internet.url}
    category_id {Faker::Number.within(range:1..9)}   
    association :user

    after(:build) do |article|
      article.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
