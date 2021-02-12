FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email(name: 'Geralt') }
    password 'asdfasdf'
    password_confirmation 'asdfasdf'
  end
end
