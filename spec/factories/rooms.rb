FactoryBot.define do
  factory :room do
  end

  factory :second_room, class: Room do
  end

  factory :third_room, class: Room do
  end

  factory :fourth_room, class: Room do
  end
end
