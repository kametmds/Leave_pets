FactoryBot.define do
  factory :reservation do
    user { nil }
    pet { nil }
    space { nil }
    start_date { "2019-12-12 16:35:23" }
    end_date { "2019-12-12 16:35:23" }
  end
end
