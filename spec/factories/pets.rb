FactoryBot.define do
  factory :pet do
    name { "ポチ" }
    age { 1 }
    size { 1 }
    weight { 1 }
    content { "名前はポチです" }
    user { User.first || association(:user) }
  end

  factory :second_pet, class: Pet do
    name { "タマ" }
    age { 2 }
    size { 2 }
    weight { 2 }
    content { "名前はタマです" }
    user { User.first }
  end

  factory :third_pet, class: Pet do
    name { "ミケ" }
    age { 3 }
    size { 3 }
    weight { 3 }
    content { "名前はミケです" }
    user { User.first }
  end

  factory :fourth_pet, class: Pet do
    name { "シロ" }
    age { 4 }
    size { 4 }
    weight { 4 }
    content { "名前はシロです" }
    user { User.find_by(id: User.first.id + 1) || association(:second_user) }
  end
end
