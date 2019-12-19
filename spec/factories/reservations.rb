FactoryBot.define do
  factory :reservation do
    user { User.first || association(:user) }
    pet_ids { Pet.first(2).pluck(:id) }
    space { Space.first || association(:space) }
    start_date { "2019-12-12 16:35:23" }
    end_date { "2019-12-12 16:35:23" }
  end

  factory :second_reservation, class: Reservation do
    user { User.first || association(:user) }
    pet_ids { Pet.last(2).pluck(:id) }
    space { Space.first || association(:space) }
    start_date { "2019-12-12 16:35:23" }
    end_date { "2019-12-12 16:35:23" }
  end

  factory :third_reservation, class: Reservation do
    user { User.first || association(:user) }
    pet_ids { Pet.last(2).pluck(:id) }
    space { Space.first || association(:space) }
    start_date { "2019-12-12 16:35:23" }
    end_date { "2019-12-12 16:35:23" }
  end

  factory :fourth_reservation, class: Reservation do
    user { User.find_by(id: User.first.id + 1) || association(:second_user) }
    pet_ids { Pet.last(2).pluck(:id) }
    space { Space.find_by(id: Space.first.id + 1) || association(:second_space) }
    start_date { "2019-12-12 16:35:23" }
    end_date { "2019-12-12 16:35:23" }
  end
end
