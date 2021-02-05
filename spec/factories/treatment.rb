FactoryBot.define do
  factory :treatment do
    name { Faker::Lorem.sentence(word_count: 3) }
    price { Faker::Number.number(digits: 5) }
    desc { Faker::Lorem.paragraph(sentence_count: 2) }
  end
end
