FactoryBot.define do
  factory :review do
    user { nil }
    space { nil }
    comment { "MyText" }
    title { "MyString" }
    rate { 1 }
  end
end
