FactoryBot.define do
  factory :pet do
    name { "ポチ" }
    age { 1 }
    size { 1 }
    weight { 1 }
    content { "名前はポチです" }
  end

  factory :second_pet, class: Pet do
    name { "タマ" }
    age { 2 }
    size { 2 }
    weight { 2 }
    content { "名前はタマです" }
  end

  factory :third_pet, class: Pet do
    name { "ミケ" }
    age { 3 }
    size { 3 }
    weight { 3 }
    content { "名前はミケです" }
  end
end
